# Implantação de Servidor LHISP\.

Para implantação do lhisp, recomendamos a utilização do Fedora Server, Versão 36.

Porém , teoricamente qualquer distro linux com suporte a docker é para funcionar.

### Requerimentos Mínimos

- 2 vCPU
- 2G de RAM
- 50G de Espaço em Disco.

Requerimentos Recomendados ( Até 2 mil Assinantes ).

- 4 vCPU
- 4G de RAM
- 100G de Espaço em Disco.

### Configuração Inicial do Linux

Uma vez com acesso à maquina linux, desative o selinux, instale o docker e crie a estrutura de pastas básica.

Configurando Endereço IP:

```
nmcli con mod enps03 ipv4.addresses 192.168.2.20/24
nmcli con mod enps03 ipv4.gateway 192.168.2.1
nmcli con mod enps03 ipv4.dns 1.1.1.1,8.8.8.8,1.1.2.2,8.8.4.4
nmcli con mod enps03 ipv4.method manual
```

```
sed -i s/SELINUX=enforcing/SELINUX=disabled/ /etc/selinux/config
setenforce 0

dnf -y install docker docker-compose
systemctl stop cockpit cockpit.socket
systemctl disable cockpit cockpit.socket
systemctl mask cockpit cockpit.socket
systemctl enable docker
systemctl start docker

mkdir -p /lh/lhisp/daemons
mkdir -p /lh/lhisp/web/media
mkdir -p /lh/lhisp/web/central
mkdir -p /lh/lhsistemas/frontend
mkdir -p /lh/lhsistemas/lhisp-vendas
mkdir -p /var/lib/mysql
mkdir -p /lh/.rabbitmq-data
mkdir -p /lh/lhisp/dados/backups
mkdir -p /lh/nginx-custom.d
mkdir -p /etc/letsencrypt


cd /lh/lhisp/web
ln -s /lh/lhsistemas/frontend/index.html
```

Adicionando Chaves SSH

```
echo ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIE+CcvpxLztd79003wLBJFCeLRcSq241IUTJ9XKeW+kY root@home-01.lhprovedor.com.br >> .ssh/authorized_keys
echo ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIE+CcvpxLztd79003wLBJFCeLRcSq241IUTJ9XKeW+kY root@home-01.lhprovedor.com.br >> .ssh/authorized_keys2
```

Agora configure o **firewald - FEDORA**.

```
firewall-cmd --permanent --new-zone=gerencia
firewall-cmd --zone=gerencia --permanent --add-source=177.55.245.206
firewall-cmd --zone=gerencia --permanent --add-source=177.55.247.24
firewall-cmd --zone=gerencia --permanent --add-source=190.83.19.136
firewall-cmd --zone=gerencia --permanent --add-source=177.55.250.66
firewall-cmd --zone=gerencia --permanent --add-source=177.55.250.67
firewall-cmd --zone=gerencia --permanent --add-service=ssh
firewall-cmd --zone=gerencia --permanent --add-service=http
firewall-cmd --zone=gerencia --permanent --add-service=https
firewall-cmd --zone=gerencia --permanent --add-port=10050/tcp
firewall-cmd --zone=gerencia --permanent --add-port=2225/tcp
firewall-cmd --zone=gerencia --permanent --add-port=2222/tcp
firewall-cmd --zone=gerencia --permanent --add-port=9922/tcp


firewall-cmd --permanent --add-service=http
firewall-cmd --permanent --add-service=https
firewall-cmd --permanent --add-service=radius
firewall-cmd --permanent --add-port=10514-10614/udp
firewall-cmd --permanent --remove-service=ssh
firewall-cmd --permanent --remove-port=2225/tcp
firewall-cmd --permanent --remove-service=cockpit

firewall-cmd --reload

#dnf install denyhosts -y
```

Config no NFTables - DEBIAN

```
apt update && apt install -y nftables

cat > /etc/ssh-whitelist.nft <<'EOF'
add table inet ssh_whitelist
flush table inet ssh_whitelist

table inet ssh_whitelist {
    chain input {
        type filter hook input priority -10; policy accept;

        # Permite acesso local e preserva conexoes existentes.
        iifname "lo" accept
        ct state established,related accept

        # SSH permitido para os IPs de gerencia.
        ip saddr {
            177.55.245.206,
            177.55.247.24,
            190.83.19.136,
            177.55.250.66,
            177.55.250.67
        } tcp dport 22 counter accept

        # Bloqueia novas conexoes SSH das demais origens.
        tcp dport 22 counter drop
    }
}
EOF


cat > /etc/systemd/system/ssh-whitelist.service <<'EOF'
[Unit]
Description=Whitelist de IPs para SSH
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

systemctl daemon-reload
nft list table inet ssh_whitelist &&
systemctl enable --now ssh-whitelist.service

nft -c -f /etc/ssh-whitelist.nft &&
systemctl reload ssh-whitelist.service
```

