---
title: Plano de documentação do fluxo de material para o técnico
published: true
editor: markdown
description: ''
---

# Plano de documentação do fluxo de material para o técnico

> **📝 Plano de exploração e documentação**
>
> Este documento organiza a criação de uma documentação em blocos menores para o fluxo fim a fim de entrega de material ao técnico no demo do LHISP.
> O objetivo é evitar uma página única e longa, deixando o conteúdo dividido por etapa e com links entre as páginas.

## Objetivo

Documentar, em formato passo a passo, o fluxo completo de estoque que começa no cadastro dos itens-base e termina na entrega do material ao técnico.

## Resultado esperado

Ao final da documentação, o repositório deve ter:

- uma página-resumo com o mapa do fluxo completo;
- páginas menores, cada uma cobrindo uma etapa operacional;
- links internos entre as páginas para permitir leitura sequencial;
- screenshots limpas do demo em todas as telas principais;
- observações claras sobre o que depende de XML de teste ou de permissões específicas.

## Fluxo que será coberto

1. Cadastrar uma categoria de estoque.
2. Cadastrar um produto.
3. Dar entrada do material.
   1. Entrada manual no menu **Almoxarifados**, usando o botão **+** e o wizard **Nova Movimentação**.
   2. Entrada por **Nota Fiscal de Compra**, em **Estoque > Nota Fiscal de Compra**, com XML de teste.
4. Fazer uma ordem de separação para o técnico em **Estoque > Ordens de Separação**.
5. Confirmar a entrega do material ao técnico na tela de ordens de separação.

## Estrutura documental prevista

| Arquivo | Papel na documentação | Situação |
|---|---|---|
| `estoque/material-para-tecnico.md` | Página-resumo do fluxo fim a fim, com links para todas as etapas | novo |
| `cadastros/estoque/categorias.md` | Cadastro da categoria de estoque usada no fluxo | novo |
| `cadastros/estoque/produtos.md` | Cadastro do produto de estoque, revisado para o fluxo | já existe, pode ser expandido |
| `estoque/entrada-de-material.md` | Entrada manual e por nota fiscal, com links para os dois caminhos | novo |
| `estoque/ordens-de-separacao.md` | Separação para o técnico e confirmação de entrega | já existe, precisa ser expandido |
| `estoque/notas-fiscais-de-compra.md` | Página de apoio para a entrada por NF, se for necessário detalhar a listagem e o cadastro | já existe, pode ser complementada |

## Estratégia de links entre os arquivos

A documentação deve ser escrita como uma trilha de leitura.

- A página `estoque/material-para-tecnico.md` será o ponto de entrada.
- Cada página de etapa deve ter um link de volta para a página-resumo.
- Quando houver bifurcação de caminho, a própria página deve apontar para os dois fluxos:
  - entrada manual;
  - entrada por nota fiscal.
- As páginas já existentes devem ser reaproveitadas quando fizerem sentido, em vez de criar conteúdo duplicado.

## Ordem sugerida de exploração e escrita

### 1. Validar o escopo no demo

**Objetivo:** confirmar os nomes exatos dos menus, botões e modais que serão documentados.

**Foco da exploração:**

- **Cadastros > Estoque > Categorias**;
- **Cadastros > Estoque > Produtos**;
- **Almoxarifados**;
- **Estoque > Nota Fiscal de Compra**;
- **Estoque > Ordens de Separação**.

**Saída esperada:**

- nomes exatos de menus e botões;
- confirmação de quais telas existem de fato no demo;
- indicação de quais etapas precisam de screenshot própria.

### 2. Documentar o cadastro de categoria

**Objetivo:** criar a página da categoria de estoque, porque ela é a base do fluxo.

**Arquivo alvo:** `cadastros/estoque/categorias.md`

**Pontos a registrar:**

- como abrir a tela;
- campos obrigatórios;
- ação de cadastrar;
- resultado esperado após salvar.

**Observação:**

- não confundir com a página de categorias do módulo financeiro, que já existe em outro caminho.

### 3. Revisar o cadastro de produto

