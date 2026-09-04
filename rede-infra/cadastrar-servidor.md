---
title: Cadastrar servidor
published: true
editor: markdown
description: Cadastro do equipamento que concentra acessos e integra provisionamento, RADIUS, SNMP, comandos e backups.
---

# Cadastrar servidor

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.

No módulo de Rede e Infraestrutura, **servidor** é o registro operacional de um roteador, concentrador PPPoE, gateway, ponto de acesso ou outro equipamento gerenciado. Ele não guarda apenas endereço e credenciais: redes e acessos de clientes apontam para esse registro, e serviços do LHISP o usam para RADIUS, provisionamento, coleta SNMP, alertas, comandos e backups.

Uma configuração incorreta pode afetar todos os assinantes associados. Cadastre o equipamento somente depois de definir IP de gestão, caminho de conexão, credenciais, interfaces e função na topologia.

## Criar o cadastro

Em **Rede e Infraestrutura → Servidores**, clique em **Novo** e informe pelo menos **Tipo**, **Nome** e **Endereço IP**. O backend normaliza e valida o IP e não permite outro servidor com a mesma combinação de IP e porta SSH.

Depois de salvar, o cadastro ganha as abas **Redes**, **IPv4**, **IPv6**, **CGNAT**, **Interfaces**, **Rotas**, **Traps**, **Backups**, **Gráficos** e **Histórico**. O conteúdo dessas abas depende dos recursos e do fabricante do equipamento.

## Identidade e caminho de conexão

| Campo | Função no sistema |
|---|---|
| **Ponto de Presença** | Localiza o equipamento na topologia e participa de filtros e vínculos de rede. |
| **Conectar por** | Define um servidor com IP público que atua como gateway/proxy quando o LHISP não alcança diretamente o equipamento. |
| **Tipo** | Seleciona o comportamento específico do fabricante: Mikrotik, Ubiquit, Intelbras, Datacom, Wxbr, PacSwitch, Huawei, Juniper, Cisco, A10 ou Outros. |
| **Nome** | Identificação operacional exibida em redes, acessos, filas e diagnósticos. |
| **Endereço IP** | Endereço de gestão e, quando há RADIUS, referência esperada para o NAS. |
| **Interface de Internet** | Uplink usado na geração de regras. Uma [rede](/rede-infra/cadastrar-rede) não pode usar essa mesma interface como entrega. |
| **Usuário, senha e porta SSH** | Credencial usada para testar, consultar, aplicar configuração, desconectar clientes e obter backup, conforme o fabricante. |
| **Porta Web** | Referência para acesso à interface administrativa quando utilizada pelo fluxo. |

Se **Conectar por** for informado, o LHISP mantém regras de monitoramento e redirecionamento no gateway. Ao trocar ou remover esse vínculo, as regras do caminho antigo são removidas e recriadas no novo.

Na edição, deixar **Senha** vazia preserva a senha atual. A visualização da credencial exige perfil administrativo de filial; o segredo RADIUS usa ação e permissão próprias. Não compartilhe essas informações em chamados ou capturas.

## Monitoramento

**Comunidade SNMP**, **Versão SNMP** e **SNMP Max Idx** orientam descoberta de interfaces, gráficos e leituras suportadas pelo equipamento. **Voltagem mínima** é usada pelas rotinas de monitoramento aplicáveis, especialmente em Mikrotik. Os campos **Status ICMP**, **Status SSH** e **Info** são resultados de monitoramento, não valores configuráveis.

A **Porta Syslog** exibida é global para a instância/empresa e somente leitura; não pertence individualmente ao servidor.

As opções **Ativo**, **Enviar alertas** e **Efetuar backups** controlam a elegibilidade do registro para rotinas correspondentes. Marcá-las não corrige conectividade: ICMP, SSH/SNMP, permissões e serviços de monitoramento ainda precisam funcionar.

## RADIUS e PPPoE

**Usar RADIUS** inclui o servidor na autenticação dos acessos. O IP cadastrado deve coincidir com o `NAS-IP-Address` enviado pelo concentrador, e o segredo mostrado na ação **Visualizar Radius Secret** deve ser o mesmo nos dois lados. Salvar o servidor ou alterar o segredo solicita a recarga do serviço RADIUS.

Os métodos PPP disponíveis no cadastro atual são **PAP** e **CHAP**. O frontend não oferece mais MSCHAP 1 ou MSCHAP 2 nesse campo. Deixe selecionados apenas os métodos realmente habilitados no concentrador.

