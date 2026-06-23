---
title: Impressão de Carnês
published: true
editor: markdown
description: ''
---

# Impressão de Carnês

> **⚠️ Rascunho gerado por agente**
>
> Esta página foi documentada a partir da tela equivalente no ambiente de demonstração do LHISP. A captura utilizada veio do demo e foi mantida sem marcações visuais.

## Objetivo

Parametrizar a impressão de carnês por filial, conta bancária, rede e critérios de faturamento.

## Quando usar

Use esta tela quando precisar:

- filtrar carnês por filial ou conta bancária;
- selecionar a rede, o plano ou a localidade;
- definir o período de faturamento;
- controlar o status de impressão;
- confirmar, imprimir ou exibir os carnês filtrados.

## Pré-requisitos

- Estar autenticado no LHISP.
- Ter permissão para acessar o fluxo de impressão de carnês.
- Ter os cadastros de filial, conta bancária, plano e endereços minimamente configurados.

## Passo a passo

1. Acesse o fluxo de **Impressão de Carnês**.
2. Escolha a **Filial** desejada.
3. Selecione a **Conta Bancária** e o **Setor de Rede**, quando aplicável.
4. Informe a **Rede**, o **Vencimento** e o status de **Imprimir**.
5. Use os campos de **UF**, **Cidade**, **Bairro** e **Logradouro** para refinar a seleção.
6. Defina o **Plano** e o período de **Faturamento**.
7. Ajuste a quantidade de **Contratos** e a **Página**, se necessário.
8. Clique em **Confirmar**, **Imprimir** ou **Exibir** conforme a ação desejada.

## Campos importantes

| Campo / ação | Descrição |
|---|---|
| **Filial** | Filial usada como filtro principal. |
| **Conta Bancária** | Conta bancária vinculada à impressão. |
| **Setor de Rede** | Setor operacional associado à seleção. |
| **Rede** | Rede alvo da impressão. |
| **Vencimento** | Dia de vencimento considerado. |
| **Imprimir** | Filtro para não impressos, impressos ou todos. |
| **UF** | Filtro de unidade federativa. |
| **Cidade** | Filtro de cidade. |
| **Bairro** | Filtro de bairro. |
| **Logradouro** | Filtro de endereço/logradouro. |
| **Plano** | Plano associado aos contratos filtrados. |
| **Faturamento** | Intervalo de datas de faturamento. |
| **Contratos** | Quantidade de contratos por página ou seleção. |
| **Página** | Número da página em uso. |
| **Confirmar** | Confirma os filtros informados. |
| **Imprimir** | Gera a impressão dos carnês. |
| **Exibir** | Mostra a listagem/resultado antes de imprimir. |

## Resultado esperado

- O operador consegue montar um conjunto de filtros para a impressão.
- O sistema prepara os carnês de acordo com a filial, conta e período escolhidos.
- A tela responde com confirmação, pré-visualização ou execução da impressão.

## Problemas comuns

| Problema | Como tratar |
|---|---|
| A lista de contas bancárias não carrega | Verifique se há contas cadastradas e se a filial foi escolhida corretamente. |
| A filtragem por endereço não retorna dados | Confirme se UF, cidade, bairro e logradouro existem no cadastro. |
| Os botões não executam ação | Revise o perfil de acesso e a configuração dos dados financeiros. |
| O período de faturamento está incoerente | Ajuste as datas antes de confirmar a operação. |

## Observações

- O demo abre a tela dentro de um iframe legado.
- A captura mostra a interface com os filtros já exibidos e sem resultados carregados na área inferior.
- Os botões de ação visíveis são **Confirmar**, **Imprimir** e **Exibir**.
- A tela já inicia com valores de referência de faturamento preenchidos no demo.

## Dúvidas para revisão

- **Imprimir** e **Exibir** executam ações distintas ou uma abre apenas a pré-visualização?
- O campo **Contratos** controla quantidade por página, intervalo ou seleção fixa?
- Existe um fluxo separado para reimpressão de carnês já emitidos?
- A seleção de rede sempre depende de **Setor de Rede** ou pode ser feita diretamente?

## Screenshots sugeridos

- Tela **Impressão de Carnês** no demo: `assets/screenshots/financeiro/impressao-de-carnes.png`

![Impressão de Carnês no demo](/assets/screenshots/financeiro/impressao-de-carnes.png)
