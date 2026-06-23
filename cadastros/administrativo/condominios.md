---
title: Condomínios
published: true
editor: markdown
description: ''
---

# Condomínios

> **⚠️ Rascunho gerado por agente**
>
> Esta página foi documentada a partir da tela equivalente no ambiente de demonstração do LHISP. A captura utilizada veio do demo e foi mantida sem marcações visuais.

## Objetivo

Cadastrar e manter condomínios vinculados ao cadastro de endereços, com dados básicos como logradouro, número e nome do condomínio.

## Quando usar

Use esta tela quando precisar:

- cadastrar um novo condomínio;
- editar um condomínio já existente;
- vincular o condomínio a um endereço;
- consultar rapidamente os dados básicos do registro;
- apagar ou navegar entre registros cadastrados.

## Pré-requisitos

- Estar autenticado no LHISP.
- Ter permissão para acessar o menu **Cadastros > Administrativo > Condomínios**.
- Possuir os dados básicos do condomínio e do endereço relacionado.

## Passo a passo

1. Acesse o menu **Cadastros > Administrativo > Condomínios**.
2. Clique em **Novo** para iniciar um cadastro ou use a navegação para localizar um registro já existente.
3. Preencha o **Logradouro** do condomínio.
4. Informe o **Número** do endereço.
5. Complete o campo **Nome** com a identificação do condomínio.
6. Use **Cadastrar Endereço** ou **Procurar Endereço** se precisar vincular ou localizar um endereço relacionado.
7. Clique em **Salvar** para gravar o cadastro.

## Campos importantes

| Campo / ação | Descrição |
|---|---|
| **Anterior / Próximo** | Navega entre os registros cadastrados. |
| **Novo** | Inicia um novo cadastro de condomínio. |
| **Editar** | Abre o registro atual para alteração. |
| **Apagar** | Remove o registro selecionado. |
| **Salvar** | Persiste as alterações. |
| **Cancelar** | Descarta a edição em andamento. |
| **Procurar** | Localiza registros cadastrados. |
| **Logradouro** | Endereço principal do condomínio. |
| **Número** | Número do endereço. |
| **Nome** | Nome do condomínio. |
| **Cadastrar Endereço** | Abre o fluxo de inclusão de endereço relacionado. |
| **Procurar Endereço** | Localiza um endereço já cadastrado. |

## Resultado esperado

- O condomínio fica cadastrado com seus dados básicos.
- O endereço relacionado pode ser consultado ou vinculado diretamente na tela.
- O operador consegue navegar e editar registros com os botões da barra superior.

## Problemas comuns

| Problema | Como tratar |
|---|---|
| O cadastro não salva | Verifique se os campos mínimos foram preenchidos. |
| O endereço não é encontrado | Use **Procurar Endereço** e revise o termo informado. |
| Os botões ficam desabilitados | Confirme se a tela está em modo de edição ou se há permissão suficiente. |
| O registro errado está sendo exibido | Use **Anterior / Próximo** ou **Procurar** para alternar de item. |

## Observações

- O demo exibe **Condomínios** como uma tela de formulário simples, não como uma listagem.
- A área principal mostra os campos **Logradouro**, **Número** e **Nome**.
- A barra superior reúne as ações de navegação, cadastro, edição, exclusão, salvamento e busca.
- A captura usada nesta página veio do ambiente de demonstração.
- A rota observada no demo foi acessada pelo menu de **Cadastros > Administrativo > Condomínios**.

## Dúvidas para revisão

- O condomínio precisa obrigatoriamente estar vinculado a um endereço completo antes de salvar?
- **Cadastrar Endereço** cria um novo endereço no mesmo fluxo ou abre uma tela separada?
- Há campos adicionais que aparecem apenas em registros já salvos?
- O botão **Procurar** pesquisa por nome, logradouro ou ambos?

## Screenshots sugeridos

- Tela **Condomínios** no demo: `assets/screenshots/cadastros/administrativo/condominios.png`

![Condomínios no demo](/assets/screenshots/cadastros/administrativo/condominios.png)
