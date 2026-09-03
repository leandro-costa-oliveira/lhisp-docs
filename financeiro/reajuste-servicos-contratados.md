---
title: Reajuste de Serviços Contratados
published: true
editor: markdown
description: ''
---

# Reajuste de Serviços Contratados


## Objetivo

Aplicar reajustes percentuais ou de valor fixo em serviços contratados, com filtros por filial, plano, categoria, tipo de pessoa e carência.

## Quando usar

Use esta tela quando precisar:

- filtrar contratos elegíveis para reajuste;
- revisar a base antes de aplicar alterações;
- informar um percentual ou valor fixo de reajuste;
- executar a atualização em lote após a validação.

## Pré-requisitos

- Estar autenticado no LHISP.
- Ter permissão para acessar o fluxo **Reajuste de Serviços Contratados**.
- Ter planos, filiais e categorias disponíveis.
- Definir previamente a regra de reajuste desejada.

## Passo a passo

1. Acesse **Financeiro > Reajuste Serviços Contratados**.
2. Preencha a **Filial** e o **Plano** quando necessário.
3. Escolha a **Categoria** e o **Tipo de Pessoa**.
4. Informe a **Carência** e o valor de **Reajuste**.
5. Use o botão ao lado do valor para escolher **%** ou **R$**.
6. Clique em **Visualizar** para conferir os contratos afetados e o valor reajustado.
7. Se estiver tudo correto, clique em **Reajustar**.

## Campos importantes

| Campo / ação | Descrição |
|---|---|
| **Filial** | Filtra os contratos por filial. |
| **Plano** | Limita o reajuste a um plano específico. |
| **Categoria** | Segmenta os contratos por categoria. |
| **Tipo de Pessoa** | Filtra pessoa física ou jurídica. |
| **Carência** | Prazo mínimo considerado para o reajuste. |
| **Reajuste** | Valor do reajuste. O botão adjacente alterna entre percentual (`%`) e acréscimo fixo (`R$`). |
| **Visualizar** | Mostra a prévia dos contratos afetados. |
| **Reajustar** | Executa o reajuste após validação. |

## Resultado esperado

- A tela apresenta os filtros do reajuste.
- O operador consegue revisar a prévia antes de executar.
- O sistema aplica o reajuste apenas quando a ação final é confirmada.

## Problemas comuns

| Problema | Como tratar |
|---|---|
| A prévia não retorna contratos | Verifique os filtros e a carência informada. |
| O botão **Reajustar** fica indisponível | Informe um reajuste maior que zero e aguarde o fim do carregamento. |
| O valor de reajuste está incorreto | Revise a regra aplicada antes de confirmar. |

## Observações

- A rota observada no demo foi `/financeiro/reajuste_servicos`.
- A tela renderiza como página operacional normal.
- A captura limpa mostra o formulário com **Filial**, **Plano**, **Categoria**, **Tipo de Pessoa**, **Carência** e **Reajuste**.
- A área inferior da tela permanece vazia até a visualização ou execução do reajuste.


## Screenshots sugeridos

- Tela **Reajuste de Serviços Contratados** no demo: `assets/screenshots/financeiro/reajuste-servicos-contratados.png`

![Reajuste de Serviços Contratados no demo](/assets/screenshots/financeiro/reajuste-servicos-contratados.png)

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.
