---
title: Agenda Técnica
published: true
editor: markdown
description: ''
---

# Agenda Técnica

## Objetivo

Consultar atendimentos por filial e período e abrir o detalhe de um atendimento na interface legada.

## Pré-requisitos

- Estar autenticado no LHISP.
- Ter acesso ao menu **Agenda Técnica**.
- Ter a permissão `agenda_tecnica` para que a contagem seja consultada.

## Abas disponíveis

| Aba | Comportamento atual |
|---|---|
| **Atendimentos** | Exibe filtros, consulta atendimentos e mostra a quantidade total. |
| **Ordens de Serviço** | Exibe apenas o texto **Ordens de Serviço**; a listagem ainda não está implementada nesta tela. |

A interface atual não possui a aba **OS Interna**.

## Filtros de Atendimentos

| Campo | Comportamento atual |
|---|---|
| **Filial** | Filtra pelo identificador da filial. |
| **Data de Abertura** | Intervalo aplicado a `data_abertura`. Inicia com o primeiro e o último dia do mês atual. |
| **Data de Conclusão** | Intervalo adicional aplicado a `data_conclusao`, também iniciado com o mês atual. Está disponível no modal de filtros. |
| **Situação** | Mostra **EM ABERTO**, **AGUARDANDO OS**, **EM ATENDIMENTO**, **PÓS-VENDA**, **CONCLUÍDO** e **CANCELADO**, mas o valor selecionado não é enviado na consulta atual. |
| **Grupo** | O campo aparece no modal, mas o seletor está desabilitado no código e nenhum grupo pode ser escolhido. |
| **Registros por Página** | Permite 10, 25, 50, 100 ou 250. A consulta inicia com 10 registros. |

> **Atenção:** os intervalos de abertura e conclusão são aplicados simultaneamente. Assim, o resultado precisa atender aos dois períodos informados.

## Passo a passo

1. Acesse **Agenda Técnica**.
2. Mantenha a aba **Atendimentos** selecionada.
3. Escolha a filial e ajuste o período de abertura.
4. Use o botão de filtro para ajustar também o período de conclusão e a quantidade por página.
5. Navegue pelas páginas da listagem.
6. Use o botão de informação da linha para abrir o detalhe do atendimento no fluxo legado.

## Listagem

O cabeçalho contém **Protocolo**, **Aberto Em**, **Grupo**, **Atendente**, **Contrato**, **Filial**, **Cliente**, **Bairro**, **Endereço** e **Telefones**. Entretanto, na implementação atual, as células desses dados estão comentadas: cada resultado renderiza somente o botão de informação. O rodapé ainda mostra o total de atendimentos.

## Limitações atuais

- O botão **Atualizar Lista** altera apenas um contador local que não participa da consulta; ele não força uma nova requisição.
- O filtro **Situação** não integra os parâmetros enviados à API.
- O filtro **Grupo** não permite seleção.
- As colunas de dados da tabela não são preenchidas.
- A aba **Ordens de Serviço** não possui conteúdo operacional.

Essas limitações refletem o comportamento implementado e não devem ser interpretadas como instruções de uso futuro.

## Integração

- Listagem: `POST /api/Atendimento.findAll`.
- Contagem: `POST /api/Atendimento.count`.
- Detalhe: carrega os formulários legados `agendatec/atendimento` e `agendatec/os` e chama `dialogDetalhes(id)`.

## Captura de tela

![Agenda Técnica](/assets/screenshots/agenda-tecnica/agenda-tecnica.png)

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.
