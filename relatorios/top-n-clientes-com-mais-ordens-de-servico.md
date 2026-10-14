---
title: Top N Clientes com mais Ordens de Serviço
published: true
editor: markdown
description: Ranking de contratos por OS agendadas no período e limites dos filtros.
---

# Top N Clientes com mais Ordens de Serviço

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.

A tela `/relatorios/agendatecnica/top_n_ordens_de_servico` ordena contratos pela quantidade de OS no período de **agendamento**. Um cliente com contratos diferentes pode ter linhas separadas.

## Configurar

1. Defina o período; o padrão é o mês corrente.
2. Informe **Máximo de Registros**; o padrão é dez.
3. Abra **Filtros**, escolha a situação e os tipos de OS.
4. Confira filial, contrato, cliente e quantidade na tabela.
5. Use **Imprimir** quando a seleção estiver validada.

A situação inicial é **ABERTA**. O backend agrupa por contrato do serviço (`ServicoContratado.CLIENTE_ID`) e ordena `count(OrdemServico.id)` decrescente. Exige serviço e contrato vinculados. O limite aceito pelo backend volta para dez se estiver ausente ou for maior que cem; não espere mais de cem linhas apenas aumentando o campo.

## Limitações verificadas

A interface exibe **Com Sucesso** e **Sem Sucesso**, mas envia sempre `situacao_conclusao_in: []`. O backend combina essa lista vazia com `situacao_conclusao: null`; assim, os controles não expressam a seleção mostrada. Resultados de OS concluídas precisam ser confrontados com a Agenda técnica e os dados de conclusão antes de uso gerencial.

O botão **Atualizar** não garante nova consulta com os mesmos filtros. Para consultar uma seleção diferente, altere o filtro; para atualizar a seleção idêntica, reabra a página e confira o resultado.

O filtro de situação usa conversão numérica; a opção vazia de **Todos** pode resultar em zero, não em ausência de filtro. Não interprete resultado vazio como prova de que não houve OS sem revisar a situação enviada.

A lista é restrita pelos BIs de OS e contrato, incluindo filiais acessíveis. A contagem não informa visitas efetivamente realizadas nem número de atendimentos: refere-se às OS que satisfazem os filtros implementados.