**Servidor de Acesso/PPPoE** e **Usar PCQ** são opções específicas de Mikrotik. **PPPoE Local Address = Loopback** influencia a geração dos perfis PPPoE. Alterações nesses itens exigem reaplicar a parte correspondente da configuração para refletirem no equipamento.

## NAT e CGNAT

**Tipo de NAT** seleciona `masquerade`, `src-nat` ou `same`; **Prefixo público de Source NAT** fornece o bloco usado pelo modo configurado. Escolha conforme a arquitetura, pois a alteração pode mudar a origem pública de conexões.

**Portas por IP** é calculado pelo backend a partir dos prefixos de CGNAT e aparece somente para consulta. Os blocos são administrados na aba **CGNAT**. Para Huawei, a quantidade calculada deve ser múltipla de 256. No A10, a tela também oferece importação específica de CGNAT.

## Outras opções

- **Transmissor Wireless:** permite usar o equipamento como ponto de acesso de uma rede Wireless.
- **Enlace:** classifica o equipamento para vínculos e monitoramento de enlaces.
- **IP Dinâmico (DDNS):** indica que o endereço pode ser atualizado pelo mecanismo de DNS dinâmico.
- **Servidor de DNS:** inclui o equipamento nos fluxos de DNS suportados.
- **Filtros de Segurança:** habilita a geração das proteções previstas pelo configurador, como SYN cookies e `rp-filter` estrito onde suportados.
- **Bloquear Gerência:** orienta regras que restringem o acesso administrativo.

Essas opções não garantem suporte em todos os fabricantes. O tipo escolhido determina quais automações efetivamente possuem implementação.

## O que acontece ao salvar

No primeiro cadastro, o backend:

1. valida IP, duplicidade e eventual gateway;
2. grava o servidor e calcula os parâmetros de CGNAT;
3. cria redirecionamentos necessários quando há gateway;
4. para Mikrotik, gera a configuração inicial de firewall, redes, acessos, monitoramento, IPv6, CGNAT e rotas;
5. solicita recarga do RADIUS;
6. publica a alteração para o serviço de monitoramento.

Na edição, o LHISP remove as regras do caminho de conexão anterior, atualiza NAT e recria redirecionamentos, recarrega o RADIUS e notifica monitoramento e serviço de comandos. Se o **Tipo** for alterado, os comandos pendentes do servidor são apagados para evitar aplicar instruções do fabricante anterior.

Salvar dados e aplicar comandos são etapas diferentes. Confira a fila e o estado do equipamento após mudanças operacionais.

## Atualizar servidor

A ação **Atualizar Servidor**, disponível com `servidor_update`, reenvia seletivamente por SSH:

- firewall e listas de endereço;
- redes e servidores PPPoE;
- acessos, usuários e senhas;
- scripts de monitoramento;
- pools e perfis IPv6;
- firewall IPv6, CGNAT e rotas.

Também é possível limpar a fila ou apenas testar a conexão SSH. A atualização pode demorar e modificar muitas regras; selecione somente os grupos necessários, preserve backup e revise a saída apresentada.

## Exclusão

O servidor não pode ser apagado enquanto possuir redes associadas. Ao excluir um servidor elegível, o backend desfaz seus vínculos em enlaces, tenta remover o peer BGP do gateway relacionado, faz exclusão lógica do cadastro, elimina seus comandos pendentes e publica um evento de remoção.

Antes disso, migre redes e acessos, confira prefixos, gráficos, rotas, backups e dependências externas. A exclusão do registro não equivale a remover toda configuração já aplicada no equipamento.

## Problemas comuns

| Sintoma | Verificação |
|---|---|
| IP/porta SSH já cadastrados | Localize o servidor existente; não duplique o mesmo equipamento. |
| ICMP funciona, mas SSH está offline | Revise porta, credencial, algoritmo aceito, ACL e caminho **Conectar por**. |
| RADIUS nega todos os acessos | Confira servidor ativo, **Usar RADIUS**, IP do NAS, segredo e recarga do serviço. |
| Gráficos ou interfaces não aparecem | Valide SNMP, comunidade, versão, índice máximo e permissão de rede. |
| Mudança não chegou ao equipamento | Examine a fila de comandos, daemon, status SSH e saída de **Atualizar Servidor**. |
| Não é possível apagar | O servidor ainda possui uma ou mais redes associadas. |

![Cadastro de servidor](/assets/screenshots/rede-infra/cadastrar-servidor-form.png)
