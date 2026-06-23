---
title: Caixas
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

- A tela verificada no demo mostra a rota `/cadastros/financeiro/caixas`.
- Na listagem do demo, foram observados os registros **CAIXA DA LOJA**, **CAIXA BANCO DO BRASIL**, **Cartoes / cheque** e **Especie**.
- A tela é objetiva e funciona como uma listagem administrativa simples.

## Dúvidas para revisão

- Existe alguma regra específica de uso para cada caixa cadastrado?
- O fluxo de cadastro possui campos adicionais que não aparecem na listagem?
- O sistema exige algum vínculo com contas ou formas de pagamento ao criar um novo caixa?

## Screenshots sugeridos

- `docs/assets/screenshots/cadastros/financeiro/caixas.png` — captura limpa da listagem de caixas no demo.
