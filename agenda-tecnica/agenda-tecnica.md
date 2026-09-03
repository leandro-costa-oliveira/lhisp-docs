---
title: Agenda Técnica
published: true
editor: markdown
description: ''
---

# Agenda Técnica

## Objetivo

Consultar e tratar atendimentos, ordens de serviço e ordens internas na interface legada da Agenda Técnica.

## Pré-requisitos

- Estar autenticado no LHISP.
- Ter acesso ao menu **Agenda Técnica**.
- Possuir as permissões exigidas para consultar ou executar cada ação.

## Modos de consulta

| Modo | Conteúdo e ações |
|---|---|
| **Atendimentos** | Lista atendimentos. Permite abrir detalhes, selecionar registros, encerrar atendimentos e, quando a situação é **EM ATENDIMENTO**, liberar os itens exibidos. |
| **Ordens de Serviço** | Lista OS. Permite abrir detalhes, selecionar, agendar, concluir e imprimir ordens conforme permissões e situação. |
| **OS Interna** | Consulta ordens internas usando os filtros de OS. |

## Filtros

Filtros comuns:

- **Tipo da Observação**: primeira, última ou todas;
- **Registros por Página**;
- **Filial**, **Grupo** e **Período**;
- **Categoria dos Contratos**;
- **Aberto por**.

Em **Atendimentos**, a tela acrescenta **Filtrar por** (data de abertura ou conclusão), **Situação** e **Atendente**. O filtro de atendente aparece quando a situação selecionada é **EM ATENDIMENTO**.

Em **Ordens de Serviço** e **OS Interna**, aparecem **Filtrar por** (agendamento, abertura, conclusão ou dispensa), **Situação**, **Período**, **Tipo**, **Agendamento**, **Prioridade**, **Técnico** e a opção **Dispensadas**. Marcar **Dispensadas** troca o filtro de data para **Data da Dispensa**.

## Passo a passo

1. Acesse **Agenda Técnica**.
2. Escolha **Atendimentos**, **Ordens de Serviço** ou **OS Interna**.
3. Ajuste os filtros necessários.
4. Clique em **Atualizar Lista de Atendimentos/OS**.
5. Use **Detalhes** em uma linha para abrir o registro.
6. Para ações em lote, marque os itens e use os botões disponíveis no rodapé.
7. Use **Fila de Atendimento** para abrir a fila em tela própria.
8. Quando Cobli ou Traccar estiver configurado, a ação **Otimização de Rotas** também pode ser exibida.

## Listagem

A grade pode apresentar **Protocolo**, **Aberto Por**, **Endereço**, **Grupo**, **Atendente/Técnico**, **Contato**, **Filial**, **Cliente**, **Plano**, **Telefones**, **Tipo da OS**, **Aberto Em**, **Agendada Para**, **Descrição**, **Prioridade** e **PPPoE**. O contrato é aberto pelo link da coluna **Contato**.

As linhas usam destaque visual conforme a prioridade: alta, normal ou baixa.

## Cuidados

- **Concluir**, **liberar** e **agendar** alteram dados. Revise a seleção antes de confirmar.
- A impressão e as ações em lote só atuam quando há registros selecionados.
- A quantidade e as opções exibidas dependem da filial, das permissões e das integrações ativas.

## Validação

- Menu e rota validados no staging: `/lgc/agenda_tecnica`.
- A tela legada, seus três modos, filtros e listagem foram confirmados no staging.
- O fluxo usa `AgendaTecnica.ListarPorFilialStatus`; detalhes e ações são implementados em `form/agendatec/atendimento.js` e `form/agendatec/os.js`.
- Existe também uma implementação React em `/agenda_tecnica`, mas o item atual do menu abre a interface legada descrita nesta página.

## Captura de tela

![Agenda Técnica](/assets/screenshots/agenda-tecnica/agenda-tecnica.png)

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.
