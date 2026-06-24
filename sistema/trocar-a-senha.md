---
title: Trocar a Senha
published: true
editor: markdown
description: ''
---

# Trocar a Senha

## Objetivo

Permitir que o usuário altere a senha de acesso ao sistema no menu **Sistema**.

## Quando usar

Use esta tela quando for necessário atualizar a senha do usuário logado.

## Pré-requisitos

- Estar autenticado no LHISP.
- Ter a senha atual válida.

## Passo a passo

1. Acesse **Sistema > Trocar a Senha**.
2. Informe a **Senha Atual**.
3. Preencha a **Nova Senha**.
4. Confirme a senha no campo **Confirmar Senha**.
5. Clique em **Trocar**.

## Campos importantes

| Campo | Descrição |
|---|---|
| **Senha Atual** | Senha atual do usuário. |
| **Nova Senha** | Nova senha desejada. |
| **Confirmar Senha** | Repetição da nova senha para validação. |
| **Trocar** | Confirma a alteração. |

## Resultado esperado

- A senha é atualizada com sucesso quando os campos são válidos.
- O usuário passa a autenticar com a nova senha.

## Problemas comuns

| Problema | Como tratar |
|---|---|
| Senha atual inválida | Verificar se a senha foi digitada corretamente. |
| Confirmação diferente da nova senha | Repetir a mesma senha nos dois campos. |
| Falha ao trocar a senha | Revisar conexão, permissões e mensagens exibidas pelo sistema. |

## Observações

- A tela do demo mostra apenas os campos de senha e o botão **Trocar**.
- A área do formulário aparece no demo.

## Dúvidas para revisão

- Existe política mínima de complexidade para a nova senha?
- O sistema exige logout imediato após a troca?

## Screenshots sugeridos

- `assets/screenshots/sistema/trocar-a-senha.png` — captura limpa da tela de troca de senha no demo.

![Trocar a Senha no demo](/assets/screenshots/sistema/trocar-a-senha.png)
