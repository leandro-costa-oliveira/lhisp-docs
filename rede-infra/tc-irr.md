---
title: TC IRR
published: true
editor: markdown
description: ''
---

# TC IRR

> **⚠️ Rascunho gerado por agente**
>
> Esta página foi documentada a partir da tela equivalente no ambiente de demonstração do LHISP. A captura usada veio do demo e foi mantida sem marcações visuais.

## Objetivo

Gerenciar a base de **TC IRR** para consulta e manutenção de registros de ASN e descrição vinculados ao fluxo de redes.

## Quando usar

Use esta tela quando precisar:

- consultar registros de ASN;
- revisar a descrição associada ao ASN;
- adicionar um novo registro;
- atualizar a lista carregada;
- remover entradas existentes.

## Pré-requisitos

- Estar autenticado no LHISP.
- Ter permissão para acessar o fluxo **TC IRR**.
- Saber o ASN ou a descrição que será consultada.

## Passo a passo

1. Acesse **Rede/ Infra > TC IRR**.
2. Use o campo **ASN** e/ou **Descrição** para localizar registros.
3. Clique em **Add** para adicionar uma nova entrada.
4. Clique em **Refresh** para recarregar a lista.
5. Use o botão de exclusão na coluna **Ações** para remover um registro, quando permitido.

## Campos importantes

| Campo / ação | Descrição |
|---|---|
| **ASN** | Filtro para localizar um ASN específico. |
| **Descrição** | Filtro por nome ou descrição. |
| **Add** | Cria um novo registro de TC IRR. |
| **Refresh** | Recarrega a lista exibida. |
| **Ações** | Coluna com botão de exclusão por linha. |

## Resultado esperado

- A lista de ASNs aparece carregada.
- O usuário consegue filtrar por ASN ou descrição.
- As ações de inclusão e atualização ficam disponíveis.

## Problemas comuns

| Problema | Como tratar |
|---|---|
| Lista vazia | Verifique os filtros aplicados e a disponibilidade dos dados. |
| Não consigo adicionar ou excluir | Pode haver restrição de permissão. |

## Observações

- A rota observada no demo foi `/redeinfra/tcirr`.
- A tela carregou com o título `TC IRR - bgp.net.br`.
- O conteúdo principal mostrou o subtítulo `TC IRR - AS262532 - AS-NETONDA-CLIENTES-01`.
- Os campos de filtro estavam aparentando modo somente leitura/disabled no demo.
- A tabela exibiu vários registros de ASN com botão de exclusão em cada linha.
- A captura limpa mostra a tela completa sem marcações visuais.

## Dúvidas para revisão

- O campo **ASN** é apenas filtro ou também define o registro editado?
- A lista exibida é completa ou paginada em outra camada?
- O botão **Add** cria registro local ou abre um fluxo externo?

## Screenshots sugeridos

- Tela **TC IRR** no demo: `assets/screenshots/rede-infra/tc-irr.png`

![TC IRR no demo](/assets/screenshots/rede-infra/tc-irr.png)
