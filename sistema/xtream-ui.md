---
title: Xtream-UI
published: true
editor: markdown
description: ''
---

# Xtream-UI

> **⚠️ Rascunho gerado por agente**
>
> Este documento foi produzido a partir da exploração da wiki do LHISP e da tela equivalente no ambiente de demonstração. Os dados sensíveis exibidos no demo foram redigidos na captura desta documentação quando necessário.

## Objetivo

Configurar a integração com **Xtream-UI** para informar a URL do servidor, o usuário de acesso e habilitar a API.

## Quando usar

Use este fluxo quando for necessário:

- apontar o servidor da integração Xtream-UI;
- informar o usuário de autenticação;
- cadastrar o `Cliente Secret`;
- ativar a integração no LHISP.

## Pré-requisitos

- Acesso ao menu **Sistema > Integrações > Xtream-UI** no demo.
- Dados de conexão do servidor Xtream-UI.
- Credenciais fornecidas para a API.

## Passo a passo

1. Acesse **Sistema > Integrações > Xtream-UI**.
2. Informe a **URL do Servidor**.
3. Preencha o **Usuário** de acesso.
4. Informe o **Cliente Secret** quando houver.
5. Marque **Ativo** se a integração estiver liberada.
6. Clique em **Salvar**.

## Campos importantes

| Campo / ação | Descrição |
|---|---|
| **URL do Servidor** | Endereço do endpoint da integração Xtream-UI. |
| **Usuário** | Nome do usuário usado para autenticação. |
| **Cliente Secret** | Segredo de autenticação da API. |
| **Ativo** | Liga ou desliga a integração. |
| **Salvar** | Persiste a configuração. |

## Resultado esperado

- A integração fica configurada com a URL correta do servidor.
- O usuário de autenticação fica registrado no sistema.
- A integração pode ser ativada para uso nos fluxos dependentes.

## Problemas comuns

| Problema | Como tratar |
|---|---|
| A URL do servidor não funciona | Confirme se o endpoint está acessível e se a URL foi informada corretamente. |
| A autenticação falha | Revise o usuário e o `Cliente Secret` fornecidos para a API. |
| A integração não fica ativa | Verifique se a opção **Ativo** foi marcada antes de salvar. |

## Observações

- No demo, a tela aparece como **XtreamUI - Configuração da API**.
- A captura usada nesta página foi validada visualmente e não expõe segredo no campo **Cliente Secret**.
- O campo **Usuário** aparece preenchido com `streamui` na captura do demo.

## Dúvidas para revisão

- O nome público da documentação deve manter **Xtream-UI** ou seguir a grafia **XtreamUI** do demo?
- Existe algum campo adicional da integração que não aparece na tela principal?

## Screenshots sugeridos

- Tela **XtreamUI - Configuração da API** no demo: `assets/screenshots/sistema/xtream-ui.png`

![Xtream-UI no demo](/assets/screenshots/sistema/xtream-ui.png)
