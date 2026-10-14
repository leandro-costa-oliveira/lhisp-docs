---
title: Servidores
published: true
editor: markdown
description: Consulta dos equipamentos, abas operacionais e ações de diagnóstico e manutenção.
---

# Servidores

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.

O cadastro de servidores reúne os equipamentos gerenciados pelo LHISP. A lista atual fica em **Rede e Infraestrutura → Servidores**; ao abrir um item, a página apresenta seus dados e abas operacionais. Para incluir ou alterar endereço, fabricante, credenciais e opções, consulte [Cadastrar Servidor](/rede-infra/cadastrar-servidor).

## Localizar o equipamento

1. Pesquise por **Nome ou IP**.
2. Combine os filtros de tipo, situação, status, transmissor wireless, servidor de acesso/PPPoE, enlace e backups.
3. Confira ID, nome, IP, tipo, status e data do último backup.
4. Clique no registro ou em **Editar** para abrir o equipamento.

A listagem apresenta dez registros por página. **Situação** corresponde à ativação do cadastro; **Status** corresponde ao estado de monitoramento. O filtro inicial de situação é **Todos**, portanto registros inativos também podem aparecer.

O cadastro exige `servidor_add`; edição, `servidor_edit`; exclusão, `servidor_del`. A exclusão solicita confirmação e passa pelas regras do backend: confira redes, acessos e demais dependências antes de apagar.

## Abas do servidor

As abas adicionais aparecem depois do primeiro salvamento.

| Aba | Uso |
|---|---|
| **Dados** | Cadastro, estado ICMP/SSH e ações do equipamento. **Salvar** fica no cabeçalho desta aba. |
| **Redes** | Redes vinculadas ao servidor. |
| **IPv4 / IPv6** | Prefixos e endereçamento. Consulte [Prefixos de IP](/rede-infra/prefixos-de-ip) e [IPv6](/rede-infra/ipv6). |
| **CGNAT** | Blocos, proporções e mapeamentos. Consulte [CGNAT](/rede-infra/cgnat). |
| **Interfaces** | Consulta SNMP de nome, descrição, MAC, status operacional/administrativo, MTU, velocidade e índice. **Atualizar** refaz a consulta. |
| **Rotas** | Consulta com filtros por destino, gateway e comentário; inclusão/remoção exige `servidor_edit`. |
| **Traps** | Busca por data inicial/final, OID e valor. |
| **Backups** | Lista por data/hora, download e ação **Efetuar Backup**. |
| **Gráficos** | Cadastro e visualização dos gráficos do equipamento. |
| **Histórico** | Registros operacionais relacionados ao servidor. |

A página React atual não possui a aba **Servidores** que aparecia no formulário legado. O atalho **Abrir tela legado (PHP)** permanece no cabeçalho; capturas antigas podem apresentar controles e navegação diferentes.

## Ações da aba Dados

| Ação | Condição e efeito |
|---|---|
| **Ping / Traceroute** | Abre diagnóstico para o IP preenchido; permite informar outro destino e quantidade. A origem é o ambiente PHP do LHISP. |
| **Atualizar Servidor** | Exige `servidor_update`. Seleciona partes da configuração a regenerar e pode enfileirar comandos reais. |
| **Visualizar Senha** | Exibida para perfis administrativos, incluindo administrador de filial; consulte apenas para uma necessidade autorizada. |
| **Visualizar Radius Secret** | Exige `servidor_edit`; permite consultar e alterar o segredo do NAS. |
| **Atualizar DNS judicial** | O frontend oferece o botão para Mikrotik com a opção habilitada e `servidor_update`; a implementação do endpoint não foi localizada no backend deste checkout. Confira os limites em [Bloqueio Judicial](/rede-infra/dns-bloqueio-judicial). |
| **Importar CGNAT** | Disponível para A10; não é uma importação genérica entre fabricantes. |

O status ICMP não comprova funcionamento de SSH, SNMP, RADIUS ou PPPoE. A resposta de um ping pontual também não altera imediatamente o estado mantido pelo monitoramento automático. Consulte [Operação dos serviços de rede](/rede-infra/operacao-servicos-rede).

## Atualizar Servidor

Selecione somente o escopo necessário: **Firewall**, **Redes**, **Acessos**, **Monitoramento**, **IPv6**, **Firewall IPv6**, **CGNAT** ou **Rotas**. A rotina é voltada ao gerador Mikrotik e também reaplica parâmetros comuns do equipamento; as opções não isolam completamente todos os efeitos.

**Checar Conexão SSH** testa a conexão, mas faz parte da mesma rotina de atualização: não interprete sua seleção como garantia de ausência de comandos de configuração. **Limpar Comandos da Fila** apaga comandos pendentes antes da geração; isso não confirma sua execução nem desfaz mudanças já aplicadas.

1. Confirme equipamento, fabricante e impacto nos clientes.
2. Preserve um backup e registre a configuração anterior.
3. Selecione as partes que precisam ser regeneradas.
4. Execute e leia os avisos retornados.
5. Acompanhe SSH e processamento da fila.
6. Valide o serviço no equipamento e em um acesso de cliente.

Um retorno de sucesso da página não comprova que toda a fila foi aplicada. Não repita a atualização antes de investigar comandos pendentes: uma falha parcial pode exigir reconciliação com o estado real.

## Backups e gráficos

Na aba **Backups**, confira a data do arquivo, baixe-o e verifique se corresponde ao equipamento. **Efetuar Backups** habilitado no cadastro ou uma data preenchida não comprovam que a restauração foi testada. O download pode conter credenciais: armazene-o em destino restrito.

Na aba **Gráficos**, **Novo Gráfico** permite cadastrar interfaces, OIDs personalizadas e composições. A tela considera `servidor_add_graph` ou `servidor_edit_graph` para liberar edição; o backend valida cada ação. **Remover Picos** altera o histórico de forma irreversível: preserve os dados necessários antes de confirmar. Para reunir gráficos de vários equipamentos, consulte [Monitor de Gráficos](/rede-infra/monitoramento-de-graficos).

## Problemas comuns

| Sintoma | Verificação |
|---|---|
| Equipamento não aparece | Remova filtros e confira situação, nome/IP e empresa. |
| ICMP online, mas comandos falham | Confira SSH, porta, credenciais, caminho **Conectar por**, compatibilidade dos algoritmos e mensagem de erro. |
| Interfaces vazias | Verifique SNMP, comunidade, versão, ACL e índices. |
| Atualização conclui, mas equipamento diverge | Examine a fila, os logs do executor e a saída real dos comandos. |
| Não encontro autenticação PPPoE | O formulário atual não oferece seleção de PAP/CHAP/MSCHAP; o gerador Mikrotik usa PAP e CHAP. |
| Backup ausente ou antigo | Confira a opção de backup, conectividade e resultado da rotina; realize um backup controlado. |

![Servidor no formulário legado](/assets/screenshots/rede-infra/servidores.png)

A captura acima é do formulário legado e não representa a disposição atual das abas e botões.
