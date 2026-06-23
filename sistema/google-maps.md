---
title: Google Maps
published: true
editor: markdown
description: ''
---

# Google Maps

> **⚠️ Rascunho gerado por agente**
>
> Este documento foi produzido a partir da exploração da wiki do LHISP e da tela equivalente no ambiente de demonstração. As chaves exibidas no demo são apenas ilustrativas do ambiente de teste e não devem ser reutilizadas em produção.

## Objetivo

Configurar as credenciais de integração com o **Google Maps** para uso interno no LHISP, especialmente na busca e exibição de endereços e no suporte ao **Monitor de Redes**.

## Quando usar

Use este fluxo quando for necessário:

- cadastrar ou atualizar chaves de API do Google Maps;
- habilitar ou desabilitar a integração;
- definir se o sistema deve importar feriados nacionais;
- ajustar a integração usada pelo Monitor de Redes ou por outros recursos geográficos.

## Pré-requisitos

- Acesso ao menu **Sistema > Integrações > Google Maps**.
- Credenciais válidas da plataforma Google Cloud.
- Permissão para alterar integrações do sistema.

## Passo a passo

1. Acesse **Sistema > Integrações > Google Maps**.
2. Preencha a **Chave da Api para o Monitor de Redes** quando o uso exigir controle de origem.
3. Preencha a **Chave da Api para o Backend** quando o uso não exigir controle de origem.
4. Marque ou desmarque **Importar Feriados Nacionais?** conforme a política desejada.
5. Marque ou desmarque **Ativo?** para habilitar ou suspender a integração.
6. Clique em **Salvar**.

## Campos importantes

| Campo / ação | Descrição |
|---|---|
| **Chave da Api para o Monitor de Redes** | Credencial associada ao uso com controle de origem. |
| **Chave da Api para o Backend** | Credencial associada ao uso sem controle de origem. |
| **Importar Feriados Nacionais?** | Define se a integração deve carregar feriados nacionais. |
| **Ativo?** | Liga ou desliga a integração. |
| **Salvar** | Persiste as alterações. |

## Resultado esperado

- As chaves de API ficam registradas no LHISP.
- A integração passa a atender os recursos que dependem do Google Maps.
- A configuração pode ser habilitada ou desabilitada conforme necessário.

## Problemas comuns

| Problema | Como tratar |
|---|---|
| A tela não salva | Verifique se as chaves foram preenchidas corretamente e se o usuário tem permissão. |
| O mapa ou a busca de endereços não funcionam | Confirme se a integração está ativa e se as credenciais são válidas. |
| A importação de feriados não aparece | Revise a opção **Importar Feriados Nacionais?**. |
| O Monitor de Redes não mostra a geolocalização esperada | Revise a chave específica usada para o Monitor de Redes. |

## Observações

- A wiki informa que o uso do Google Maps exige a criação do projeto e das chaves na plataforma do Google.
- A página da wiki orienta o preenchimento das credenciais no LHISP após a criação das chaves.
- O demo mostra duas credenciais separadas: uma para o **Monitor de Redes** e outra para o **Backend**.
- A tela do demo também expõe as opções **Importar Feriados Nacionais?** e **Ativo?**.
- A captura usada nesta página veio do ambiente de demonstração, não da wiki.

## Dúvidas para revisão

- A chave do **Monitor de Redes** e a do **Backend** têm escopos diferentes obrigatórios ou são apenas configurações opcionais?
- A opção **Importar Feriados Nacionais?** depende da credencial do Google ou é totalmente independente?
- O nome oficial no menu deve ser mantido como **Google Maps** ou apenas **Google**?

## Screenshots sugeridos

- Tela **Google Maps - Configuração da API** no demo: `assets/screenshots/sistema/google-maps.png`

![Google Maps no demo](/assets/screenshots/sistema/google-maps.png)
