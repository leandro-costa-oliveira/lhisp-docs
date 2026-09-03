---
title: Contrato
published: true
editor: markdown
description: ''
---

# Contrato

## Objetivo

Consultar contratos e acessar as rotinas de dados cadastrais, serviços, acessos, financeiro e atendimento.

## Quando usar

Use esta página quando precisar acessar o módulo de contratos como ponto de entrada do fluxo operacional do provedor.

## Pré-requisitos

- Estar autenticado no LHISP.
- Ter permissão para acessar o módulo **Contratos**.

## Passo a passo

1. Acesse o menu principal do LHISP.
2. Clique em **Contratos**.
3. A tela principal exibirá a listagem de contratos.
4. A partir dela, use o botão de novo cadastro para iniciar um contrato ou navegue para os fluxos relacionados.

## Campos e elementos importantes

| Elemento | Descrição |
|---|---|
| **Contratos** | Módulo principal usado como ponto de entrada do fluxo diário. |
| **Listagem de contratos** | Relação de contratos já cadastrados no sistema. |
| **Botão de novo cadastro** | Inicia o fluxo de criação de contrato. |
| **Abas do contrato** | Depois de abrir um contrato, o sistema organiza o trabalho em abas como **Serviços**, **Acessos**, **Financeiro**, **NF**, **Atendimentos**, **OTT**, **Telefonia**, **Produtos**, **Documentos** e **Observações**. |
| **Número do contrato** | No cabeçalho do cadastro, permite informar um número e pressionar `Enter` para localizar o contrato correspondente. |
| **Anterior / Próximo** | Navega para os contratos adjacentes. |
| **Nova interface / tela legada** | Na aba **Dados**, permite alternar entre o formulário React e `form/contratos/tab_dados_enderecos.php`. |

## Resultado esperado

- O usuário acessa a área principal de contratos.
- A listagem de contratos fica disponível para consulta.
- Os fluxos de criação e manutenção de contrato ficam acessíveis a partir dessa tela.

## Problemas comuns

| Problema | Como tratar |
|---|---|
| Não encontra o módulo | Verificar perfil de acesso e menu disponível no sistema. |
| Lista vazia | Confirmar se há contratos cadastrados na filial atual. |
| Não consegue iniciar novo contrato | Validar permissões do usuário. |

## Observações

- A rota de listagem é `/contratos`; o cadastro usa `/contratos/:contrato_id` e `add` representa um contrato novo.
- As abas **Serviços**, **Acessos**, **OTT** e **Produtos** carregam formulários PHP legados. **Financeiro**, **NF** e **Atendimentos** também reutilizam telas legadas dentro de componentes React. **Telefonia** e **Observações** têm interface React própria.
- A exclusão na aba **Dados** exige confirmação e chama `Contrato.Apagar`; nas abas legadas, a ação é delegada à barra do formulário carregado.
- A aba **Documentos** usa a interface React somente quando `localStorage.newTabDocs` é `true`; caso contrário, carrega o formulário legado.
