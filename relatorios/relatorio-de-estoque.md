---
title: Relatório de Estoque
published: true
editor: markdown
description: Saldo atual por almoxarifado, categoria e produto, com impressão e CSV.
---

# Relatório de Estoque

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.

A tela `/relatorios/almoxarifado/estoque`, intitulada **Relatório de Material Almoxarifado**, consulta a quantidade atual de cada registro de estoque. Não possui data de referência e não reconstitui saldo de um dia passado.

## Aplicar os filtros

1. Escolha um **Almoxarifado**. A consulta só é habilitada após essa seleção.
2. Selecione **Categoria**, se necessário. A caixa ao lado alterna entre **somente a categoria escolhida** e **todas, exceto a escolhida**.
3. Informe parte do nome no campo **Produto** para procurar em qualquer posição.
4. Marque **Exibir Produtos com Estoque Zero?** quando precisar retirar o filtro padrão de quantidade maior que zero.
5. Aguarde a atualização e use os ícones de **Imprimir** ou **Baixar Planilha**.

Ao habilitar a opção de estoque zero, o filtro de quantidade é removido: registros negativos também podem aparecer se existirem no banco. A opção não cria linhas para produtos que nunca tiveram um registro de estoque nesse almoxarifado.

## Campos e exportação

A tabela apresenta **Categoria**, **Produto**, **Quantidade com unidade** e **Preço** unitário cadastrado. O CSV possui essas mesmas quatro colunas e usa o nome-base `RelatorioMaterialAlmoxarifado`. Não há totalização do valor de inventário na tela.

A consulta lê registros separados por almoxarifado/local. A saída não mostra a coluna de local nem agrupa explicitamente pelo produto; nomes repetidos podem corresponder a locais diferentes. Confira o almoxarifado e o histórico do produto antes de considerar duplicidade.

Produtos patrimoniais não são discriminados por série ou patrimônio nesta listagem. Para identificar unidades físicas, abra o controle patrimonial; a quantidade agregada não substitui essa conferência.

O BI de estoque restringe a empresa, e a consulta depende do acesso do usuário à área de almoxarifados. Para entradas/saídas e saldo do intervalo, use [Movimentações de Produtos](/relatorios/movimentacoes-de-produtos).
