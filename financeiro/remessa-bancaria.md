---
title: Remessa Bancária
published: true
editor: markdown
description: 'Consulta, geração e confirmação de remessas bancárias'
---

# Remessa Bancária

## Objetivo

Consultar remessas bancárias, selecionar títulos, gerar o arquivo e registrar sua confirmação de envio ao banco.

## Pré-requisitos

- Conta bancária configurada para remessa.
- Títulos emitidos no período desejado.
- Permissões para consultar e operar remessas.
- Aplicativo do banco ou VAN, quando o envio não for integrado.

## Consultar remessas

1. Acesse **Financeiro > Remessas Bancárias**.
2. Selecione a **Conta Bancária**, se quiser restringir a consulta.
3. Informe o período **Gerada em**.
4. Use o botão de atualização para carregar a lista.

Na listagem, conforme o estado da remessa e as permissões, podem estar disponíveis ações para ver detalhes, baixar o arquivo, imprimir títulos, confirmar o envio ou apagar a remessa.

## Gerar nova remessa

1. Clique em **Nova Remessa**.
2. Selecione a **Conta Bancária**.
3. Informe **Data Inicial** e **Data Final**.
4. Se necessário, filtre um **Contrato**.
5. Escolha se a seleção deve listar serviços **Bloqueados**, **Pendentes** e **Cancelados**.
6. Clique em **Exibir**.
7. Confira os títulos retornados e selecione os que entrarão no arquivo.
8. Use a ação de geração e confirme a operação.
9. Volte à listagem, baixe o arquivo e envie-o ao banco ou à VAN.
10. Depois do envio, use **Confirmar** para registrar que a remessa foi enviada ao banco.

## Campos e ações

| Campo ou ação | Descrição |
|---|---|
| **Conta Bancária** | Carteira usada para gerar ou filtrar remessas. |
| **Gerada em** | Período de criação usado na consulta das remessas. |
| **Data Inicial / Data Final** | Período dos títulos considerados na nova remessa. |
| **Contrato** | Restringe a seleção a um contrato. |
| **Bloqueados / Pendentes / Cancelados** | Incluem serviços nessas situações na seleção. |
| **Exibir** | Lista os títulos elegíveis; não gera o arquivo por si só. |
| **Download** | Baixa o arquivo da remessa. |
| **Confirmar** | Registra a confirmação de envio ao banco. |
| **Apagar** | Exclui a remessa após confirmação, quando permitido. |

## Cuidados

- **Remessa Bancária** e **Retorno Bancário** são fluxos distintos.
- Confira conta, período e títulos antes de gerar.
- Confirmar no LHISP não substitui o envio do arquivo ao banco ou à VAN.
- Não gere novamente o mesmo conjunto sem conferir a remessa anterior.

## Problemas comuns

| Problema | Como tratar |
|---|---|
| Nenhum título elegível | Revise período, conta e filtros de situação. |
| Banco rejeita o arquivo | Valide layout, carteira e configuração bancária. |
| Download não abre | Verifique permissão do navegador e a existência do arquivo gerado. |
| Ação não aparece | Confira a situação da remessa e as permissões do perfil. |

## Referências de implementação

- `lhisp-php/web/form/financeiro/remessa.php`
- `lhisp-php/web/form/financeiro/remessa.js`
- `lhisp-php/web/form/financeiro/remessa/nova.php`
- `lhisp-php/web/form/financeiro/remessa/nova_listagem.php`

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.
