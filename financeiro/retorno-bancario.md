---
title: Retorno Bancário
published: true
editor: markdown
description: 'Visualização e processamento de arquivo de retorno bancário'
---

# Retorno Bancário

## Objetivo

Visualizar e processar um arquivo de retorno bancário para conferir registros e efetuar as baixas correspondentes.

## Pré-requisitos

- Permissão para a aba **Retorno Bancário** da Gerência Financeira.
- Arquivo de retorno fornecido pelo banco em formato compatível com a conta bancária cadastrada.
- Backup e conferência do arquivo antes do processamento definitivo.

## Passo a passo

1. Acesse **Financeiro > Gerência Financeira > Retorno Bancário**.
2. Selecione o **Arquivo de retorno**.
3. Clique em **Visualizar**. Essa ação lê o arquivo, mas não altera os títulos.
4. Confira conta bancária, registros, valores, tarifas, situações e totais.
5. Se os dados estiverem corretos, clique em **Processar** e confirme. Essa ação executa as baixas.
6. Se necessário, use **CSV** ou **Imprimir** para obter uma cópia da conferência.

## Resultado exibido

| Informação | Descrição |
|---|---|
| **Conta bancária** | Banco, titular, agência e conta identificados no arquivo. |
| **Registros** | Filial, contrato, cliente, descrição, documento, vencimento, pagamento, crédito, valores, tarifa, situação e status bancário. |
| **Totais operacionais** | Baixas, registros confirmados, rejeitados, baixados pelo banco, outras ações e títulos não encontrados. |
| **Totais financeiros** | Quantidade de títulos, valor a receber, valor pago, tarifas e líquido. |

## Atenção

- **Visualizar** não altera títulos.
- **Processar** executa as baixas e exige confirmação.
- Não processe o mesmo arquivo novamente sem antes conferir o histórico e o resultado anterior.

## Problemas comuns

| Problema | Como tratar |
|---|---|
| Botões desabilitados | Selecione um arquivo. |
| Arquivo rejeitado | Confirme o layout e a conta bancária correspondente. |
| Títulos não encontrados | Compare número do documento, carteira e ambiente de emissão. |
| Valores divergentes | Não processe; valide o arquivo com o banco e o financeiro. |

## Referências de implementação

- `lhisp-frontend/src/paginas/financeiro/gerencia/TabRetornoBancario.tsx`
- ações `Financeiro.VisualizarRetornoBancario` e `Financeiro.ProcessarRetornoBancario`

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.