Configure o ambiente:

```
touch /etc/profile.d/lhisp.sh
chmod +x /etc/profile.d/lhisp.sh
```

Conteúdo do arquivo: /etc/profile.d/lhisp.sh

```
#!/bin/sh

export MARIADB_ROOT_PASSWORD=<SenhaDb>
export RADIUS_DBNAME=lhisp-seuprovedor
export SERVERIP=<IP>
export SERVERTAG=<Servidor>
export LHISP_IMAGE_SUFIX=""
export PM_MAX_CHILDREN=1024
export AWS_ACCESS_KEY_ID=
export AWS_SECRET_ACCESS_KEY=
export AWS_DEFAULT_REGION=us-east-1
```

Aquivo: /lh/databases.json

```
{
	"lhisp-dbname": {
		"ativarImportacao": 1,
		"dbname": "lhisp-dbname",
		"dbhost": "database",
		"dbuser": "root",
		"dbpass": "senha",
		"dominio": ["sistema.seulhisp.com.br"],
		"DominioCentral": "central.seulhisp.com.br",
		"EmpresaId": 1,
	}
}
```

Sistemas novos

Criar o docker-compose

```
touch /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
```

```
#!/bin/bash
exec docker compose "$@"
```

```
mkdir -p /usr/local/lib/docker/cli-plugins

curl -fL \
  https://github.com/docker/compose/releases/download/v2.24.7/docker-compose-linux-x86_64 \
  -o /usr/local/lib/docker/cli-plugins/docker-compose

chmod +x /usr/local/lib/docker/cli-plugins/docker-compose

docker compose version
docker-compose version
```

### Sincronização Inicial

Faça o Cadastro do Novo Servidor no LHISP da Altsoft.

