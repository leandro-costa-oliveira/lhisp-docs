---
title: Comissão de Técnicos por Ordem de Serviço
published: true
editor: markdown
description: Simulação de comissão por tipo de OS concluída, com deduplicação por contrato.
---

# Comissão de Técnicos por Ordem de Serviço

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.

A tela `/relatorios/agendatecnica/comissao_tecnico_por_os` calcula uma estimativa de comissão usando ordens **CONCLUÍDAS**, um técnico e valores informados pelo operador. Consultar ou editar esses valores não gera pagamento, conta a pagar nem lançamento em folha.

## Apurar

1. Selecione o período; o padrão é o mês corrente.
2. Escolha o **Técnico**. A consulta só é habilitada depois dessa escolha.
3. Clique em **Atualizar** e confira as OS retornadas.
4. Informe o **Valor** em reais por tipo na tabela de resumo.
5. Revise quantidades e total antes de **Imprimir**.

O filtro usa **data de execução**, não data de abertura ou agendamento. A consulta pede situação concluída, sem filtro adicional explícito de conclusão com sucesso.

## Como a comissão é calculada

A primeira tabela lista contrato, cliente, tipo e data de execução. Todas as OS retornadas aparecem, mas o resumo **conta somente a primeira ocorrência de cada contrato**, mesmo que existam várias OS ou tipos para o mesmo contrato. Ocorrências posteriores recebem destaque amarelo e não incrementam a quantidade comissionada.

Por tipo, `total = quantidade contabilizada × valor informado`; o total geral soma os tipos. A contagem de OS no rodapé da lista pode ser maior que a soma das quantidades comissionadas. A primeira ocorrência também define em qual tipo aquele contrato será contado; confira duplicidades entre tipos, pois a consulta não define ordenação específica para essa decisão.

Os valores por tipo são guardados no **armazenamento local do navegador**. Eles não constituem uma tabela central de comissões; outro navegador/perfil pode apresentar valores diferentes. Registre os parâmetros usados junto da impressão.

O backend de OS restringe empresa e filiais do usuário. Se faltarem ordens, confira técnico, data de execução, situação concluída, vínculo ao serviço/contrato e escopo de filial. Para quantidade bruta de OS, use [Relatório de Ordens de Serviço](/relatorios/relatorio-de-ordens-de-servico).
