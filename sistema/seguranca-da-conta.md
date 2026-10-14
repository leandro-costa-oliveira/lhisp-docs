---
title: Segurança da conta — 2FA, passkeys e sessão
description: Ative o autenticador, preserve códigos de recuperação, gerencie passkeys e diagnostique a sessão do painel.
published: true
editor: markdown
---

# Segurança da conta — 2FA, passkeys e sessão

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.

O painel disponibiliza **Segurança da conta** em `/conta/seguranca`. Essa configuração pertence ao usuário administrativo autenticado; não altera a senha do assinante, do vendedor ou do aplicativo técnico.

## Entrar com verificação em duas etapas

1. Informe usuário e senha no domínio do provedor.
2. Quando aparecer **Verificação em duas etapas**, informe o código de seis dígitos do autenticador.
3. Se precisar, escolha **Usar código de recuperação** e informe um código ainda não utilizado.
4. Clique em **Confirmar código**. Para cancelar a tentativa pendente, use **Voltar ao login**.

Código inválido, expirado ou já utilizado não conclui o acesso. O desafio possui prazo e limite de tentativas; depois de expirar, reinicie o login. Confira o horário do dispositivo autenticador antes de repetir códigos.

## Ativar o autenticador

1. Abra `/conta/seguranca` e clique em **Ativar 2FA**.
2. Confirme a senha atual e clique em **Continuar**.
3. Escaneie o QR Code no autenticador ou use a chave manual.
4. Informe um código atual de seis dígitos e clique em **Ativar**.
5. Guarde os códigos de recuperação exibidos, usando **Copiar** ou **Baixar**, antes de fechar a lista.

Gerar o QR Code não termina a ativação: a confirmação do código é necessária. O segredo é exibido durante esse cadastro; não o inclua em screenshots ou chamados.

Cada código de recuperação funciona uma única vez. A lista não volta a ser mostrada depois de fechada. **Gerar novos códigos** exige senha atual e autenticador ou código de recuperação, e invalida os códigos anteriores. Guarde a nova lista em substituição à antiga.

**Remover TOTP** também exige senha e confirmação de segundo fator, além da confirmação da ação. Perder o autenticador e todos os códigos exige tratamento pelo suporte; a tela não oferece recuperação anônima que dispense a confirmação da identidade.

## Cadastrar e usar passkeys

A passkey permite entrar sem digitar usuário/senha, usando a confirmação do dispositivo, como biometria ou PIN. Ela vale para o domínio indicado na própria tela.

1. Confirme que a seção **Passkeys** apresenta um domínio configurado e que o navegador oferece suporte.
2. Faça uma autenticação forte recente, com autenticador, código de recuperação válido ou passkey existente. Se a sessão nasceu apenas de senha, ative o autenticador e entre novamente antes de cadastrar o primeiro dispositivo.
3. Na seção de passkeys, informe um apelido e use a ação de cadastro.
4. Conclua a confirmação do navegador/dispositivo e confira o novo item na lista.
5. No login seguinte, escolha **Entrar com passkey** no mesmo domínio.

A lista mostra cadastro e último uso, permite renomear e remover uma credencial. Cadastrar e remover exigem autenticação forte recente; se aparecer **REAUTENTICACAO_NECESSARIA**, entre novamente com autenticador, código de recuperação válido ou uma passkey atual. Renovar silenciosamente a sessão não substitui essa nova autenticação.

Sem domínio configurado, a tela informa indisponibilidade para aquele provedor. Trocar de domínio, navegador ou perfil pode mudar as credenciais oferecidas pelo dispositivo. Cancelar o diálogo do navegador não cria uma passkey.

## Sessão e troca de senha

Use **Minhas senhas**, em `/conta/senhas`, para a senha do sistema e a credencial própria de equipamentos. Veja também [Trocar a senha](/sistema/trocar-a-senha).

O painel atual usa cookies de sessão seguros e tenta renovar o acesso automaticamente. Os padrões do backend são dez minutos para acesso, doze horas para renovação e sete dias de limite absoluto; a implantação pode alterar esses valores. Renovação não garante permanência ilimitada no painel.

Em sessão expirada, volte ao login. Para falhas de origem/cookies, confira HTTPS, domínio da instalação, proxy e relógio; não copie um token do navegador como solução de acesso. Requisições de escrita também usam proteção CSRF. O frontend tenta recuperar casos de token desatualizado, mas uma falha persistente precisa de diagnóstico da sessão.

## Diagnóstico

| Situação | Conferência |
|---|---|
| Código recusado | Código atual, relógio do autenticador e desafio de login ainda válido. |
| Código de recuperação recusado | Uso anterior, regeneração da lista ou código incorreto. |
| QR Code gerado, 2FA ainda inativo | Falta confirmar um código válido. |
| Não é possível cadastrar/remover passkey | Novo login forte e domínio/suporte do navegador. |
| Passkey de outro endereço não aparece | Domínio e dispositivo que armazenam a credencial. |
| Sessão não se mantém | HTTPS/cookies, domínio, prazo da renovação e configuração de proxy. |

Autenticar não concede acesso a todos os módulos. Permissões e vínculos continuam definidos em [Usuários](/sistema/usuarios). As diferenças entre PHP, Node e interfaces precisam ser consideradas ao diagnosticar uma operação específica.
