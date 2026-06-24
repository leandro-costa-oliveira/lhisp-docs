---
title: Bloqueios por Atraso
published: true
editor: markdown
description: ''
---

# Bloqueios por Atraso

> **⚠️ Rascunho gerado por agente**
>
> Esta página foi documentada a partir da tela equivalente no ambiente de demonstração do LHISP. A captura usada veio do demo e foi mantida sem marcações visuais.

## Objetivo

Consultar contratos em atraso e executar bloqueios ou desbloqueios com base na filial e na data de vencimento.

## Quando usar

Use esta tela quando precisar:

- localizar contratos vencidos;
- filtrar contratos por filial;
- aplicar bloqueios por atraso;
- reverter bloqueios já aplicados;
- revisar contratos antes de executar uma ação em massa.

## Pré-requisitos

- Estar autenticado no LHISP.
- Ter permissão para acessar o fluxo **Bloqueios por Atraso**.
- Ter contratos e vencimentos cadastrados.
- Conhecer o período que será analisado.

## Passo a passo

1. Acesse **Financeiro > Bloqueios por Atraso**.
2. Selecione a **Filial** desejada.
3. Informe o intervalo de **Data de Vencimento**.
4. Use **Visualizar** para conferir os contratos encontrados.
5. Execute **Efetuar Bloqueios** ou **Efetuar Desbloqueios** conforme a necessidade.

## Campos importantes

| Campo / ação | Descrição |
|---|---|
| **Filial** | Filial usada como filtro principal. |
| **Data de Vencimento** | Faixa de vencimento dos contratos analisados. |
| **Visualizar** | Lista os contratos elegíveis para a ação. |
| **Efetuar Bloqueios** | Aplica bloqueio aos contratos selecionados. |
| **Efetuar Desbloqueios** | Remove bloqueios já aplicados. |

## Resultado esperado

- A tela lista os contratos que se enquadram no filtro informado.
- O operador consegue conferir antes de bloquear ou desbloquear.
- O sistema aplica a ação escolhida para os contratos elegíveis.

## Problemas comuns

| Problema | Como tratar |
|---|---|
| A lista não retorna contratos | Ajuste o período de vencimento ou a filial. |
| A ação não executa | Verifique permissões e se existem contratos elegíveis. |
| Os filtros parecem vazios | Confirme se há contratos vencidos cadastrados no demo. |

## Observações

- A rota observada no demo foi `/lgc/financeiro%7Cbloqueios`.
- A tela é apresentada no demo como página operacional.
- A captura visual obtida no demo mostrou claramente o formulário principal com **Filial**, **Data de Vencimento** e os botões de ação.
- A área principal abaixo do formulário permanece vazia até que o operador use **Visualizar**.

## Dúvidas para revisão

- A tela usa algum status adicional para identificar contratos elegíveis?
- O botão **Visualizar** apenas consulta ou já prepara a seleção para bloqueio?
- Os bloqueios/desbloqueios afetam apenas a cobrança ou também outras rotinas financeiras?

## Screenshots sugeridos

- Tela **Bloqueios por Atraso** no demo: `assets/screenshots/financeiro/bloqueios-por-atraso.png`

![Bloqueios por Atraso no demo](/assets/screenshots/financeiro/bloqueios-por-atraso.png)
