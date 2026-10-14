---
title: Relatório de Fornecedores
published: true
editor: markdown
description: Pessoas marcadas como fornecedor, pesquisa pelo início do nome, impressão e CSV.
---

# Relatório de Fornecedores

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.

A tela `/relatorios/fornecedores` consulta o cadastro de **Pessoas** com `is_fornecedor = true`. Não lista somente fornecedores com compras ou contas a pagar: não há filtro por movimentação financeira ou período.

## Consultar

1. Digite o início do **Nome**.
2. Use **Atualizar** para aplicar o texto de pesquisa.
3. Confira nome, CPF/CNPJ, telefones e e-mail.
4. Use **Imprimir** ou **Baixar Planilha**.

A pesquisa é por prefixo (`nome LIKE texto%`), não por qualquer trecho. Sem texto, inclui os fornecedores que a consulta pode retornar. Os telefones 1 a 4 preenchidos são concatenados na mesma coluna; campos vazios não geram separadores individuais.

O rodapé mostra a quantidade de pessoas retornadas. Uma pessoa marcada como cliente e fornecedor também pode aparecer, porque o critério é a marca de fornecedor, não exclusividade do papel.

## CSV e conferência

O CSV contém **id, Nome, Cpf/Cnpj, Telefones e Email**. Há uma inconsistência de nome no código: o arquivo usa o nome-base `RelatorioConsultasSpcBrasil`, embora o conteúdo seja de fornecedores. Identifique a exportação pelo cabeçalho e renomeie a cópia quando necessário; não trate o nome do arquivo como indicação de consulta ao SPC.

A página usa o endpoint de Pessoas e não altera o cadastro. Se um fornecedor esperado não aparece, confira o início do nome digitado e a opção de fornecedor na pessoa. Para compras, valores devidos e pagamentos, consulte notas de compra e contas a pagar: esses dados não fazem parte deste relatório.

A saída inclui documentos e contatos. Limite sua distribuição à finalidade da consulta e ao acesso autorizado ao cadastro de pessoas.

## Fontes conferidas

Comportamento confrontado com os checkouts locais em 14/10/2026. Não comprova a versão instalada nem execução com dados reais.

- `lhisp-frontend/src/paginas/relatorios/fornecedores/RelatorioFornecedores.tsx:16`
- `lhisp-frontend/src/api/queries/sistema/usePessoas.ts:6`
- `lhisp-backend/src/lhisp-business/src/business/sistema/PessoaBI.js:4`
