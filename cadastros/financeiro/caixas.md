---
title: Caixas
published: true
editor: markdown
description: ''
---

# Caixas

## Objetivo

Documentar a tela de listagem e cadastro de **Caixas** em **Cadastros > Financeiro > Caixas**.

## Quando usar

Use esta tela quando for necessário:

- consultar os caixas cadastrados;
- cadastrar um novo caixa;
- localizar um caixa pelo campo de busca;
- exportar a listagem para planilha.

## Pré-requisitos

- Acesso ao menu **Cadastros > Financeiro > Caixas**.
- Permissão para consultar e cadastrar registros financeiros.

## Passo a passo

1. Acesse **Cadastros > Financeiro > Caixas**.
2. Use o campo **Procurar** para filtrar a listagem, se necessário.
3. Clique em **Procurar** para executar a busca.
4. Clique em **Cadastrar** para criar um novo caixa.
5. Clique em **Baixar Planilha** para exportar a lista exibida.
6. Clique em um item da listagem para abrir o registro correspondente.

## Campos importantes

| Campo / ação | Descrição |
|---|---|
| Campo **Procurar** | Campo de filtro para localizar caixas na listagem. |
| Botão **Procurar** | Executa a busca com o termo digitado. |
| **Cadastrar** | Abre o fluxo de inclusão de um novo caixa. |
| **Baixar Planilha** | Exporta a listagem atual para arquivo de planilha. |
| **Id** | Identificador do caixa. |
| **Caixa** | Nome do caixa cadastrado. |
| **Espécies Aceitas** | No formulário, habilita ou desabilita **Dinheiro**, **Cartão**, **Cheque** e **Outros** para o caixa. As quatro opções iniciam marcadas em um novo cadastro. |

## Resultado esperado

- A lista de caixas fica visível com paginação.
- O usuário consegue abrir um caixa existente para consulta ou edição.
- O usuário consegue iniciar o cadastro de um novo caixa.

## Problemas comuns

| Problema | Como tratar |
|---|---|
| Nenhum resultado aparece | Verifique o termo informado no campo **Procurar**. |
| Registro não abre | Confirme se o usuário possui permissão para consultar o item. |
| Exportação não baixa | Refaça a ação em uma página com resultados carregados. |

## Observações

- A rota é `/cadastros/financeiro/caixas`.
- O formulário envia nome e as quatro espécies aceitas para `POST /api/Caixa.salvar`.
- A tela não exige vínculo com conta bancária ou forma de pagamento ao criar o caixa.

## Screenshots sugeridos

- `assets/screenshots/cadastros/financeiro/caixas.png` — captura limpa da listagem de caixas no demo.

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.
