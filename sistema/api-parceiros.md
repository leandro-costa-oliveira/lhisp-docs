---
title: API de Integração para Parceiros
published: true
editor: markdown
description: Ative a API REST, configure autenticação e consulte os recursos de clientes, financeiro, pré-cadastros e ordens de serviço.
---

# API de Integração para Parceiros

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.

A API REST permite integrar clientes, contratos, acessos, financeiro, atendimentos, pré-cadastros e ordens de serviço. A documentação técnica da própria instalação fica em `/api-parceiros/docs`, aberta pelo link **Documentação dos Endpoints**.

Para clientes que usam Model Context Protocol, configure a integração [MCP — Api de Parceiros](/sistema/mcp), que possui credenciais e seleção de ferramentas próprias.

## Pré-requisitos

- Acesso ao menu **Sistema > Integrações > Api Parceiros**.
- Permissão para alterar configurações de integração.
- Definição do parceiro ou sistema externo que consumirá a API.

## Passo a passo

1. Acesse **Sistema > Integrações > Api Parceiros**.
2. Preencha o **Token** ou use a ação de geração do campo.
3. Marque **Ativo** e clique em **Salvar**.
4. Compartilhe o token por canal seguro com o integrador autorizado.
5. Abra **Documentação dos Endpoints** e confira as rotas, os parâmetros e os schemas da versão instalada.
6. Faça uma consulta de leitura para validar a autenticação antes de usar operações de escrita.

Ao trocar e salvar o token, o valor anterior deixa de autenticar. Atualize todos os consumidores que compartilham essa credencial.

## Campos importantes

| Campo / ação | Descrição |
|---|---|
| **Token** | Chave usada pelo parceiro para autenticação. |
| **Gerar novo token** | Cria uma nova chave de acesso. |
| **Ativo** | Indica se a API está habilitada. |
| **Salvar** | Persiste a configuração. |
| **Documentação dos Endpoints** | Abre a documentação técnica dos recursos. |
| **Histórico de Eventos** | Exibe os eventos registrados para a integração; não equivale a um registro garantido de todas as chamadas REST. |

## Autenticação e endereço

Envie o token no header:

```http
x-parceiro-auth: Bearer <TOKEN_DO_PARCEIRO>
```

Use o domínio da instalação com o prefixo `/api-parceiros`. A empresa é identificada pela instalação; o consumidor externo usa as credenciais da integração.

O token identifica a integração do provedor. A tela REST não oferece seleção individual de endpoints; disponibilize a credencial somente a consumidores autorizados para as operações expostas.

## Recursos que exigem atenção

| Recurso | Comportamento |
|---|---|
| **Planos** — `GET /planos` | Lista os planos ativos por padrão; `incluirInativos` inclui os desativados. O `id` corresponde ao `PlanoId` usado no pré-cadastro. |
| **Formas de pagamento** — `GET /formas_pagamento` | Fornece os identificadores usados no faturamento da instalação. |
| **Financeiro** — `GET /cliente/{PessoaId}/financeiro` | Consulta títulos dos contratos da pessoa. `PessoaId` é o identificador do cliente/pessoa, distinto do contrato e do serviço contratado. `situacao` aceita 0 (aberta), 1 (paga) ou 2 (cancelada). |
| **PDF da ordem de serviço** — `GET /ordem_servico/{id}/pdf` | Retorna `pdfUrl`, um link com token válido por 12 horas que abre sem sessão do painel. Preserve o link como credencial de acesso ao documento. |
| **Criar/confirmar pré-cadastro** — `POST /pre_cadastro` e `POST /pre_cadastro/{id}/confirmar` | A confirmação efetiva a venda. Quando há instalação a faturar, confira também `data.instalacao.faturada` e `data.instalacao.erro`. |

As rotas da tabela são relativas a `/api-parceiros`. Consulte os schemas na documentação técnica antes de montar as requisições.

A confirmação do pré-cadastro pode gravar a venda e depois falhar no faturamento da instalação. Nesse caso, `instalacao.faturada=false` não significa que o cliente/contrato deixou de ser criado. Confira os identificadores retornados e conclua o faturamento pelo painel, sem repetir a venda.

## Problemas comuns

| Problema | Como tratar |
|---|---|
| A integração não autentica | Verifique se o token foi copiado corretamente e se o header correto está sendo usado. |
| O parceiro não acessa os endpoints | Confirme se a opção **Ativo** está marcada e se o token ainda é válido. |
| A documentação não abre | Teste o link da documentação e revise as permissões do ambiente. |
| Erro de base/empresa | Confira o domínio da instalação e as credenciais; se persistir, encaminhe o erro ao suporte. |
| Financeiro retorna pessoa não encontrada ou resultado inesperado | Use `PessoaId`; confira se não foi enviado o identificador do contrato ou serviço contratado. |
| Venda confirmada, instalação não faturada | Confira `data.instalacao` e efetue o faturamento pendente pelo painel. |
| O histórico não mostra uma chamada REST | O histórico depende dos eventos registrados pela integração; para auditoria de ferramentas MCP, consulte os logs da integração MCP. |

![Api Parceiros no demo](/assets/screenshots/sistema/api-parceiros.png)
