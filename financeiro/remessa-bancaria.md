---
title: Remessa Bancária
published: true
editor: markdown
description: Geração, envio e confirmação de instruções de cobrança em arquivo CNAB.
---

# Remessa Bancária

A remessa envia ao banco instruções sobre contas a receber: registrar títulos novos e comunicar alterações aceitas pelo layout. O LHISP seleciona as cobranças elegíveis, agrupa contas pelo número do documento, gera o arquivo CNAB da carteira e registra quais títulos participaram.

Remessa não confirma pagamento. Depois do envio, o banco responde por [Retorno Bancário](/financeiro/retorno-bancario), API ou webhook.

## Pré-requisitos

- conta bancária com carteira, cedente, agência, conta e CNAB homologados;
- combinação de banco, carteira e layout suportada pelo LHISP;
- contas a receber abertas e dentro do período;
- permissão de operação e acesso à conta bancária;
- canal de envio ao banco ou VAN, quando não houver registro via API.

## Seleção dos títulos

Na nova remessa, escolha conta bancária, intervalo de vencimento e, opcionalmente, um ou mais números de contrato. Os filtros de situação permitem incluir serviços bloqueados, pendentes e cancelados; bloqueados vêm marcados inicialmente.

O sistema lista contas elegíveis da carteira e consolida registros com o mesmo número de documento e cliente. O valor é recalculado pelas regras da conta, considerando o vencimento ou prorrogação e valores já pagos. A prévia separa boletos novos e alterados.

> **Correção importante:** a tela atual não possui seleção individual por checkbox. **Gerar Remessa** inclui o conjunto elegível exibido, com uma entrada por número de documento.

## Geração e envio

1. Acesse **Financeiro > Remessas Bancárias** e clique em **Nova Remessa**.
2. Informe conta, intervalo e filtros; clique em **Exibir**.
3. Confira filial, contrato, cliente, documento, vencimento, valor e situação.
4. Clique em **Gerar Remessa**.
5. Volte à listagem e baixe o arquivo.
6. Envie-o pelo canal homologado do banco.
7. Somente depois do envio, use **Confirmar** no LHISP.

A geração ocorre em transação: cria a remessa, associa cada conta, grava as linhas CNAB e incrementa o sequencial da conta bancária. Se não houver contas ou a geração falhar, a transação é revertida pelo fluxo da tela.

Quando a conta possui chave de aplicação, a prévia também oferece **Registrar Via API**. Esse caminho tenta registrar cada cobrança diretamente e exibe o resultado por linha; ele não deve ser confundido com a criação do arquivo CNAB.

## Estados e ações

- **Gerada/não enviada:** arquivo disponível; ainda pode ser apagada por administrador de filial.
- **Confirmada/enviada:** grava usuário e data/hora da confirmação e atualiza o estado de remessa dos títulos.
- **Download:** reconstrói o arquivo usando as linhas armazenadas e o nome exigido pelo banco.
- **Apagar:** desassocia os títulos e devolve seu estado para não enviado; remessa já confirmada não pode ser apagada.

Confirmar apenas registra no LHISP que o envio ocorreu. Não transmite o arquivo ao banco.

## Layouts implementados

O código legado possui geradores específicos, entre outros, para Banco do Brasil 240/400, Santander 400, Caixa 240/400, BNB 400, Bradesco 400, Sicredi 400, Sicoob 240 e Unicred 400/750. A existência de uma opção CNAB no cadastro não garante suporte para qualquer banco/carteira; a geração rejeita combinações não implementadas.

## Problemas comuns

| Sintoma | Verificação |
|---|---|
| Nenhum título | Período, conta bancária, situação do serviço, remessa anterior e número do contrato. |
| Banco rejeita o arquivo | Banco/carteira/CNAB, cedente, sequencial e dados dos pagadores. |
| Título aparece como alterado | Mudanças realizadas depois de uma remessa anterior. |
| Duplicidade | Remessas já geradas/confirmadas para o mesmo documento antes de criar outra. |
| Não é possível apagar | Remessa já confirmada como enviada. A correção deve seguir o processo bancário. |

> **Atenção:** confira e guarde o arquivo efetivamente transmitido. Não confirme antes do envio e não gere outro lote para substituir silenciosamente uma remessa rejeitada.
