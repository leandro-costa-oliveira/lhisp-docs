---
title: Apagar OTT em Massa
published: true
editor: markdown
description: ''
---

# Apagar OTT em Massa

## Objetivo

Executar a exclusão em massa de contratos OTT a partir de um arquivo importado.

## Quando usar

Use esta tela quando for necessário importar uma lista e remover contratos OTT em lote.

## Pré-requisitos

- Acesso ao menu **Sistema > Ações em Massa > Apagar Ott em Massa**.
- Arquivo preparado com os registros a processar.
- Permissão para executar exclusões em massa.

## Passo a passo

1. Acesse **Sistema > Ações em Massa > Apagar Ott em Massa**.
2. Clique em **Choose File** e selecione o arquivo desejado.
3. Revise a lista carregada na tabela.
4. Clique em **Apagar OTTs** para executar a ação em massa.
5. Acompanhe o resultado na tabela de registros processados.

## Campos importantes

| Campo / ação | Descrição |
|---|---|
| **Choose File** | Seleciona o arquivo com os contratos OTT. |
| **Apagar OTTs** | Executa a exclusão em massa. |
| **Email / Usuário** | Identificação do registro listado. |
| **Id** | Identificador do contrato. |
| **Contrato** | Número ou referência do contrato OTT. |
| **Cliente** | Cliente associado ao contrato. |
| **Status** | Situação do processamento. |

## Resultado esperado

- O arquivo é importado e os contratos OTT ficam listados para processamento.
- A ação em massa remove os contratos selecionados conforme o arquivo.

## Problemas comuns

| Problema | Como tratar |
|---|---|
| Botão desabilitado | Verifique se um arquivo foi selecionado. |
| Nenhum registro listado | Confirme o conteúdo do arquivo importado. |
| Falha ao apagar | Revisar permissões e formato do arquivo. |

## Observações

- A tela do demo mostra a área de upload e a tabela de registros vazia quando não há arquivo processado.
- O título da interface aparece como **Apagar Contratos OTT em Massa**.
- A captura desta página foi feita no ambiente de demonstração.

## Dúvidas para revisão

- O arquivo aceita quais formatos e colunas exatamente?
- A exclusão é revertível após o processamento?

## Screenshots sugeridos

- `assets/screenshots/sistema/apagar-ott-em-massa.png` — captura limpa da tela Apagar OTT em Massa no demo.

![Apagar OTT em Massa no demo](/assets/screenshots/sistema/apagar-ott-em-massa.png)
