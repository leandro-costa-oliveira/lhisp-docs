---
title: Imprimir boletos do Gerencianet
published: true
editor: markdown
description: 'Seleção e impressão de boletos emitidos pelo Gerencianet'
---

# Imprimir boletos do Gerencianet

## Objetivo

Selecionar e imprimir, pelo fluxo de **Impressão de Carnês**, boletos vinculados a uma conta bancária configurada com cobrança Gerencianet.

## Pré-requisitos

- Conta bancária e carteira de cobrança Gerencianet configuradas.
- Contas a receber já emitidas e com URL de boleto disponível.
- Permissão para acessar a impressão de carnês.

## Passo a passo

1. Acesse **Financeiro > Impressão de Carnês**.
2. Selecione a filial e a conta bancária do Gerencianet.
3. Ajuste vencimento, faturamento, rede, plano, endereço e situação de impressão conforme necessário.
4. Use **Exibir** para conferir os títulos selecionados.
5. Use **Imprimir** para gerar a saída dos boletos.

## Campos principais

| Campo | Descrição |
|---|---|
| **Filial** | Restringe os contratos à unidade selecionada. |
| **Conta Bancária** | Define a carteira de cobrança; para este fluxo, selecione a conta Gerencianet. |
| **Vencimento / Faturamento** | Limitam o período dos títulos. |
| **Setor de Rede / Rede / Plano** | Restringem os contratos selecionados. |
| **Imprimir** | Filtra títulos não impressos, impressos ou todos. |
| **Exibir** | Carrega a seleção antes da impressão. |

## Comportamento específico do Gerencianet

Quando a conta possui URL de boleto e a carteira Gerencianet está configurada para impressão em PDF, o backend usa o documento fornecido pela integração. A tela não possui um botão separado chamado “Exportar Gerencianet”; a seleção ocorre pela conta bancária no fluxo de impressão.

## Problemas comuns

| Problema | Como tratar |
|---|---|
| Conta Gerencianet não aparece | Revise a conta bancária, a carteira de cobrança e a filial. |
| Boleto não é exibido | Confirme a emissão da conta e a presença da URL do boleto. |
| Seleção vazia | Revise período, vencimento, situação de impressão e demais filtros. |

## Referências de implementação

- `lhisp-php/web/form/financeiro/impressao_boletos.php`
- `lhisp-php/web/form/financeiro/impressao_boletos.js`
- `lhisp-php/web/form/financeiro/boleto.php`

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.
