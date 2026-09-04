---
title: Gerência Financeira
published: true
editor: markdown
description: Operação integrada de caixas, contas a receber, contas a pagar e retornos bancários.
---

# Gerência Financeira

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.

A Gerência Financeira é o ponto operacional em que títulos e dinheiro se encontram. Contas a receber representam valores de clientes; contas a pagar representam obrigações da empresa; caixas registram as entradas e saídas efetivas. A baixa de um título cria ou associa uma movimentação, permitindo conciliar o saldo financeiro com a situação das contas.

As abas aparecem conforme as permissões do usuário. Caixa e data selecionados no **Controle de Caixa** permanecem ao trocar de aba e são usados como padrão ao pagar uma conta.

## Controle de Caixa

Exibe as movimentações de um caixa em uma data, com saldo anterior, entradas, saídas e saldo final. Cada linha registra usuário, espécie, documento e valor e pode estar associada a contas a receber, contas a pagar ou a outra movimentação.

Operações disponíveis conforme permissão:

- criar entrada ou saída manual;
- fazer sangria, gerando a transferência entre caixas;
- importar extrato OFX ou solicitar extrato pela API da conta vinculada;
- anexar comprovantes e adicionar observações com valor;
- associar ou desassociar títulos e movimentações durante a conciliação;
- imprimir ou baixar o movimento diário em CSV.

> **Atenção:** excluir ou desassociar uma movimentação pode reativar saldo de uma conta e alterar o caixa. Confirme todas as associações exibidas na linha antes da ação.

## Contas a Receber

Concentra títulos gerados por mensalidades, vendas, instalações e outros fluxos do contrato. A tela resume total líquido, saldo a receber, recebido e cancelado e permite filtrar por vencimento, filial, situação ou número do documento.

Uma conta aberta pode ser recebida parcial ou integralmente. A baixa exige caixa, datas, espécie e valor; no cartão também exige uma tarifa cadastrada e pode registrar a autorização. Usuários com permissão específica podem dispensar multa e juros. O recebimento cria uma entrada no caixa e mantém a associação com a conta.

Contas canceladas podem ser reativadas conforme permissão. Edição e histórico ficam disponíveis por título; ações permitidas dependem da situação da conta.

## Contas a Pagar

Reúne obrigações manuais, [despesas recorrentes](/cadastros/financeiro/despesas), compras e lançamentos de folha. Os filtros incluem filial, fornecedor, centro de custo, categoria, caixa, descrição, vencimento e situação.

Uma conta em aberto pode ser:

- paga total ou parcialmente, criando uma saída ou consumindo o saldo de uma movimentação existente;
- editada, copiada ou excluída conforme permissão;
- acompanhada por histórico e anexos;
- estornada quando possui valor pago. O estorno exige selecionar a movimentação financeira correspondente.

O sumário diferencia valor nominal, saldo em aberto, valor pago e cancelado. A planilha padrão e o formato AG usam os filtros selecionados.

## Retorno Bancário

Processa arquivos enviados pelo banco para atualizar contas a receber. Há duas fases:

1. **Visualizar:** lê o arquivo, identifica conta bancária e ocorrências e mostra títulos, valores, tarifas e status sem alterar as contas.
2. **Processar:** após confirmação, executa baixas e demais ocorrências reconhecidas pelo parser do banco.

A prévia resume contas pagas, registradas, rejeitadas, baixadas pelo banco, não encontradas e outras ações. Use esses totais para detectar arquivo incorreto, títulos ausentes ou rejeições antes do processamento.

> **Importante:** visualizar primeiro não reserva nem altera registros. Se o estado financeiro mudar entre a prévia e o processamento, confira novamente o resultado final.

## Fluxo recomendado

1. Confira o caixa e a data operacional.
2. Importe ou consulte movimentações bancárias quando aplicável.
3. Processe retorno somente depois de revisar banco, titular, totais e títulos não encontrados.
4. Baixe contas manuais no caixa correto e com a espécie real.
5. Associe movimentações já existentes em vez de gerar duplicidade.
6. Ao final, confira saldo, contas parcialmente baixadas e itens ainda sem conciliação.

## Situações comuns

| Sintoma | Verificação |
|---|---|
| Aba ou ação não aparece | Permissão específica do perfil e situação do registro. |
| Caixa não aparece | Cadastro ativo e caixas atribuídos ao usuário. |
| Espécie recusada | Espécies aceitas no [cadastro do caixa](/cadastros/financeiro/caixas). |
| Saldo duplicado | Existência de movimentação bancária ainda não associada antes da baixa manual. |
| Retorno não identifica título | Conta bancária/layout, número do documento e origem do arquivo. |
| Estorno bloqueado | Valor pago, permissão e movimentação associada obrigatória. |

O ícone de ambulância abre a gerência legada, que ainda contém fluxos não migrados para a SPA.

## Captura da tela

![Gerência Financeira](/assets/screenshots/gerencia-financeira/gerencia-financeira.png)
