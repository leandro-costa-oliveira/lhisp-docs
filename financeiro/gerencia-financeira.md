---
title: Gerência Financeira
published: true
editor: markdown
description: 'Operação das abas da Gerência Financeira'
---

# Gerência Financeira

## Objetivo

Centralizar controle de caixa, contas a receber, contas a pagar e processamento de retorno bancário.

## Acesso e permissões

Acesse **Financeiro > Gerência Financeira**. As abas são exibidas conforme as permissões do usuário. Sem permissão para nenhuma aba, a tela informa que o acesso não está autorizado.

## Abas

| Aba | Uso principal |
|---|---|
| **Controle de Caixa** | Selecionar caixa e data; acompanhar movimentos, abrir/fechar caixa, registrar movimentações e sangrias conforme as permissões. |
| **Contas a Receber** | Pesquisar títulos, consultar detalhes e executar ações de recebimento e manutenção permitidas ao usuário. |
| **Contas a Pagar** | Pesquisar despesas, consultar detalhes, cadastrar/editar e efetuar pagamentos conforme as permissões. |
| **Retorno Bancário** | Visualizar arquivo sem alterar títulos e, após conferência, processar as baixas. |

## Navegação

A aba ativa faz parte da URL. Na aba **Controle de Caixa**, o caixa selecionado também pode ser mantido no caminho. Caixa e data ficam no cabeçalho da gerência para uso nas operações relacionadas.

O botão com ícone de ambulância abre a Gerência Financeira legada em `/lgc/financeiro`.

## Cuidados

- Confira caixa e data antes de registrar pagamentos, movimentos ou sangrias.
- Use **Visualizar** no retorno bancário antes de **Processar**.
- A disponibilidade de botões depende das permissões do perfil e do estado do registro.
- Operações financeiras podem alterar saldos e títulos; confirme os dados antes de concluir.

## Problemas comuns

| Problema | Como tratar |
|---|---|
| Aba não aparece | Verifique a permissão correspondente no perfil. |
| Caixa não aparece | Confirme o cadastro, a filial e o acesso do usuário. |
| Ação indisponível | Confira permissão e situação do registro financeiro. |
| Dados não atualizam | Revise filtros e use a atualização da própria aba. |

## Referências de implementação

- `lhisp-frontend/src/paginas/financeiro/gerencia/index.tsx`
- `lhisp-frontend/src/paginas/financeiro/gerencia/TabControleCaixa.tsx`
- `lhisp-frontend/src/paginas/financeiro/gerencia/TabContasReceber.tsx`
- `lhisp-frontend/src/paginas/financeiro/gerencia/TabContasPagar.tsx`
- `lhisp-frontend/src/paginas/financeiro/gerencia/TabRetornoBancario.tsx`

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.
