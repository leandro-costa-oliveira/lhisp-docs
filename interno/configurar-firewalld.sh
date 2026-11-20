#!/usr/bin/env bash
set -euo pipefail

# Configuracao compartilhada por Debian, Fedora e CentOS.
ips_gerencia=(
    177.55.245.206
    177.55.247.24
    190.83.19.136
    177.55.250.66
    177.55.250.67
)
portas_gerencia=(10050 2225 2222 9922)

identificar_backend() {
    [[ -r /etc/os-release ]] || {
        echo "Nao foi possivel identificar a distribuicao." >&2
        return 1
    }
    . /etc/os-release
    case "${ID:-}" in
        debian) printf 'nftables\n' ;;
        fedora|centos) printf 'firewalld\n' ;;
        *)
            echo "Distribuicao nao suportada: ${ID:-desconhecida}" >&2
            return 1
            ;;
    esac
}

configurar_debian() {
    local backup arquivo ips_nft portas_nft

    if ! command -v nft >/dev/null; then
        apt-get update
        apt-get install -y nftables
    fi

    backup=$(mktemp -d /root/ssh-whitelist-backup.XXXXXX)
    for arquivo in /etc/ssh-whitelist.nft /etc/systemd/system/ssh-whitelist.service; do
        if [[ -f "$arquivo" ]]; then
            cp -a "$arquivo" "$backup/"
        fi
    done
    printf 'Backup: %s\n' "$backup"

    ips_nft=$(IFS=,; printf '%s' "${ips_gerencia[*]}")
    portas_nft=$(IFS=,; printf '%s' "22,${portas_gerencia[*]}")

    # Reutiliza a tabela criada no Debian anteriormente.
    # Somente as portas de gerencia recebem novas restricoes.
    cat > "$backup/ssh-whitelist.nft.novo" <<EOF
add table inet ssh_whitelist
flush table inet ssh_whitelist

table inet ssh_whitelist {
    chain input {
        type filter hook input priority -10; policy accept;

        iifname "lo" accept
        ct state established,related accept

        ip saddr { $ips_nft } tcp dport { $portas_nft } counter accept
        tcp dport { $portas_nft } counter drop
    }
}
EOF

    # Valida antes de substituir os arquivos persistentes ou aplicar regras.
    nft -c -f "$backup/ssh-whitelist.nft.novo"

    cat > "$backup/ssh-whitelist.service.novo" <<'EOF'
[Unit]
Description=Whitelist de IPs para SSH e gerencia
DefaultDependencies=no
After=nftables.service
Wants=network-pre.target
Before=network-pre.target shutdown.target
Conflicts=shutdown.target

[Service]
Type=oneshot
RemainAfterExit=yes
ExecStart=/usr/sbin/nft -f /etc/ssh-whitelist.nft
ExecReload=/usr/sbin/nft -f /etc/ssh-whitelist.nft
ExecStop=/usr/sbin/nft delete table inet ssh_whitelist

[Install]
WantedBy=sysinit.target
EOF

    install -m 644 "$backup/ssh-whitelist.nft.novo" /etc/ssh-whitelist.nft
    install -m 644 "$backup/ssh-whitelist.service.novo" \
        /etc/systemd/system/ssh-whitelist.service

    systemctl daemon-reload
    if systemctl is-active --quiet ssh-whitelist.service; then
        systemctl reload ssh-whitelist.service
    else
        systemctl start ssh-whitelist.service
    fi
    systemctl enable ssh-whitelist.service
    nft list table inet ssh_whitelist
}

configurar_firewalld() {
    local backup zona_anterior zona ip servico porta
    command -v firewall-offline-cmd >/dev/null
    command -v firewall-cmd >/dev/null

    backup=$(mktemp -d /root/firewalld-backup.XXXXXX)
    cp -a /etc/firewalld "$backup/config"
    printf 'Backup: %s/config\n' "$backup"

    # Configuracao offline: compativel com CentOS 7 e Fedora.
    systemctl stop firewalld
    zona_anterior=$(firewall-offline-cmd --get-default-zone)
    if [[ "$zona_anterior" != "public" ]]; then
        firewall-offline-cmd --set-default-zone=public
    fi
    install -d -m 755 /etc/firewalld/zones

    # Remove as definicoes locais; as zonas nativas em /usr/lib sao preservadas.
    for zona in "$zona_anterior" gerencia public bitbucket; do
        rm -f -- "/etc/firewalld/zones/$zona.xml" "/etc/firewalld/zones/$zona.xml.old"
    done

    # Public e nativa: uma definicao vazia substitui suas regras anteriores.
    printf '<?xml version="1.0" encoding="utf-8"?>\n<zone/>\n' \
        > /etc/firewalld/zones/public.xml
    firewall-offline-cmd --new-zone=gerencia

    # --change-source move o IP caso ele esteja em outra zona, como trusted.
    for ip in "${ips_gerencia[@]}"; do
        firewall-offline-cmd --zone=gerencia --change-source="$ip"
    done

    for servico in ssh http https; do
        firewall-offline-cmd --zone=gerencia --add-service="$servico"
    done

    for porta in "${portas_gerencia[@]}"; do
        firewall-offline-cmd --zone=gerencia --add-port="$porta/tcp"
    done

    for servico in http https radius; do
        firewall-offline-cmd --zone=public --add-service="$servico"
    done
    firewall-offline-cmd --zone=public --add-port=10514-10614/udp

    if command -v restorecon >/dev/null; then
        restorecon -RF /etc/firewalld
    fi

    # Confere as definicoes antes de iniciar o servico.
    firewall-offline-cmd --zone=gerencia --list-all
    firewall-offline-cmd --zone=public --list-all

    systemctl unmask firewalld
    systemctl start firewalld
    firewall-cmd --get-active-zones
}

main() {
    [[ $EUID -eq 0 ]] || {
        echo "Execute este script como root." >&2
        exit 1
    }
    command -v systemctl >/dev/null
    local backend
    backend=$(identificar_backend)

    # Interrompe antes de alterar o firewall se a sessao SSH ficaria bloqueada.
    if [[ -n "${SSH_CONNECTION:-}" ]]; then
        read -r ip_ssh porta_cliente ip_servidor porta_ssh <<< "$SSH_CONNECTION"
        [[ " ${ips_gerencia[*]} " == *" $ip_ssh "* ]] || {
            echo "Seu IP atual ($ip_ssh) nao esta na whitelist. Ajuste ips_gerencia." >&2
            exit 1
        }
        [[ " 22 ${portas_gerencia[*]} " == *" $porta_ssh "* ]] || {
            echo "A porta SSH atual ($porta_ssh) nao esta liberada. Ajuste portas_gerencia." >&2
            exit 1
        }
    fi

    printf 'Configurando firewall com %s.\n' "$backend"
    case "$backend" in
        nftables)
            configurar_debian
            ;;
        firewalld)
            configurar_firewalld
            echo "Para habilitar no boot apos o teste: systemctl enable firewalld"
            ;;
    esac
    echo "Configuracao aplicada. Teste uma nova conexao SSH antes de fechar esta sessao."
}

if [[ "${BASH_SOURCE[0]}" == "$0" ]]; then
    main "$@"
fi
