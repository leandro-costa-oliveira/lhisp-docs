---
title: Movimentações de Produtos
published: true
editor: markdown
description: Entradas e saídas por almoxarifado, produto e período, com saldo de movimentos.
---

# Movimentações de Produtos

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.

A consulta legada **Relatório de Movimentações de Produtos** mostra entradas e saídas registradas no histórico de estoque de um almoxarifado. Ela apura o movimento do intervalo; seu **Saldo** não é o estoque físico final.

## Consultar

1. Abra **Relatórios → Movimentações de Produtos** no legado.
2. Selecione o **Almoxarifado**, obrigatório.
3. Opcionalmente selecione um **Produto**.
4. Informe **Período** inicial/final; o formulário começa com o dia atual.
5. Clique em **Exibir** e, depois, **Imprimir** se necessário.

O backend recusa almoxarifado inválido. A consulta filtra `HISTORICOESTOQUE.DATAHORA` entre `00:00:00` do dia inicial e `23:59:59` do dia final, ordenando do registro mais recente para o mais antigo.

## Ler as linhas

A tabela apresenta data/hora, usuário, localização, produto, descrição, quantidade, preço e total. Entradas recebem destaque azul e sinal `+`; saídas, destaque amarelo e sinal `-`. O saldo acumula entradas menos saídas, partindo de zero no intervalo. Não adiciona o saldo anterior.

O preço usado na listagem vem de **PRODUTO.VALOR atual**, e o total é `quantidade × preço`. Portanto não use esses valores como custo histórico da movimentação ou valorização contábil sem confronto com os documentos de origem. As colunas de total de cada linha não incorporam automaticamente o sinal da saída.

A coluna de localização é prevista na saída, mas o método de consulta não faz a junção do local; pode ficar vazia. A tela não fornece exportador CSV específico.

## Consulta atual por produto

Também existe histórico na área **Almoxarifados**, rota `/almoxarifados/<AlmoxarifadoId>/<ProdutoId>/historico`, com período, usuário, local, descrição e quantidade. Esse histórico relaciona estoque e locação e permite conferir a origem de uma movimentação. Para saldo atual, consulte [Relatório de Estoque](/relatorios/relatorio-de-estoque).
