---
title: Cobli
published: true
editor: markdown
description: ''
---

# Cobli


## Objetivo

Registrar a integração **Cobli**, usada para configurar token, ativação e persistência da API de rastreamento/telemetria.

## Quando usar

Use esta tela para:

- revisar o token de integração;
- ativar ou desativar a API;
- salvar a configuração do ambiente.

## Pré-requisitos

- Acesso ao menu **Sistema > Integrações > Cobli**.
- Permissão para consultar ou alterar a configuração da API.
- Token de integração fornecido pela Cobli.

## Passo a passo

1. Acesse **Sistema > Integrações > Cobli**.
2. Revise o campo **Token**.
3. Verifique se a opção **Ativo** está marcada conforme o ambiente.
4. Clique em **Salvar** para persistir as alterações.

## Campos importantes

| Campo / elemento | Observação |
|---|---|
| **Token** | Chave de autenticação da integração. |
| **Ativo** | Define se a integração está habilitada. |
| **Salvar** | Persiste a configuração. |

## Resultado esperado

- A API Cobli fica autenticada com o token correto.
- A integração pode ser ligada ou desligada por ambiente.
- A configuração fica salva para uso pelo sistema.

## Problemas comuns

| Problema | Como tratar |
|---|---|
| Token inválido | Confirme o valor fornecido pela Cobli. |
| Integração desativada | Verifique se **Ativo** está marcado. |
| Não consigo salvar | Confira permissões e validade dos campos. |

## Observações

- A captura do demo estava limpa e sem marcações visuais.
- A tela exibida no demo é bem enxuta e contém apenas token, status e ação de salvar.
- O valor do token exibido no demo não foi reproduzido nesta documentação por cautela.
- A página é direta, sem abas ou tabelas auxiliares.

## Screenshots sugeridos

- Tela principal de **Cobli** no demo: `assets/screenshots/sistema/cobli.png`

![Cobli no demo](/assets/screenshots/sistema/cobli.png)
