---
title: TC IRR
published: true
editor: markdown
description: ''
---

# TC IRR


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

- A identificação do ASN/AS-SET configurado e a lista de entradas aparecem carregadas quando a consulta ao serviço retorna dados.
- O usuário consegue filtrar por ASN ou descrição.
- As ações de inclusão e atualização ficam disponíveis após a carga da consulta.

## Problemas comuns

| Problema | Como tratar |
|---|---|
| Título mostra `undefined - undefined` ou a lista fica vazia | Aguarde a consulta assíncrona. Se o estado permanecer, verifique a configuração em **Sistema > Integrações > TC IRR** e a disponibilidade do serviço. |
| Não consigo adicionar ou excluir | Pode haver restrição de permissão. |

## Observações

- A rota observada no demo foi `/redeinfra/tcirr`.
- O título do navegador é **TC IRR - bgp.net.br**.
- Na validação atual do staging, o ASN, o AS-SET e as linhas foram carregados após a consulta assíncrona.
- Os campos ficam desabilitados durante a consulta ou uma inclusão.
- O botão de exclusão é renderizado, mas sua função está vazia no frontend atual; a remoção não é operacional nessa tela.


## Screenshots sugeridos

- Tela **TC IRR** no demo: `assets/screenshots/rede-infra/tc-irr.png`

![TC IRR no demo](/assets/screenshots/rede-infra/tc-irr.png)

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.
