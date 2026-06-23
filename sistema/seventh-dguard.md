---
title: Seventh - Dguard
published: true
editor: markdown
description: ''
---

# Seventh - Dguard

> **⚠️ Rascunho gerado por agente**
>
> Este documento foi produzido a partir da exploração da wiki do LHISP e da tela equivalente no ambiente de demonstração. Credenciais e valores sensíveis não foram documentados.

## Objetivo

Configurar a integração com a plataforma **DGuard da Seventh** para permitir autenticação, ativação da API e vínculo com planos que liberam o serviço OTT.

## Quando usar

Use este fluxo quando for necessário:

- configurar ou revisar a integração com a Seventh;
- informar URL, cliente, e-mail, senha e identificadores da revenda;
- ativar ou desativar a integração;
- associar a integração a planos para liberar o OTT DGuard.

## Pré-requisitos

- Acesso ao menu **Sistema > Integrações > Seventh Dguard**.
- Credenciais fornecidas pela Seventh.
- Permissão para editar planos em **Cadastros > Financeiros > Planos**.

## Passo a passo

1. Acesse **Sistema > Integrações > Seventh Dguard**.
2. Preencha os campos de acesso informados pela Seventh.
3. Marque **Ativo** quando a integração estiver pronta para uso.
4. Clique em **Salvar**.
5. Vá em **Cadastros > Financeiros > Planos**.
6. Selecione o plano desejado ou crie um novo.
7. Na área de detalhes do plano, marque a opção **OTT**.
8. Adicione o gateway **OTT: DGuard** para liberar o serviço ao contrato.

## Campos importantes

| Campo / ação | Descrição |
|---|---|
| **Url** | Endereço do serviço da Seventh. |
| **Cliente Id** | Identificador do cliente da integração. |
| **Email** | E-mail de autenticação. |
| **Senha** | Senha de autenticação. |
| **Provider Id** | Identificador do provedor. |
| **Revenda Id** | Identificador da revenda. |
| **Ativo** | Liga ou desliga a integração. |
| **Salvar** | Persiste a configuração. |

## Resultado esperado

- A integração fica configurada e habilitada para uso.
- O plano recebe o gateway OTT DGuard.
- Os contratos vinculados ao plano passam a exibir a liberação do OTT.

## Problemas comuns

| Problema | Como tratar |
|---|---|
| A integração não autentica | Revise URL, e-mail, senha e identificadores fornecidos pela Seventh. |
| O plano não libera o OTT | Confirme se a opção **OTT** foi marcada e se o gateway **OTT: DGuard** foi adicionado. |
| A integração não fica ativa | Verifique se a opção **Ativo** foi marcada antes de salvar. |
| O menu não aparece no local esperado | Use o caminho exato mostrado na wiki e no menu do demo. |

## Observações

- A wiki descreve a integração como **Seventh - Dguard**.
- No demo, o título da tela aparece como **SeventhDGuard - Configuração da API** e o menu como **Seventh DGuard**.
- A wiki orienta o uso do gateway **OTT: DGuard** nos planos.
- A captura usada nesta página veio do ambiente de demonstração, não da wiki.

## Dúvidas para revisão

- O nome de exibição deve seguir a wiki (**Seventh - Dguard**) ou o texto do demo (**Seventh DGuard**)?
- O gateway OTT deve aparecer em uma página própria na documentação de planos?
- Há mais campos obrigatórios além dos visíveis na tela do demo?

## Screenshots sugeridos

- Tela **SeventhDGuard - Configuração da API** no demo: `assets/screenshots/sistema/seventh-dguard.png`

![Seventh DGuard no demo](/assets/screenshots/sistema/seventh-dguard.png)
