---
title: API de Integração para Parceiros
published: true
editor: markdown
description: ''
---

# API de Integração para Parceiros

> **⚠️ Rascunho gerado por agente**
>
> Este documento foi produzido a partir da wiki do LHISP e da tela equivalente no ambiente de demonstração. O token exibido no demo é apenas ilustrativo do ambiente de teste e não deve ser reaproveitado em produção.

## Objetivo

Ativar e consultar a **API de integração para parceiros** do LHISP, permitindo que sistemas externos se autentiquem e consumam os endpoints disponíveis.

## Quando usar

Use este fluxo quando for necessário:

- ativar a integração via API;
- gerar ou renovar o token de acesso do parceiro;
- validar se a API está habilitada;
- consultar a documentação dos endpoints;
- acompanhar o histórico de eventos da integração.

## Pré-requisitos

- Acesso ao menu **Sistema > Integrações > Api Parceiros**.
- Permissão para alterar configurações de integração.
- Definição do parceiro ou sistema externo que consumirá a API.

## Passo a passo

1. Acesse **Sistema > Integrações > Api Parceiros**.
2. Verifique se a opção **Ativo** está marcada.
3. Caso necessário, clique em **Gerar novo token**.
4. Copie e compartilhe o token com o parceiro autorizado.
5. Clique em **Salvar** para confirmar a configuração.
6. Use o link **Documentação dos Endpoints** para consultar as rotas disponíveis.
7. Confira o **Histórico de Eventos** para auditar alterações e uso da integração.

## Campos importantes

| Campo / ação | Descrição |
|---|---|
| **Token** | Chave usada pelo parceiro para autenticação. |
| **Gerar novo token** | Cria uma nova chave de acesso. |
| **Ativo** | Indica se a API está habilitada. |
| **Salvar** | Persiste a configuração. |
| **Documentação dos Endpoints** | Abre a documentação técnica dos recursos. |
| **Histórico de Eventos** | Lista alterações e eventos registrados. |

## Resultado esperado

- A API fica habilitada para o parceiro autorizado.
- O token é atualizado quando necessário.
- O parceiro consegue acessar os endpoints documentados.
- Alterações ficam registradas no histórico de eventos.

## Problemas comuns

| Problema | Como tratar |
|---|---|
| A integração não autentica | Verifique se o token foi copiado corretamente e se o header correto está sendo usado. |
| O parceiro não acessa os endpoints | Confirme se a opção **Ativo** está marcada e se o token ainda é válido. |
| A documentação não abre | Teste o link da documentação e revise as permissões do ambiente. |
| O histórico não mostra eventos | Valide se houve alterações efetivas na configuração. |

## Observações

- A wiki informa que a autenticação ocorre por **bearer token**, enviado no header **x-parceiro-auth**.
- A página da wiki orienta a ativação em **sistema > integracoes > api parceiros**.
- O demo mostra a tela **Api Parceiros** com token, ativação, salvamento e link para a documentação dos endpoints.
- A captura usada nesta página veio do ambiente de demonstração, não da wiki.

## Dúvidas para revisão

- O nome oficial do módulo deve ser escrito como **Api Parceiros** ou **API de Integração para Parceiros**?
- Há expiração automática do token gerado?
- Existe controle por parceiro ou apenas um token global?
- A documentação de endpoints é pública ou depende de autenticação adicional?

## Screenshots sugeridos

- Tela **Api Parceiros** no demo: `assets/screenshots/sistema/api-parceiros.png`

![Api Parceiros no demo](/assets/screenshots/sistema/api-parceiros.png)
