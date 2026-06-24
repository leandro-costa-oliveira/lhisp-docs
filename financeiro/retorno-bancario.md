---
title: Retorno Bancário
published: true
editor: markdown
description: ''
---

# Retorno Bancário

> **⚠️ Rascunho gerado por agente**
>
> Esta página foi documentada a partir da rota de Retorno Bancário no demo do LHISP. Na captura visual obtida neste ambiente, a área principal permaneceu em estado de carregamento. A inspeção da árvore de elementos mostrou os campos abaixo.

## Objetivo

Consultar e operar o retorno bancário associado às contas bancárias configuradas no sistema.

## Quando usar

Use esta tela quando precisar:

- consultar retornos por conta bancária;
- filtrar o período de retorno;
- validar movimentos processados;
- localizar arquivos ou lotes relacionados ao retorno bancário.

## Pré-requisitos

- Estar autenticado no LHISP.
- Ter permissão para acessar o fluxo de retorno bancário.
- Ter ao menos uma conta bancária cadastrada.
- Conhecer o período que será consultado.

## Passo a passo

1. Acesse **Financeiro > Retorno Bancário**.
2. Selecione a **Conta Bancária**.
3. Informe o período inicial e final.
4. Execute a consulta/ação disponível na tela.
5. Valide os retornos exibidos para a conta selecionada.

## Campos importantes

| Campo / ação | Descrição |
|---|---|
| **Conta Bancária** | Conta usada como filtro principal. |
| **Data inicial** | Início do período de retorno. |
| **Data final** | Fim do período de retorno. |
| **Ação de consulta** | Botão/ação usada para carregar os retornos. |

## Resultado esperado

- A tela deve listar os retornos bancários filtrados pela conta e período.
- O operador consegue validar o status dos retornos.
- O fluxo deve permitir conferir o processamento bancário relacionado aos títulos.

## Problemas comuns

| Problema | Como tratar |
|---|---|
| A área principal fica apenas em carregamento | Verifique se a tela terminou de carregar ou se o demo está com limitação de renderização. |
| A conta bancária não lista opções | Confirme se há contas cadastradas e se o perfil possui acesso. |
| A consulta não retorna dados | Ajuste o período e valide se existem retornos no intervalo informado. |

## Observações

- A rota observada no demo foi `/lgc/financeiro%7Cretorno_bancario`.
- O conteúdo operacional é exibido no fluxo principal do sistema.
- A captura visual obtida neste ambiente ficou em estado de carregamento, mas a inspeção dos elementos mostrou o formulário com **Conta Bancária**, **Data inicial**, **Data final** e uma ação de execução.
- Como a tela não concluiu o carregamento visual durante a captura, esta página registra a limitação em vez de inventar dados de retorno.

## Dúvidas para revisão

- Qual é o nome exato do botão/ação usada para consultar os retornos?
- O retorno bancário mostra apenas leitura ou também permite baixar/reenviar arquivos?
- Existe um filtro adicional por filial ou status do processamento?

## Screenshots sugeridos

- Tela **Retorno Bancário** no demo: `assets/screenshots/financeiro/retorno-bancario.png`

![Retorno Bancário no demo](/assets/screenshots/financeiro/retorno-bancario.png)
