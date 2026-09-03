---
title: Categorias Financeiras
published: true
editor: markdown
description: Classificação da natureza das despesas e contas a pagar.
---

# Categorias Financeiras

Categorias financeiras classificam **o que** representa um gasto. Exemplos típicos são impostos, pessoal, infraestrutura ou serviços de terceiros. Cada categoria pode conter itens para um nível adicional de detalhamento.

Essa classificação complementa o centro de custo: a categoria descreve a natureza do gasto; o centro de custo informa a área à qual ele foi apropriado. Usados em conjunto, os dois cadastros permitem analisar contas a pagar por finalidade e por área responsável.

## Onde a categoria é usada

- [Despesas recorrentes](/cadastros/financeiro/despesas), que copiam categoria e item para cada conta gerada;
- contas a pagar incluídas ou editadas na Gerência Financeira;
- geração automática de despesas mensais e anuais;
- relatórios e resumos de contas a pagar por categoria;
- projeções financeiras que usam as contas classificadas.

## Cadastro

1. Acesse **Cadastros > Financeiro > Categorias**.
2. Clique em **Cadastrar** ou abra uma categoria existente.
3. Informe o nome da categoria.
4. Adicione os itens necessários.
5. Salve.

| Campo | Função |
|---|---|
| **Categoria Financeira** | Agrupamento principal da natureza do gasto. O nome é obrigatório e único na empresa. |
| **Itens** | Detalhamento interno da categoria, com nome de até 100 caracteres na interface. |

Ao salvar, os itens enviados são criados ou atualizados. Itens removidos do formulário são excluídos logicamente pelo backend.

## Regras e efeitos

- A categoria e seus itens pertencem à empresa do usuário; consultas não devem misturar dados de empresas diferentes.
- O backend impede duas categorias ativas com o mesmo nome.
- A categoria é opcional no cadastro de despesa e de conta a pagar no backend, mas pode ser exigida pela configuração administrativa da empresa.
- Remover uma categoria ou item não reclassifica despesas nem contas já gravadas.
- Alterar a categoria em uma despesa afeta os lançamentos futuros. Contas a pagar já geradas mantêm a classificação copiada na criação.

> **Atenção:** antes de remover um item em uso, localize despesas recorrentes e contas em aberto vinculadas. Sem essa revisão, novos relatórios podem apresentar registros históricos com uma referência que já não aparece nas seleções normais.

## Boas práticas

- Evite categorias sobrepostas ou nomes vagos.
- Mantenha poucos níveis estáveis: categoria e item.
- Use centro de custo para área/destino e categoria para natureza do gasto.
- Padronize a classificação antes de cadastrar despesas recorrentes; isso reduz correções em lote nas contas geradas.

## Captura da tela

![Listagem de categorias financeiras](/assets/screenshots/cadastros/financeiro/categorias.png)
