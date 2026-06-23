---
title: Monitor de Gráficos
published: true
editor: markdown
description: ''
---

# Monitor de Gráficos

> **⚠️ Rascunho gerado por agente**
>
> Este documento foi produzido a partir da tela observada no ambiente de demonstração do LHISP. A captura usada nesta página foi validada visualmente e mostra o conteúdo legível do monitor.

## Objetivo

Registrar a tela de **Monitor de Gráficos** do módulo **Rede/ Infra**, que exibe um filtro por descrição e uma listagem de servidores associados a um conjunto de gráficos/monitoramento.

## Quando usar

Use este fluxo para:

- consultar registros de monitoramento por descrição;
- revisar quais servidores estão vinculados ao monitor;
- ajustar a quantidade de itens exibidos por linha;
- navegar entre os itens do cadastro/monitor.

## Pré-requisitos

- Acesso ao módulo **Rede/ Infra**.
- Permissão para consultar os dados do monitor.
- Tela carregada no demo com os dados do monitor disponíveis.

## Passo a passo

1. Acesse **Rede/ Infra > Monitor de Gráficos**.
2. Use o campo **Descrição** para filtrar os registros desejados.
3. Ajuste **Exibir por linha** conforme necessário.
4. Consulte a grade inferior com os dados retornados.
5. Use os botões de ação do topo conforme a necessidade do fluxo.

## Campos importantes

| Campo / Elemento | Observação |
|---|---|
| **Descrição** | Campo de filtro textual visível no topo da tela. |
| **Exibir por linha** | Seletor com valor numérico para controlar a listagem. |
| **Link lateral** | Botão à direita do formulário principal, com ícone de vínculo. |
| **Tabela de resultados** | Exibe colunas de identificação e associação com servidores. |

### Colunas visíveis na lista

| Coluna | Observação |
|---|---|
| **#** | Coluna de ordenação/linha. |
| **Id** | Identificador do registro. |
| **Servidor** | Nome do servidor associado. |
| **Descrição** | Descrição exibida na listagem. |

## Resultado esperado

- O monitor exibe os registros filtrados pela descrição informada.
- A listagem apresenta pelo menos um servidor associado ao monitor.
- Os controles de navegação e manutenção permanecem visíveis no topo.

## Problemas comuns

| Problema | Como tratar |
|---|---|
| Nenhum registro aparece | Verifique o texto informado em **Descrição** e confirme se há dados no ambiente. |
| O botão lateral não responde | Recarregue a tela e confirme se o carregamento do monitor terminou. |
| A lista parece incompleta | Ajuste **Exibir por linha** e confirme a paginação/quantidade de itens. |

## Observações

- A tela mostra o título **Monitoramento de Gráficos** no cabeçalho do painel.
- A captura validada estava limpa, sem marcações ou anotações visuais.
- A grade exibida no demo contém um exemplo com **Id 658**, **Servidor ROT-TESTE** e **Descrição CORE-CARBON**.
- A rota exata do demo não foi revalidada nesta continuação; a documentação se baseia na tela observada e validada visualmente.

## Dúvidas para revisão

- A rota do menu é exatamente **Monitor de Gráficos** ou o demo usa apenas o título **Monitoramento de Gráficos**?
- O botão lateral com ícone de corrente faz o quê exatamente neste fluxo?
- A tabela principal é apenas consulta ou também permite manutenção dos registros?

## Screenshots sugeridos

- Tela principal do **Monitor de Gráficos** no demo: `assets/screenshots/rede-infra/monitoramento-de-graficos.png`

![Monitor de Gráficos no demo](/assets/screenshots/rede-infra/monitoramento-de-graficos.png)
