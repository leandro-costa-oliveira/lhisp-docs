---
title: Traccar
published: true
editor: markdown
description: ''
---

# Traccar

## Objetivo

Configurar a integração com a API do Traccar.

## Quando usar

Use esta tela para informar a URL do servidor, usuário, senha e ativar a integração.

## Pré-requisitos

- Acesso ao menu **Sistema > Integrações > Traccar**.
- Permissão para editar a integração.

## Passo a passo

1. Acesse **Sistema > Integrações > Traccar**.
2. Preencha **Url do Servidor**.
3. Informe **Usuário** e **Senha**.
4. Marque **Ativo** se a integração estiver habilitada.
5. Clique em **Salvar**.

## Campos importantes

| Elemento | Descrição |
|---|---|
| **Url do Servidor** | Endpoint do serviço Traccar. |
| **Usuário** | Usuário de autenticação. |
| **Senha** | Senha de autenticação. |
| **Ativo** | Habilita ou desabilita a integração. |
| **Salvar** | Grava a configuração. |

## Resultado esperado

- A integração fica configurada com sucesso.
- O sistema usa a URL e credenciais informadas para comunicação com o Traccar.

## Problemas comuns

| Problema | Como tratar |
|---|---|
| URL inválida | Revisar o endereço do servidor. |
| Credenciais inválidas | Revisar usuário e senha. |
| Integração desativada | Marcar a opção **Ativo**. |

## Observações

- A captura do demo mostra o formulário de configuração da API sem valores preenchidos.
- O botão principal disponível é **Salvar**.

## Dúvidas para revisão

- A URL exige caminho específico além do domínio?
- Existem campos adicionais de autenticação não exibidos na captura?

## Screenshots sugeridos

- `assets/screenshots/sistema/traccar.png` — captura limpa da configuração da API Traccar no demo.

![Traccar no demo](/assets/screenshots/sistema/traccar.png)
