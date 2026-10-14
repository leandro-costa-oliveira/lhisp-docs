---
title: Fluxo de Caixa
published: true
editor: markdown
description: Consulte movimentos pela data do caixa, interprete saldo e filtros e confira as diferenças da exportação legada.
---

# Fluxo de Caixa

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.

O relatório legado mostra entradas e saídas de um caixa pela **data operacional do caixa**. Ele inclui movimentos associados a contas e lançamentos manuais. Use o atalho legado correspondente, em `/lgc/relatorios|movimento_caixa`.

## Consultar

1. Selecione o **Caixa**.
2. Informe o período inicial e final; o padrão é o mês corrente.
3. Escolha **Entradas**, **Saídas** ou **Todos**.
4. Se desejar, informe um trecho da **Descrição**.
5. Clique em **Exibir**, confira o resultado no quadro inferior e use **Imprimir** ou **Baixar Arquivo**.

Caixa e datas são obrigatórios no formulário. A lista e a consulta usam os caixas disponíveis ao usuário e à empresa. O período considera `Data do Caixa`, não a hora em que o operador cadastrou o movimento nem o vencimento das contas associadas.

## Ler movimentos e saldo

Cada linha mostra **Usuário, Data, Descrição, Espécie, Nrdoc e Valor**. Entradas são identificadas como crédito (**C**) e saídas como débito (**D**). A descrição pode detalhar contas a receber, contas a pagar e observações vinculadas, com os respectivos valores associados.

| Total | Regra |
|---|---|
| **Saldo Anterior** | Entradas menos saídas de todas as datas do caixa anteriores ao primeiro dia escolhido. |
| **Entradas / Saídas** | Soma dos movimentos retornados pelo período e filtros. |
| **Saldo** | Saldo anterior mais entradas filtradas menos saídas filtradas. |

Com filtro de tipo ou descrição, o saldo final usa **somente os movimentos selecionados**, mas mantém o saldo anterior completo. Ele pode diferir do saldo real ao final do período. Para conferir o saldo do caixa, use **Todos** e deixe Descrição em branco.

A configuração da empresa pode ocultar saldo anterior e rodapé para usuários sem administração de filial. A ausência dos totais pode ser uma restrição de exibição, não ausência de movimentos.

## Impressão e CSV

**Imprimir** imprime a listagem carregada no quadro inferior. **Baixar Arquivo** usa outra rotina e gera CSV com Descrição, Data e Valor, incluindo saldo anterior e total; as saídas recebem sinal negativo.

Na versão revisada, o download **não recebe o filtro Entradas/Saídas** e trata Descrição separadamente da consulta visual. Também há divergência no cálculo do total exportado quando existem entradas. Compare o CSV com a listagem sem filtros e com o controle diário; não use o total do arquivo como saldo conciliado sem essa conferência.

O arquivo pode conter descrições em várias linhas por causa dos títulos e observações vinculados. Abra com um leitor CSV que respeite campos entre aspas.

## Diferenças em relação a outros relatórios

- [Movimentações por Usuário](/relatorios/movimentacoes-financeiras-por-usuario) seleciona movimentos pela data/hora de registro e operador; pode mostrar outro conjunto para as mesmas datas.
- [Contas a Pagar](/relatorios/contas-a-pagar) e [Contas a Receber](/relatorios/contas-a-receber) trabalham com títulos e seus estados, não apenas dinheiro movimentado.
- [Projeções e Recebimentos](/relatorios/projecoes-e-recebimentos) contém valores consolidados e despesas nominais; seu saldo efetivo não é o saldo deste caixa.

Se uma linha estiver inesperada, confira data do caixa, usuário, tipo, associações e histórico na [Gerência Financeira](/financeiro/gerencia-financeira).

![Fluxo de Caixa no demo](/assets/screenshots/relatorios/fluxo-de-caixa.png)
