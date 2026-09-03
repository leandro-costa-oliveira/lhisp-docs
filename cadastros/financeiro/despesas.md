---
title: Despesas
published: true
editor: markdown
description: Cadastro das despesas recorrentes que originam contas a pagar.
---

# Despesas

Uma despesa é o modelo de uma obrigação recorrente da empresa, como aluguel, link de operadora ou imposto. Ela define fornecedor, classificação financeira, valor e vencimento usados para criar as ocorrências no **Contas a Pagar**.

O cadastro não representa, sozinho, um pagamento nem uma conta já vencida. Cada competência gera uma conta a pagar própria; é essa conta que depois pode ser paga, estornada, conciliada e acompanhada na [Gerência Financeira](/financeiro/gerencia-financeira).

## Geração automática de contas a pagar

No dia 1º de cada mês, a rotina financeira do LHISP processa as despesas ativas de cada empresa:

- despesas **mensais** geram uma conta no mês corrente;
- despesas **anuais** geram uma conta somente quando o mês corrente coincide com o mês de vencimento cadastrado;
- o dia configurado na despesa é usado como dia de vencimento da nova conta;
- filial, fornecedor, centro de custo, item do centro de custo, categoria financeira, item da categoria, descrição e valor são copiados para a conta a pagar;
- antes de inserir, a rotina procura uma conta da mesma despesa no mesmo mês e ano. Se já existir, não cria outra.

A conta gerada fica vinculada à despesa de origem e recebe um registro de histórico informando que foi lançada automaticamente.

> **Atenção:** alterar uma despesa define os próximos lançamentos. O código de geração não recalcula nem substitui contas de competências que já foram criadas.

O fluxo financeiro legado também permite lançar despesas para um intervalo informado. Ele percorre as competências do período, respeita a periodicidade e reaproveita contas que já existam em vez de duplicá-las.

## Quando cadastrar

Cadastre uma despesa para compromissos previsíveis que devem aparecer periodicamente no Contas a Pagar. Para uma obrigação isolada, use uma nova conta a pagar na Gerência Financeira; não crie uma recorrência desnecessária.

Antes do cadastro, devem existir:

- a filial responsável pela obrigação;
- o fornecedor como pessoa cadastrada;
- o centro de custo usado para apropriação gerencial;
- quando usados pela empresa, os itens do centro de custo e a categoria financeira.

## Cadastro e classificação

1. Acesse **Cadastros > Financeiro > Despesas**.
2. Clique em **Cadastrar**.
3. Selecione filial, fornecedor e centro de custo.
4. Informe a classificação financeira aplicável.
5. Escolha a periodicidade, o vencimento, o valor e uma descrição inequívoca.
6. Salve o registro.

| Campo | Efeito no processo |
|---|---|
| **Filial** | Define a filial das contas a pagar geradas. |
| **Fornecedor** | Identifica o credor das contas. |
| **Centro de Custo / Item** | Classifica onde o gasto será apropriado e alimenta filtros e relatórios financeiros. |
| **Categoria Financeira / Item** | Classifica a natureza do gasto nas consultas financeiras. |
| **Período** | **Mensal** gera em todos os meses; **Anual** gera somente no mês selecionado. |
| **Dia de Vencimento** | Forma o vencimento de cada conta gerada. |
| **Mês de Vencimento** | Usado apenas na periodicidade anual. |
| **Valor** | Valor inicial copiado para a conta a pagar. Deve ser maior que zero na SPA. |
| **Descrição** | Identifica a obrigação nas contas e listagens. O backend não permite duas despesas ativas com a mesma descrição na empresa. |

Na listagem, a busca textual filtra pela descrição. Os filtros adicionais permitem restringir por filial, fornecedor e centro de custo.

## Relações com outras funcionalidades

- **Contas a Pagar:** recebe as ocorrências mensais/anuais e concentra pagamento, estorno, anexos e histórico.
- **Caixas e movimentações:** o pagamento de uma conta gera ou associa a movimentação financeira correspondente.
- **Centros de custo e categorias financeiras:** determinam os agrupamentos usados na análise de gastos.
- **Folha de pagamento:** vínculos da importação de folha podem apontar para despesas de destino. A competência da folha usa o dia de vencimento da despesa e pode criar ou atualizar a conta a pagar correspondente.
- **Relatórios:** contas criadas a partir das despesas compõem Contas a Pagar, Fluxo de Caixa, Projeções e Recebimentos e análises por classificação.

## Regras e cuidados

- A edição exige uma descrição única entre as despesas ativas da empresa.
- O backend valida a existência da filial, do fornecedor e do centro de custo antes de salvar.
- A exclusão é lógica: a despesa deixa de participar das próximas gerações, sem apagar automaticamente as contas já lançadas.
- Categoria e itens de classificação são opcionais no backend, embora possam ser necessários para a política financeira da empresa.
- A criação automática é executada por processo de servidor. Se uma competência esperada não aparecer, verifique se a despesa estava ativa e corretamente configurada quando a rotina do dia 1º foi executada; depois confira se a conta já existe para o mesmo mês e ano.

## Captura da tela

![Listagem de despesas](/assets/screenshots/cadastros/financeiro/despesas.png)