**Objetivo:** ajustar a página de produto para o contexto do fluxo de material.

**Arquivo alvo:** `cadastros/estoque/produtos.md`

**Pontos a revisar:**

- vínculo com categoria de estoque, se aparecer na tela;
- quais campos são realmente relevantes para a entrada e separação;
- link para a página de categoria.

### 4. Documentar a entrada manual de material

**Objetivo:** detalhar o caminho manual a partir de **Almoxarifados**.

**Arquivo alvo:** `estoque/entrada-de-material.md`

**Subseção obrigatória:**

- abrir **Almoxarifados**;
- clicar no botão **+**;
- seguir o wizard do diálogo **Nova Movimentação**;
- confirmar o salvamento da entrada.

**Pontos de atenção:**

- registrar cada etapa do wizard em ordem;
- capturar os campos do diálogo;
- anotar se existe alguma validação antes do envio.

### 5. Documentar a entrada por nota fiscal de compra

**Objetivo:** cobrir o caminho fiscal de entrada do material.

**Arquivo alvo:** `estoque/entrada-de-material.md` ou uma subpágina específica, caso o fluxo fique extenso.

**Subseção obrigatória:**

- abrir **Estoque > Nota Fiscal de Compra**;
- iniciar o cadastro/importação;
- anexar ou importar um XML de teste;
- confirmar que a nota gera a entrada de estoque.

**Dependência crítica:**

- será necessário um XML de teste sem dados sensíveis para validar o passo a passo.

### 6. Expandir a página de ordens de separação

**Objetivo:** transformar a página existente em documentação do fluxo de separação e entrega.

**Arquivo alvo:** `estoque/ordens-de-separacao.md`

**Pontos a incluir:**

- criação da ordem pelo botão **+**;
- preenchimento dos campos necessários;
- abertura da ordem criada;
- confirmação da entrega do material ao técnico.

**Observação:**

- se a entrega ocorrer por um botão específico dentro da ordem, esse botão deve ser nomeado exatamente como aparece no demo.

## Pacote de screenshots esperado

As imagens devem ser limpas, sem marcações vermelhas, números sobrepostos ou anotações visuais.

| Arquivo sugerido | Uso |
|---|---|
| `assets/screenshots/estoque/material-para-tecnico/overview.png` | página-resumo do fluxo |
| `assets/screenshots/cadastros/estoque/categorias.png` | cadastro de categoria |
| `assets/screenshots/cadastros/estoque/produtos.png` | cadastro de produto |
| `assets/screenshots/estoque/entrada-manual.png` | modal/wizard de nova movimentação |
| `assets/screenshots/estoque/nota-fiscal-compra.png` | fluxo de entrada por NF |
| `assets/screenshots/estoque/ordens-de-separacao.png` | criação e confirmação da ordem |

## Critérios de pronto

A documentação só pode ser considerada concluída quando:

- cada etapa tiver conteúdo escrito em arquivo próprio ou em subseção claramente separada;
- a página-resumo estiver linkando as páginas filhas;
- os screenshots do demo estiverem anexados;
- o XML de teste estiver validado no fluxo de entrada por nota fiscal;
- as páginas existentes tiverem sido revisadas para não repetir conteúdo nem contradizer o fluxo real.

## Riscos e pendências

- A tela de **Categorias** de estoque pode não estar documentada ainda e talvez precise ser criada do zero.
- A entrada por nota fiscal depende de XML de teste válido.
- A confirmação de entrega pode estar em um botão ou ação diferente do que o fluxo resumido sugere; isso precisa ser confirmado no demo antes da escrita final.
- Se algum passo existir em tela legada e tela nova, a documentação deve escolher a rota operacional real e mencionar a alternativa apenas em observações.

## Próximo passo

Depois deste plano, a execução deve seguir a ordem:

1. explorar o demo;
2. validar os nomes reais dos menus e botões;
3. escrever a página-resumo;
4. expandir ou criar as páginas filhas;
5. revisar os links internos;
6. versionar tudo no branch `dev`.
