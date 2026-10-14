---
title: Clientes Negativados (SPC)
published: true
editor: markdown
description: Revise pessoas com negativação SPC aberta e contas vencidas, incluindo candidatos à remoção.
---

# Clientes Negativados (SPC)

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.

O formulário legado `relatorios/clientes_spc` cruza a marcação SPC da pessoa com registros de negativação ainda **sem data de encerramento**. A consulta não contata o SPC para conferir a situação externa e não inclui nem remove uma restrição.

## Filtros e operação

1. Abra o relatório com sessão autenticada e acesso ao formulário.
2. Selecione **Filial** e **Tipo** de pessoa, física ou jurídica, ou deixe-os vazios para ampliar a consulta permitida.
3. Informe o **Período** de inclusão no SPC, quando necessário.
4. Marque **Listar Somente Contratos para Remoção?** para localizar negativados sem contas abertas vencidas encontradas na consulta.
5. Clique em **Exibir** e, se necessário, **Imprimir**.

As datas se referem à **inclusão da negativação**, não ao vencimento da dívida. Os limites usam inclusão maior ou igual ao início e menor ou igual ao fim. Não existe CSV próprio na tela.

## Dívidas e contagem

As contas consideradas precisam estar **em aberto** e ter vencimento até a data atual, inclusive hoje. O total é a soma dos valores nominais; não soma juros nem usa uma data de referência escolhida pelo operador.

No modo normal, o agrupamento é por **contrato**. Com a opção de remoção, passa a ser por **pessoa**, reunindo seus contratos na seleção e exigindo contagem de contas igual a zero. Assim, a unidade do resultado muda e o rodapé “Contratos” não descreve corretamente esse segundo modo.

A grade contém contrato, filial, nome, CPF/CNPJ, telefones, e-mail, data de inclusão, quantidade de contas abertas, vencimento e valor. Linhas sem contas ficam destacadas em verde.

## Conferência antes de remover uma restrição

A coluna **Vencimento Mais Antigo** é preenchida com um vencimento da consulta agrupada, sem `MIN` ou ordenação que garantam o mais antigo. Consulte as contas do contrato para confirmar a data real.

A ausência de dívida nessa listagem é um indício para revisão, não uma ordem de exclusão no SPC. Confira outros contratos do titular, pagamentos, acordos e o retorno da integração antes de executar a remoção pelo fluxo próprio de negativação.

Veja também [Clientes para Cobrança](/relatorios/clientes-para-cobranca) e [Clientes Cancelados](/relatorios/clientes-cancelados).
