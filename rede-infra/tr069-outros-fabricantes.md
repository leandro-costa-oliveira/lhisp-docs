---
title: TR-069 — Provisionamento em outros fabricantes (Huawei, Juniper, Cisco)
published: true
editor: markdown
description: ''
---

# TR-069 — Provisionamento em outros fabricantes (Huawei, Juniper, Cisco)

> **⚠️ Rascunho — não homologado**
>
> Esta página é um **draft** de referência. Os comandos abaixo **não foram
> validados/homologados** em equipamento real e podem variar conforme o modelo,
> a versão de firmware e a topologia do provedor. **Valide em laboratório antes
> de aplicar em produção.** Diferente do MikroTik, o LHISP **não** aplica essa
> configuração automaticamente nesses fabricantes.

## Objetivo

Mostrar como preparar **manualmente** a **rede de provisionamento TR-069** em
concentradores **Huawei**, **Juniper** e **Cisco**, replicando o que o LHISP faz
de forma **automática apenas no MikroTik** (via SSH / `ServidorComandos`).

O alvo é o mesmo do setup MikroTik: expor uma VLAN dedicada onde as **CPEs**:

- pegam IP por **DHCP** numa VLAN isolada;
- **descobrem o ACS** pela **DHCP option 43** (sub-opção 1 = URL do ACS);
- ficam **confinadas** (ACL/firewall) a falar **só com o ACS** (host LHISP na 443),
  sem acesso à internet;
- iniciam a sessão TR-069 (a CPE sempre inicia — o ACS é passivo).

> Contexto e arquitetura do módulo: ver o plano interno
> **PLANO_INTEGRACAO_TR069_MIKROTIK** (repositório `lhisp-manager`).

## Automação por fabricante

| Fabricante | Configuração da rede de provisionamento TR-069 |
|---|---|
| **MikroTik** | **Automática** pelo LHISP (VLAN + pool + DHCP + option 43 + firewall) via SSH. |
| **Huawei** | **Manual** — usar os exemplos desta página. |
| **Juniper** | **Manual** — usar os exemplos desta página. |
| **Cisco** | **Manual** — usar os exemplos desta página. |

> Para Huawei/Juniper/Cisco, o cadastro do servidor no LHISP segue normalmente
> (ver [Cadastrar servidor](/rede-infra/cadastrar-servidor)), mas a rede de
> provisionamento TR-069 precisa ser configurada **na mão** no equipamento.

## Quando usar

- O provedor usa um concentrador **Huawei / Juniper / Cisco** (não MikroTik) e
  quer disponibilizar a rede de provisionamento TR-069 para as CPEs.
- Já existe um **ACS** publicado (path `/tr069` no host do tenant).

## Pré-requisitos

- Acesso administrativo ao concentrador (console/SSH) com permissão para alterar
  VLAN, DHCP e ACL/firewall.
- **URL pública do ACS** (ex.: `https://demo.lhprovedor.com.br/tr069`).
- **IP público do host LHISP** (onde o `lhisp-nginx` atende o tenant, na 443).
- Uma **VLAN** e uma **faixa de IP** livres, sem conflito com o range PPPoE.
- Validação prévia em **laboratório** — este documento é um rascunho.

## Parâmetros de exemplo

Os exemplos usam os mesmos valores do recipe MikroTik, só para referência.
**Substitua pelos valores reais do provedor.**

| Parâmetro | Exemplo |
|---|---|
| Porta de acesso | `GigabitEthernet0/0/5` (ajuste por fabricante) |
| VLAN de provisionamento | `46` |
| Rede / pool | `100.64.46.0/24` |
| Gateway da VLAN | `100.64.46.1` |
| Faixa entregue às CPEs | `100.64.46.10` – `100.64.46.254` |
| URL do ACS | `https://demo.lhprovedor.com.br/tr069` |
| IP público do LHISP | `<IP_LHISP>` (ex.: `203.0.113.10`) |

> **Sobre a DHCP option 43:** CPEs TR-069 esperam a **URL do ACS na sub-opção 1**.
> Alguns equipamentos aceitam a URL em ASCII direto; outros exigem a codificação
> **TLV em hexadecimal**: `01 <comprimento> <URL em ASCII>`. Ex.: para
> `http://a` (`0x68 0x74 0x74 0x70 ...`), o campo fica `01 08 68 74 74 70 3A 2F 2F 61`.
> **Confirme a codificação aceita pela CPE-alvo em homologação.** As CPEs
> sinalizam vendor class `dslforum.org` (option 60).

---

## Huawei (VRP)

```text
system-view

# 1) VLAN de provisionamento
vlan 46
 description TR069-PROV
quit

# 2) Interface L3 (gateway) da VLAN
interface Vlanif46
 ip address 100.64.46.1 255.255.255.0
quit

# 3) Porta de acesso na VLAN (ajuste a interface conforme o cenário)
interface GigabitEthernet0/0/5
 port link-type access
 port default vlan 46
quit

# 4) DHCP com descoberta do ACS (option 43, sub-opção 1 = URL)
dhcp enable
ip pool tr069-pool-46
 gateway-list 100.64.46.1
 network 100.64.46.0 mask 255.255.255.0
 # Preferir a codificação TLV em hex quando a CPE exigir (ver nota acima):
 option 43 sub-option 1 ascii https://demo.lhprovedor.com.br/tr069
quit
interface Vlanif46
 dhcp select global
quit

# 5) Confinamento: só alcança o LHISP (nginx) na 443; resto é negado
acl number 3069
 rule 5  permit tcp source 100.64.46.0 0.0.0.255 destination <IP_LHISP> 0 destination-port eq 443
 rule 10 deny ip source 100.64.46.0 0.0.0.255
quit
interface Vlanif46
 traffic-filter inbound acl 3069
quit

save
```

