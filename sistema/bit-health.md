---
title: Bit Health
published: true
editor: markdown
description: ''
---

# Bit Health

> **⚠️ Rascunho gerado por agente**
>
> Este documento foi produzido a partir da exploração da wiki do LHISP e da tela equivalente no ambiente de demonstração. O token exibido no demo é apenas ilustrativo do ambiente de teste e não deve ser reutilizado em produção.

## Objetivo

Configurar a integração com a **Bit Health** para autenticação entre sistemas e liberação de recursos vinculados aos planos.

## Quando usar

Use este fluxo quando for necessário:

- criar ou revisar o token de integração;
- habilitar ou desabilitar a integração;
- configurar o plano com recursos da Bit Health;
- consultar a API que autentica usuários e retorna dados do acesso.

## Pré-requisitos

- Acesso ao menu **Sistema > Integrações > Bit Health**.
- Permissão para alterar integrações e planos.
- Definição dos recursos que serão liberados nos planos.

## Passo a passo

1. Acesse **Sistema > Integrações > Bit Health**.
2. Verifique o token gerado ou informado para a integração.
3. Marque a opção **Ativo** quando a integração estiver pronta para uso.
4. Clique em **Salvar**.
5. Em **Cadastros > Financeiro > Planos**, localize o plano desejado.
6. Selecione o gateway **Bit Health** e o recurso correspondente.
7. Use os dados autenticados pela API para liberar o acesso ao serviço contratado.

## Campos importantes

| Campo / ação | Descrição |
|---|---|
| **Token** | Chave usada na autenticação com a Bit Health. |
| **Ativo** | Liga ou desliga a integração. |
| **Salvar** | Persiste a configuração. |
| **GatewayOtt: Bit Health** | Gateway selecionado no plano. |
| **Recurso** | Serviço liberado no plano. |

## Resultado esperado

- O token de integração fica associado ao LHISP.
- A integração passa a autenticar os sistemas consumidores.
- Os planos podem liberar os recursos previstos para a Bit Health.

## Problemas comuns

| Problema | Como tratar |
|---|---|
| O token não está preenchido | Verifique se a geração automática ocorreu ou se o valor foi informado corretamente. |
| A integração não autentica | Confirme se o token foi enviado no cabeçalho correto e se a opção **Ativo** está marcada. |
| O plano não libera o serviço | Revise a configuração do plano em **Cadastros > Financeiro > Planos**. |
| A API retorna erro de parâmetros | Confira os campos `usuario`, `senha` e `recurso` no corpo da requisição. |

## Observações

- A wiki informa que a integração usa um token criado em **Sistema > Integrações > Bit Health**.
- A wiki orienta selecionar o gateway **Bit Health** no plano e associar o recurso desejado.
- A wiki também descreve uma API de autenticação com `x-api-key` e parâmetros enviados como `x-www-form-urlencoded`.
- O demo mostra a tela **Bit Health - Configuração da API** com token, ativação e histórico de eventos.
- A captura usada nesta página veio do ambiente de demonstração, não da wiki.

## Dúvidas para revisão

- O token deve ser gerado automaticamente sempre ou pode ser informado manualmente?
- O cabeçalho da API é sempre `x-api-key` em todos os cenários?
- O valor do campo **Recurso** deve seguir uma lista fixa ou pode ser customizado por plano?

## Screenshots sugeridos

- Tela **Bit Health - Configuração da API** no demo: `assets/screenshots/sistema/bit-health.png`

![Bit Health no demo](/assets/screenshots/sistema/bit-health.png)
