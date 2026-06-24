---
title: Produtos
published: true
editor: markdown
description: ''
---

# Produtos

> **⚠️ Rascunho gerado por agente**
>
> Esta página foi revisada a partir da tela equivalente no ambiente de demonstração do LHISP.
> O menu abre primeiro a listagem e, ao clicar em **Cadastrar**, o sistema mostra o formulário de manutenção do produto.
>
> Veja também a trilha completa: [Material para Técnico](/estoque/material-para-tecnico).

## Objetivo

Cadastrar, consultar e revisar produtos de estoque usados no fluxo de entrada de material e separação para o técnico.

## Quando usar

Use esta tela quando for necessário:

- consultar produtos cadastrados;
- cadastrar um novo produto;
- vincular o produto a uma categoria de estoque;
- definir unidade, preço e opções do item;
- revisar itens que serão usados em entrada de estoque ou ordem de separação.

## Pré-requisitos

- Acesso ao menu **Cadastros > Estoque > Produtos**.
- Permissão para consultar e cadastrar registros de estoque.
- Categoria de estoque previamente cadastrada, quando o produto precisar de classificação.

## Passo a passo

### Na listagem

1. Acesse **Cadastros > Estoque > Produtos**.
2. Use o campo **Procurar** para filtrar a listagem, se necessário.
3. Clique em **Procurar** para executar a busca.
4. Clique em um item da lista para abrir o produto correspondente.
5. Clique em **Cadastrar** para abrir o formulário de inclusão/manutenção.
6. Clique em **Baixar Planilha** para exportar a listagem exibida.

### No formulário

1. Preencha o campo **Produto** com o nome do item.
2. Selecione a **Categoria** desejada.
3. Informe a **Unidade** do produto.
4. Defina o **Preço**, quando aplicável.
5. Marque as opções operacionais que fizerem sentido para o item.
6. Clique em **Salvar** para gravar o cadastro.
7. Use **Cancelar** para sair sem salvar.
8. Use o botão de exclusão, quando houver permissão para apagar o item.

## Campos importantes

| Campo / ação | Descrição |
|---|---|
| **Id** | Identificador interno do produto. |
| **Produto** | Nome do item cadastrado. É o principal campo obrigatório. |
| **Categoria** | Classificação do produto. No demo, o seletor apresentou opções como **ESCRITORIO**, **INSTALAÇÃO** e **LIMPEZA**. |
| **Unidade** | Unidade de medida do produto. |
| **Preço** | Valor associado ao item. |
| **Produto Retornável de Locação do Contrato ?** | Indica se o item pode ser tratado como retornável em locação. |
| **Habilitar Controle Patrimonial** | Marca o item para controle patrimonial. |
| **Exigir Número de Série** | Obriga o preenchimento de número de série. |
| **Exigir Número de Patrimônio** | Obriga o preenchimento de patrimônio. |
| **Exigir Endereço Mac** | Obriga o preenchimento do endereço MAC. |
| **Salvar** | Grava o produto criado ou editado. |
| **Cancelar** | Cancela a alteração/inclusão em andamento. |
| **Apagar** | Remove o produto, quando o perfil permite. |

## Resultado esperado

- O produto fica cadastrado e disponível na listagem.
- O item pode ser vinculado à categoria correta de estoque.
- O cadastro fica pronto para uso nos fluxos de entrada de material e separação.

## Problemas comuns

| Problema | Como tratar |
|---|---|
| O botão **Salvar** não grava | Verifique se os campos obrigatórios, como **Produto**, foram preenchidos. |
| A categoria não aparece | Confirme se a categoria já foi cadastrada em **Cadastros > Estoque > Categorias**. |
| O produto não aparece na listagem | Use **Procurar** ou revise se a página está filtrada. |
| Não consigo apagar o item | O perfil pode não ter permissão para exclusão. |

## Observações

- A listagem do demo exibiu produtos como **ROTEADOR 2 ANTENAS**, **ROTEADOR 5 ANTENAS**, **ONU ABC**, **ONU FIBERHOME**, **ROTEADOR TPLINK 2 ANTENTAS**, **ROTEADOR TPLINK 4 ANTENAS**, **PAPEL A4**, **DETERGENTE**, **HUAWEI AX3** e **Drop SUMEC**.
- A captura limpa da listagem mostrou os botões principais de **pesquisa**, **inclusão** e **exportação CSV** no topo da tela.
- O formulário abriu com o título **Alteração**, mesmo quando acionado a partir da inclusão.
- A tela mostra uma estrutura simples, mas com vários controles de validação para uso operacional.
- Esta página é base para o fluxo de entrada de material e para a separação do técnico.

## Dúvidas para revisão

- A seleção de categoria é obrigatória em todos os perfis?
- A **Unidade** e o **Preço** são obrigatórios no cadastro ou apenas informativos?
- As opções de controle patrimonial e série são usadas somente em itens específicos?
- O botão **Apagar** remove o produto mesmo quando já há movimentação associada?

## Screenshots sugeridos

- Tela **Produtos** na listagem do demo: `assets/screenshots/cadastros/estoque/produtos.png`
- Tela de cadastro/alteração de produto no demo: `assets/screenshots/cadastros/estoque/produtos-formulario.png`
