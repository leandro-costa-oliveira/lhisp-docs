---
title: Campsoft
---

# Campsoft

!!! warning "Rascunho gerado por agente"
    Este documento foi produzido a partir da exploração da wiki do LHISP e da tela equivalente no ambiente de demonstração. O token exibido no demo é apenas ilustrativo do ambiente de teste e não deve ser reutilizado em produção.

## Objetivo

Configurar a integração com a **Campsoft** para autenticação entre sistemas, mantendo o token de comunicação e os recursos vinculados aos planos.

## Quando usar

Use este fluxo quando for necessário:

- ativar ou revisar a integração com a Campsoft;
- cadastrar o token enviado pela equipe da Campsoft;
- habilitar ou desabilitar a integração;
- liberar recursos de SVA em um plano associado.

## Pré-requisitos

- Acesso ao menu **Sistema > Integrações > Campsoft**.
- Token fornecido pela equipe da Campsoft.
- Permissão para alterar integrações e planos relacionados.

## Passo a passo

1. Acesse **Sistema > Integrações > Campsoft**.
2. Insira o token enviado pela equipe da Campsoft.
3. Verifique se a opção **Ativo** está marcada.
4. Clique em **Salvar**.
5. Se necessário, ajuste o plano em **Cadastros > Financeiro > Planos**.
6. No plano, selecione o gateway **Campsoft** e os recursos desejados.

## Campos importantes

| Campo / ação | Descrição |
|---|---|
| **Token** | Chave de integração fornecida pela Campsoft. |
| **Ativo** | Liga ou desliga a integração. |
| **Salvar** | Persiste a configuração. |
| **Histórico de Eventos** | Registra alterações feitas na tela. |

## Resultado esperado

- O token da Campsoft fica gravado no LHISP.
- A integração permanece ativa enquanto a opção **Ativo** estiver marcada.
- Os planos vinculados podem liberar os recursos previstos pela integração.

## Problemas comuns

| Problema | Como tratar |
|---|---|
| O token não salva | Verifique se o token foi informado corretamente e se o usuário tem permissão. |
| A integração não fica ativa | Confirme o estado da opção **Ativo** antes de salvar. |
| Os recursos não aparecem no plano | Revise a configuração em **Cadastros > Financeiro > Planos**. |
| O histórico não mostra eventos | Verifique se houve alteração efetiva na configuração. |

## Observações

- A wiki informa que a Campsoft fornece um serviço de autenticação para comunicação entre sistemas.
- A wiki orienta inserir o token enviado pela equipe da Campsoft.
- A wiki também menciona a configuração do plano em **Cadastros > Financeiro > Planos**, com seleção de **GatewayOtt: Campsoft** e do recurso desejado.
- O demo mostra a tela **Campsoft - Configuração da API** com campo de token, ativação e histórico de eventos.
- A captura usada nesta página veio do ambiente de demonstração, não da wiki.

## Dúvidas para revisão

- A configuração do plano deve virar uma página separada na documentação?
- O nome do campo **GatewayOtt** é exibido exatamente assim na interface ou há variação de capitalização?
- Existem mais recursos específicos que devem ser documentados além do token e do plano?

## Screenshots sugeridos

- Tela **Campsoft - Configuração da API** no demo: `docs/assets/screenshots/sistema/campsoft.png`

![Campsoft no demo](../assets/screenshots/sistema/campsoft.png)