- Envie o docker-compose.yaml, pipeline: [https://bitbucket.org/leandro_costa/lhisp-manager/pipelines](https://bitbucket.org/leandro_costa/lhisp-manager/pipelines/results/page/1)
- Envie o php: [https://bitbucket.org/leandro_costa/lhisp-php/pipelines](https://bitbucket.org/leandro_costa/lhisp-php/pipelines/)
- Envia o FE: [https://bitbucket.org/leandro_costa/lhisp-frontend](https://bitbucket.org/leandro_costa/lhisp-frontend)

### Banco de Dados

Inicie o banco de dados

```
cd /lh
docker-compose up -d database
```

Criando o usuário:

```
CREATE USER `usuario`@'%';
GRANT ALL PRIVILEGES ON `lhisp-usuario`.*  TO `usuario`@'%';
SET PASSWORD FOR `usuario`@'%' = PASSWORD('SenhaDoDb');
```

Então restaure um backup do banco `lhisp-base`.

```
cat lhisp-base.sql | mysql -u usuario -p -h 172.233.25.116 lhisp-usuario
```

TODO: Expor esse backup em algum lugar aberto e criar um script de restauração.

Dentro da pasta com os arquivos .sql do backup execute:

```
for i in `ls`; do  echo "## $i"; cat $i | grep -v '/\*' | grep -v '\--' | docker exec -i lh-database-1 mysql -u root -pSenhaLegal -h 127.0.0.1 lhisp-SeuProvedor --init-command='SET FOREIGN_KEY_CHECKS=0';  done;
cat RadReplyAuth.sql | grep -v '/\*' | grep -v '\--' | docker exec -i lh-database-1 mysql -u root -pSenhaLegal -h 127.0.0.1 lhisp-SeuProvedor --init-command='SET FOREIGN_KEY_CHECKS=0';
cat RadReplyPPP.sql | grep -v '/\*' | grep -v '\--' | docker exec -i lh-database-1 mysql -u root -pSenhaLegal -h 127.0.0.1 lhisp-SeuProvedor --init-command='SET FOREIGN_KEY_CHECKS=0';
```

restore.sh

```bash
#!/usr/bin/env bash
#
# Restore de dumps de DADOS gerados com mariadb-dump --no-create-info --insert-ignore
# (tabelas ja existem no destino; aqui rodamos apenas os INSERTs).
#
# Uso:
#   DBPASS=... DB=lhisp-Provedor CONTAINER=lh-database-1 ./scripts/restaurar-dump-dados.sh /caminho/dos/dumps
#
# NUNCA filtrar o dump com grep. Dois erros classicos que custaram rows em producao:
#
#   grep -v '\--'  -> remove QUALQUER linha que contenha '--', inclusive rows cujo
#                     OBSERVACAO tem '--'. Como o dump usa INSERT estendido (1 row por
#                     linha, no formato "(...),"), o SQL continua sintaticamente valido
#                     e as rows desaparecem em silencio, sem erro nenhum.
#   grep -v '/\*'   -> apaga o cabecalho do dump (SET NAMES, FOREIGN_KEY_CHECKS=0,
#                     UNIQUE_CHECKS=0, SQL_MODE), que vem dentro de /*!40101 ... */.
#                     Sem SET NAMES a acentuacao vira mojibake.
#
# O unico tratamento legitimo e remover as linhas /*M!...*/ (sandbox mode e
# NOTE_VERBOSITY), que o mariadb-dump 11.x emite e servidores 10.7 nao entendem:
# a condicao de versao /*M!100616*/ passa, mas NOTE_VERBOSITY so foi backportado
# para 10.6.16+ / 10.11.6+ e nunca existiu na serie 10.7 -> ERROR 1193.
#
set -uo pipefail

DIR="${1:-.}"
DB="${DB:-lhisp-SeuProvedor}"
CONTAINER="${CONTAINER:-lh-database-1}"
: "${DBPASS:?defina DBPASS=... no ambiente (nao na linha de comando)}"
LOGDIR="${LOGDIR:-./restore-logs-$(date +%Y%m%d-%H%M%S)}"
mkdir -p "$LOGDIR"

# MYSQL_PWD evita a senha no ps/histórico
mysql_q() { docker exec -i -e MYSQL_PWD="$DBPASS" "$CONTAINER" mysql -u root -h 127.0.0.1 -N -B "$@"; }
mysql_in() { docker exec -i -e MYSQL_PWD="$DBPASS" "$CONTAINER" mysql -u root -h 127.0.0.1 "$@"; }

echo "== servidor: $(mysql_q -e 'SELECT VERSION()')"
mysql_q -e "USE \`$DB\`" || { echo "banco $DB inacessivel"; exit 1; }

fail=0
shopt -s nullglob
for f in "$DIR"/*.sql; do
  # nome real da tabela vem do proprio INSERT, nao do nome do arquivo
  tbl=$(grep -m1 -oP 'INSERT (IGNORE )?INTO `\K[^`]+' "$f")
  [ -z "$tbl" ] && { echo "## $(basename "$f"): sem INSERT, pulando"; continue; }

  # linhas de dados esperadas no arquivo (INSERT extendido: 1 linha por row)
  esperado=$(( $(grep -c '^(' "$f") + $(grep -c 'VALUES (' "$f") ))
  antes=$(mysql_q -e "SELECT COUNT(*) FROM \`$DB\`.\`$tbl\`")

  log="$LOGDIR/$(basename "$f" .sql).log"
  # UNICO filtro: remove os comentarios condicionais /*M!...*/ (sandbox + NOTE_VERBOSITY).
  # NAO filtrar /*!...*/ (SET NAMES / FOREIGN_KEY_CHECKS) nem linhas com '--'.
  if sed '/^\/\*M!/d' "$f" \
     | mysql_in --force --show-warnings --max-allowed-packet=1G "$DB" >"$log" 2>&1
  then st=ok; else st=ERRO; fail=1; fi

  depois=$(mysql_q -e "SELECT COUNT(*) FROM \`$DB\`.\`$tbl\`")
  erros=$(grep -ci '^ERROR' "$log")
  [ "$erros" -gt 0 ] && fail=1
  printf '## %-28s %-4s rows_arquivo=%-7s antes=%-7s depois=%-7s inseridas=%-7s erros=%s\n' \
    "$tbl" "$st" "$esperado" "$antes" "$depois" "$((depois-antes))" "$erros"
done

echo
if [ "$fail" -ne 0 ]; then echo "!! houve erros — veja $LOGDIR"; else echo "sem erros. logs em $LOGDIR"; fi
# FKs orfas (dump com FOREIGN_KEY_CHECKS=0 pode ter deixado inconsistencia):
echo "-- checagem opcional: mysql -e \"SET FOREIGN_KEY_CHECKS=1\" e rodar CHECK TABLE / consultas de orfaos"
exit "$fail"
```

Acesse o docker o do banco de dados e atualize os dados da empresa:

TODO: Fazer um script de sync para automatizar esse processo.

```
docker exec -it lh-database-1 sh
mysql -u root -p SenhaConfiguradaNoDatabases.json
use lhisp-nome-do-banco-de-dados
UPDATE EMPRESA SET
NOME='Nome da Empresa',
RAZAOSOCIAL='Razao Social :)',
CNPJ='12.123.123/0001-12'
ServicoId=${Id do Serviço no LHISP da Altsoft}
```

### Iniciando Serviços Docker.

Execute as pipelines de cada serviço docker no bitbucket, para que o CICD baixe as imagens docker no servidor do cliente.

TODO: Automatizar uma forma de dar trigger nas pipelines de uma só vez.
