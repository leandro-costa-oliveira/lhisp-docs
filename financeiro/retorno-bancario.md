---
title: Retorno Bancário
published: true
editor: markdown
description: Conferência e processamento das ocorrências enviadas pelo banco.
---

# Retorno Bancário

O arquivo de retorno é a resposta do banco sobre cobranças enviadas pelo LHISP. Ele pode informar liquidação, confirmação ou rejeição de registro, baixa no banco e outras ocorrências. O processamento traduz cada registro conforme o banco/layout e atualiza as contas a receber correspondentes.

Essa importação não é uma simples planilha: ela altera títulos e pode gerar movimentações financeiras. Use primeiro a leitura sem gravação.

## Antes de processar

- obtenha o arquivo diretamente do banco e preserve uma cópia original;
- confirme que a [conta bancária](/cadastros/financeiro/contas-bancarias) e o padrão de cobrança estão cadastrados;
- verifique se o layout é suportado para o banco;
- não renomeie para simular outro formato e não edite posições do arquivo CNAB;
- confirme se o mesmo retorno já não foi processado.

O LHISP identifica a conta bancária pelo conteúdo do arquivo, calcula o tamanho das linhas para escolher CNAB 240, 400 ou 750 e então instancia o parser específico do banco. Nem toda combinação é implementada: por exemplo, o código legado rejeita retorno Itaú 240, Bradesco 240 e Sicredi 240.

## Visualizar e processar

1. Acesse **Financeiro > Gerência Financeira > Retorno Bancário**.
2. Selecione o arquivo.
3. Clique em **Visualizar**. O sistema interpreta o conteúdo, mas não altera os títulos.
4. Confira banco, titular, agência, conta, quantidades e totais.
5. Investigue rejeições, divergências e títulos não encontrados.
6. Somente com a prévia validada, clique em **Processar** e confirme.
7. Salve o CSV ou a impressão da conferência quando necessário.

O processamento ocorre dentro de uma transação de banco de dados. Se uma exceção interromper o arquivo, o backend executa rollback em vez de confirmar apenas parte daquele processamento.

## Como as linhas são relacionadas

Cada parser extrai convênio, número do documento, datas, valor pago, tarifa, status e ação. O LHISP procura contas a receber pelo número do documento e pela conta bancária. Quando há mais de uma conta para o mesmo documento, soma o valor devido para a comparação exibida.

| Ação bancária | Efeito esperado |
|---|---|
| **Efetuar baixa** | Registra o pagamento da conta identificada. |
| **Entrada confirmada** | Confirma que o título foi registrado pelo banco. |
| **Entrada rejeitada** | Registra a rejeição e apresenta o motivo/status retornado. |
| **Cancelamento do banco** | Reflete a baixa/cancelamento informado pelo banco. |
| **Outros** | Mantém a ocorrência disponível para análise sem tratá-la como liquidação. |

## Leitura da conferência

- **A receber** considera o valor calculado da conta na data de pagamento.
- **Pago** soma os valores informados pelo banco.
- **Tarifas** soma as tarifas do arquivo.
- **Líquido** é o valor pago menos as tarifas.
- pagamento maior que o valor calculado recebe destaque informativo;
- diferença positiva inferior a R$ 0,10 recebe alerta;
- diferença a partir de R$ 0,10 ou título inexistente recebe destaque de erro.

Esses destaques orientam a conferência; não substituem a validação do financeiro.

## Problemas comuns

| Sintoma | Verificação |
|---|---|
| Conta bancária não identificada | Arquivo, convênio, agência/conta e cadastro da carteira. |
| Formato inválido | Quantidade de colunas e layout CNAB fornecido pelo banco. |
| Título não encontrado | Número do documento, conta bancária e origem da cobrança. |
| Valor divergente | Multa, juros, desconto, pagamento parcial e tarifa. |
| Entrada rejeitada | Motivo retornado pelo banco; corrija o título antes de nova remessa. |
| Arquivo já processado | Histórico da conta e movimentações antes de repetir a importação. |

> **Atenção:** **Visualizar** é somente leitura. **Processar** executa as ocorrências reconhecidas. Não reprocesse um arquivo para tentar corrigir divergências sem antes confirmar o estado dos títulos.
