---
title: Notas Fiscais de Compra
published: true
editor: markdown
description: ''
---

# Notas Fiscais de Compra

> **⚠️ Rascunho gerado por agente**
>
> Esta página foi validada no ambiente de demonstração do LHISP com um XML real de teste. O fluxo documentado abaixo cobre a consulta inicial, a importação do XML e o envio dos produtos para o estoque.
>
> Veja também a página-resumo do fluxo: [Material para Técnico](/estoque/material-para-tecnico).
>
> Se a entrada for feita manualmente pelo almoxarifado, veja o caminho alternativo em [Entrada de Material](/estoque/entrada-de-material).

## Objetivo

Importar uma nota fiscal de compra por XML, revisar os dados carregados e lançar os produtos no estoque.

## Quando usar

Use este fluxo quando o material chegar por nota fiscal e você precisar:

- importar o XML da NF-e;
- conferir os dados do fornecedor e dos itens;
- lançar os produtos no almoxarifado escolhido;
- seguir o caminho de entrada por documento fiscal.

## Pré-requisitos

- Estar autenticado no LHISP.
- Ter permissão para acessar **Estoque > Notas Fiscais de Compra**.
- Ter um XML de teste válido para importar.
- Saber em qual **Filial** a nota será lançada.

## Passo a passo

1. Acesse **Estoque > Notas Fiscais de Compra**.
2. Clique em **Cadastrar**.
3. Selecione a **Filial** correta no formulário.
4. Clique em **Enviar XML**.
5. Selecione o arquivo XML de teste.
6. Confirme a importação em **Importar XML**.
7. Verifique se o sistema preencheu automaticamente:
   - **Fornecedor**;
   - **CNPJ**;
   - **Inscrição Estadual**;
   - **Telefone**;
   - **Data de Emissão**;
   - **Número de Série**;
   - **Natura da Operação**.
8. Revise os itens carregados na grade de produtos.
9. Clique na ação de lançamento para abrir o diálogo **Lançar Produtos**.
10. Escolha o **Almoxarifado** de destino.
11. Confirme em **Lançar Produtos**.

## O que o demo mostrou com o XML de teste

O XML usado no demo trouxe os seguintes dados principais:

- **Fornecedor:** `INTELBRAS S/A - IND DE TEL ELET BRA`
- **CNPJ:** `82.901.000/0015-22`
- **Inscrição Estadual:** `062006339`
- **Telefone:** `(92)3652-4019`
- **Data de emissão:** `5/16/2026`
- **Número de série:** `41959958`
- **Natureza da operação:** `Venda producao do estabelecimento`

Itens carregados na grade:

| Código | Descrição | Un | NCM | Cest | Qtd | Valor Un. | Total |
|---|---|---|---|---|---:|---:|---:|
| `4565611` | `CAMERA DE VIDEO WIFI FHD IM5 SC C/ MICROSD 32GB - DCRE 2022/08202-2` | `PEÇ` | `85258929` | `2106500` | `96` | `R$321,87` | `R$30.899,52` |
| `4565614` | `CAMERA VIDEO WIFI FULL HD IMX C C/MICROSD 32GB - DCRE 2022/08190-5` | `PEÇ` | `85258929` | `2106500` | `200` | `R$228,86` | `R$45.772,00` |

## Campos importantes

### Na tela principal

| Campo / ação | Descrição |
|---|---|
| **Procurar** | Busca textual na listagem de notas. |
| **Aplicar Filtros** | Aplica os filtros da listagem. |
| **Cadastrar** | Abre o formulário de nova nota. |
| **Baixar Planilha** | Exporta a listagem. |
| **First / Last** | Paginação. |

### No formulário de importação

| Campo / ação | Descrição |
|---|---|
| **Filial** | Define a filial onde a nota será lançada. |
| **Enviar XML** | Abre o seletor de arquivo para anexar o XML. |
| **Importar XML** | Processa o arquivo anexado e preenche os dados da nota. |
| **Fornecedor** | Nome do emitente carregado do XML. |
| **CNPJ** | CNPJ do fornecedor. |
| **Inscrição Estadual** | IE do fornecedor. |
| **Telefone** | Telefone do emitente. |
| **Data de Emissão** | Data da NF-e. |
| **Número de Série** | Série da nota importada. |
| **Natura da Operação** | Natureza da operação vinda do XML. |

### No diálogo de lançamento

| Campo / ação | Descrição |
|---|---|
| **Almoxarifado** | Define o estoque de destino. |
| **Lançar Produtos** | Confirma a entrada dos itens no estoque. |

## Resultado esperado

- O XML é aceito e os dados da nota são preenchidos automaticamente.
- Os itens da NF-e aparecem na grade de produtos.
- O diálogo **Lançar Produtos** é aberto para a seleção do almoxarifado.
- Após a confirmação, os produtos ficam disponíveis no estoque do local escolhido.

## Problemas comuns

| Problema | Como tratar |
|---|---|
| O XML não é reconhecido | Confirme se o arquivo é uma NF-e válida e se a filial foi selecionada. |
| Os campos não são preenchidos | Reimporte o XML e verifique se o anexo foi aceito corretamente. |
| O diálogo de lançamento não aparece | Revise se a importação concluiu sem erro e se a ação de lançamento foi acionada. |
| O estoque não muda após o lançamento | Verifique o almoxarifado escolhido e a confirmação final do fluxo. |

## Observações

- A rota observada no demo foi `/estoque/notas_fiscais_compra/add`.
- O formulário libera os botões **Importar XML** e **Lançar Produtos** após o arquivo ser anexado e processado.
- No teste realizado, o XML carregou automaticamente os dados do fornecedor e dois itens de compra.
- O diálogo de confirmação exibiu o título **Lançar Produtos** e o seletor de almoxarifado.
- O demo não apresentou navegação visível após a confirmação final, então a evidência principal ficou no formulário preenchido e no diálogo aberto.

## Dúvidas para revisão

- O botão **Lançar Produtos** grava a entrada imediatamente ou abre outra confirmação?
- A nota precisa ser salva em alguma etapa adicional antes da importação?
- Existe algum campo obrigatório que só aparece com outros tipos de XML?

## Screenshots sugeridos

- Tela de listagem **Notas Fiscais de Compra** no demo: `assets/screenshots/estoque/notas-fiscais-de-compra-listagem.png`
- Formulário preenchido após importação do XML: `assets/screenshots/estoque/notas-fiscais-de-compra-importacao.png`
- Diálogo **Lançar Produtos** aberto: `assets/screenshots/estoque/notas-fiscais-de-compra-lancar-produtos.png`
