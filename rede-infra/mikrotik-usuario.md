---
title: Mikrotik: Criando Usuário
published: true
editor: markdown
description: ''
---

# Mikrotik: Criando Usuário

> **⚠️ Rascunho gerado por agente**
>
> Este documento foi produzido a partir da exploração da wiki do LHISP. Os valores exatos de usuários, senhas e permissões devem ser validados pela equipe técnica antes de qualquer uso em produção.

## Objetivo

Registrar o procedimento para criar um usuário local no **Mikrotik** com permissões completas para integração com o LHISP.

## Quando usar

Use este fluxo quando for necessário:

- permitir que o sistema acesse um Mikrotik;
- criar um usuário administrativo no equipamento;
- ajustar credenciais para integração via Winbox/SSH;
- preparar o equipamento para automação e configuração remota.

## Pré-requisitos

- Acesso ao Mikrotik via **Winbox** ou console equivalente.
- Permissão administrativa para criar usuários.
- Nome do usuário desejado.
- Senha escolhida para o acesso.
- Acesso ao grupo **full** no equipamento.

## Passo a passo

1. Acesse o Mikrotik pelo **Winbox**.
2. Vá em **System > Users**.
3. Clique no botão **+** para abrir a tela de novo usuário.
4. Preencha o campo **name** com o nome desejado.
5. Selecione o grupo **full** no campo **group**.
6. Informe a senha no campo **password**.
7. Repita a senha em **Confirm Password**.
8. Clique em **OK** para criar o usuário.

## Campos importantes

| Campo | Descrição |
|---|---|
| **name** | Nome do usuário que será criado. |
| **group** | Grupo de permissões; a wiki indica o grupo **full**. |
| **password** | Senha do novo usuário. |
| **Confirm Password** | Confirmação da senha informada. |

## Resultado esperado

- O usuário é criado com sucesso no Mikrotik.
- O sistema passa a ter um usuário com permissões totais para executar as configurações necessárias.
- O equipamento fica pronto para os próximos passos do fluxo de integração.

## Problemas comuns

| Problema | Como tratar |
|---|---|
| O usuário não é criado | Verifique se a senha e a confirmação coincidem. |
| O sistema não consegue aplicar configurações | Confirme se o grupo é **full**. |
| Acesso ao Winbox não está disponível | Verifique conectividade, credenciais e permissões administrativas. |

## Observações

- A wiki destaca que o grupo **full** é indispensável para a integração com o sistema.
- O procedimento é simples e focado apenas na criação do usuário administrativo.
- Não foi encontrada no demo uma tela equivalente 1:1 para essa etapa; por isso esta página foi migrada a partir do texto da wiki.

## Dúvidas para revisão

- O nome de usuário deve seguir algum padrão por cliente ou ambiente?
- A senha precisa obedecer a política mínima específica?
- Há outros grupos além de **full** suportados pela integração?
- O acesso via Winbox é obrigatório ou o fluxo também vale para SSH/terminal?

## Screenshots sugeridos

- A wiki não fornece uma captura operacional 1:1 e o demo não expõe essa mesma tela.
- Se surgir uma tela equivalente no demo, ela poderá ser adicionada em `assets/screenshots/rede-infra/mikrotik-usuario.png`.
