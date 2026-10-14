---
title: Trocar a Senha
published: true
editor: markdown
description: Altere a senha do painel e a credencial separada dos equipamentos, com confirmação do segundo fator quando ativo.
---

# Trocar a senha

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.

A tela atual **Minhas senhas**, em `/conta/senhas`, separa a senha de login no LHISP da credencial usada pelo operador para acessar equipamentos via RADIUS. Trocar uma não altera a outra, nem a senha PPPoE do assinante.

## Alterar

1. Abra **Minhas senhas**, também acessível pelo link em [Segurança da conta](/sistema/seguranca-da-conta).
2. Escolha **Senha do sistema** ou, se disponível, **Senha de acesso aos equipamentos**.
3. Em **Sua senha do sistema**, informe a senha atual do painel, inclusive ao alterar a senha dos equipamentos.
4. Preencha **Nova senha** e **Confirme a nova senha** com o mesmo valor.
5. Se o autenticador estiver ativo, selecione autenticador ou código de recuperação e informe o segundo fator.
6. Clique em **Alterar senha** e aguarde a confirmação.

| Credencial | Regras do fluxo atual |
|---|---|
| Sistema | De 12 a 1.024 caracteres; deve ser diferente da senha atual. |
| Equipamentos | De 8 a 50 caracteres ASCII visíveis, sem espaços ou acentos. O cartão só aparece para contas com acesso aos equipamentos. |

O botão permanece indisponível enquanto faltarem campos, a confirmação divergir, a senha não atender ao formato ou houver operação em andamento. Um código de recuperação utilizado nessa confirmação é consumido; não reutilize o mesmo na operação seguinte.

## Conferência

O retorno confirma a gravação da credencial escolhida. Se houver erro ao gravar a senha de equipamentos, encaminhe a mensagem ao suporte sem informar a senha.

A mudança não substitui cadastro de NAS, grupos de acesso ou conectividade RADIUS. Confira esses itens quando a senha foi gravada, mas o equipamento ainda recusa o login.

| Mensagem/sintoma | Conferência |
|---|---|
| Senha atual incorreta | Use a senha do painel, não a antiga senha do equipamento. |
| Nova senha igual à atual | Informe uma senha diferente para o sistema. |
| Segundo fator inválido | Código atual do autenticador ou recuperação ainda não usada. |
| Cartão de equipamentos ausente | Conta sem acesso aos equipamentos no cadastro de [Usuários](/sistema/usuarios). |
| Erro de gravação da senha de equipamentos | Registre a mensagem e acione o suporte, sem compartilhar a senha. |

O formulário PHP legado **Sistema > Trocar a Senha** continua sendo um caminho distinto, com validações próprias. A captura abaixo é histórica e não representa os dois cartões da tela atual; não use seus rótulos para inferir os requisitos da SPA.

![Formulário legado de troca de senha](/assets/screenshots/sistema/trocar-a-senha.png)