## Juniper (JUNOS)

```text
# 1) VLAN + interface L3 (gateway)
set vlans tr069-prov vlan-id 46
set interfaces irb unit 46 family inet address 100.64.46.1/24
set vlans tr069-prov l3-interface irb.46

# 2) Porta de acesso na VLAN (ajuste a interface)
set interfaces ge-0/0/5 unit 0 family ethernet-switching vlan members tr069-prov

# 3) DHCP local server + pool com descoberta do ACS
set system services dhcp-local-server group tr069 interface irb.46
set access address-assignment pool tr069 family inet network 100.64.46.0/24
set access address-assignment pool tr069 family inet range r1 low 100.64.46.10 high 100.64.46.254
set access address-assignment pool tr069 family inet dhcp-attributes router 100.64.46.1
# Option 43 em hex-string (TLV sub-opção 1 = URL do ACS — ver nota acima):
set access address-assignment pool tr069 family inet dhcp-attributes option 43 hex-string <hex_da_option_43>

# 4) Confinamento: só alcança o LHISP (nginx) na 443; resto é descartado
set firewall family inet filter TR069-CONFINE term acs from destination-address <IP_LHISP>/32
set firewall family inet filter TR069-CONFINE term acs from protocol tcp
set firewall family inet filter TR069-CONFINE term acs from destination-port 443
set firewall family inet filter TR069-CONFINE term acs then accept
set firewall family inet filter TR069-CONFINE term block then discard
set interfaces irb unit 46 family inet filter input TR069-CONFINE
```

## Cisco (IOS / IOS-XE)

```text
! 1) VLAN + interface L3 (gateway)
vlan 46
 name TR069-PROV
!
interface Vlan46
 ip address 100.64.46.1 255.255.255.0
 ip access-group TR069-CONFINE in
!
! 2) Porta de acesso na VLAN (ajuste a interface)
interface GigabitEthernet0/5
 switchport mode access
 switchport access vlan 46
!
! 3) DHCP com descoberta do ACS (option 43, sub-opção 1 = URL)
ip dhcp excluded-address 100.64.46.1 100.64.46.9
ip dhcp pool TR069-PROV
 network 100.64.46.0 255.255.255.0
 default-router 100.64.46.1
 ! Alguns IOS aceitam ASCII; outros exigem a forma hex (TLV) — ver nota acima:
 option 43 ascii "https://demo.lhprovedor.com.br/tr069"
!
! 4) Confinamento: só alcança o LHISP (nginx) na 443; resto é negado
ip access-list extended TR069-CONFINE
 permit tcp 100.64.46.0 0.0.0.255 host <IP_LHISP> eq 443
 deny   ip 100.64.46.0 0.0.0.255 any
!
end
write memory
```

## Resultado esperado

- A CPE, ao subir na VLAN de provisionamento, pega IP por DHCP e recebe a **URL
  do ACS** via option 43.
- A CPE **só alcança** o host LHISP (nginx) na 443 — sem navegação/internet.
- A CPE inicia a sessão TR-069; o ACS registra o `Inform` (inventário/telemetria).

## Problemas comuns

| Problema | Como tratar |
|---|---|
| CPE não recebe IP | Confirme a associação porta ↔ VLAN e o DHCP server/pool na VLAN. |
| CPE pega IP mas não fala com o ACS | Revise a **option 43** (codificação ASCII × hex TLV) e a URL do ACS. |
| CPE navega na internet (não confinou) | Revise a ACL/firewall: só permitir `<IP_LHISP>:443`; negar o resto. |
| Conflito de faixa com PPPoE | Escolha VLAN/pool que **não** colidam com o range de assinantes. |
| ACS não recebe `Inform` | Verifique roteamento até o `<IP_LHISP>` na 443 e o certificado TLS do host. |

## Observações

- Estes comandos são **equivalentes lógicos** do recipe MikroTik automatizado
  pelo LHISP; a sintaxe/exata varia por modelo e firmware.
- O confinamento (ACL/firewall) é a **fronteira de segurança** da rede de
  provisionamento — trate-o como obrigatório, não opcional.
- O LHISP não gerencia a CPE ativamente: toda sessão é **iniciada pela CPE**.

## Dúvidas para revisão

- Qual a codificação exata da **option 43** aceita pelas CPEs-alvo do provedor
  (ASCII direto × TLV hex)?
- A topologia usa VLAN tagueada na porta de acesso ou tratamento na L3?
- Há necessidade de NAT na saída para o `<IP_LHISP>` (como no MikroTik) ou o
  roteamento direto já atende?
- Vale a pena o LHISP **gerar os comandos** (mesmo sem aplicar via SSH) para
  esses fabricantes, como assistente de configuração?

## Screenshots sugeridos

- Cadastro do servidor Huawei/Juniper/Cisco no LHISP: `assets/screenshots/rede-infra/tr069-outros-fabricantes-servidor.png`
