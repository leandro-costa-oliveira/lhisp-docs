---
title: Clientes Bloqueados
published: true
editor: markdown
description: ''
---

# Clientes Bloqueados

## Objetivo

Listar serviços contratados cuja situação é **BLOQUEADO**, com dados do contrato, plano, vencimento, valor e data do bloqueio.

## Pré-requisitos

- Estar autenticado no LHISP.
- Ter acesso a **Relatórios > Clientes Bloqueados**.

## Filtros

| Campo | Comportamento |
|---|---|
| **Filial** | Restringe os contratos à filial escolhida. Vazio inclui todas as filiais disponíveis. |
| **Plano** | Restringe pelo plano selecionado. A lupa abre a pesquisa de planos e o botão de limpeza remove a seleção. |
| **Vencimento** | Restringe pelo dia de vencimento. A lista contém somente os dias configurados em `VENCIMENTOS` para a empresa. |

## Passo a passo

1. Acesse **Relatórios > Clientes Bloqueados**.
2. Se necessário, selecione filial, plano e/ou vencimento.
3. Clique em **Exibir**.
4. Use **Imprimir** para imprimir o conteúdo da listagem.

## Resultado

A grade é ordenada pela última atualização, da mais recente para a mais antiga, e contém:

- contrato;
- filial;
- cliente;
- endereço;
- telefones;
- serviço;
- dia de vencimento;
- valor;
- data de bloqueio e quantidade de dias decorridos.

O rodapé mostra a quantidade de contratos. Embora o código acumule o valor dos serviços, esse total monetário não é exibido.

## Observações

- A tela usa os formulários legados `relatorios/clientes_bloqueados`, `rel_clientes_bloqueados.php` e `rel_clientes_bloqueados_listagem.php`.
- Não há ação de download de arquivo neste relatório; as ações implementadas são **Exibir** e **Imprimir**.
- A data de bloqueio apresentada é o campo de última atualização do serviço contratado (`updated_at`).

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.
