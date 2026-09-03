---
title: Tempo Médio de Execução de Ordens de Serviço
published: true
editor: markdown
description: ''
---

# Tempo Médio de Execução de Ordens de Serviço

## Disponibilidade atual

O frontend contém o componente `DuracaoRelatorioOrdensServico.jsx`, mas ele não está importado e sua rota `/relatorios/agendatecnica/duracao_ordens_de_servico` está comentada. Portanto, esta tela não está acessível pelo roteador React atual.

O componente também depende de referências sem importação local (`IoContext`, `DateTime` e imports absolutos antigos), o que impede tratá-lo como uma funcionalidade pronta apenas reativando a rota.

## Comportamento presente no componente inativo

O código calcula a diferença, em minutos, entre `hora_execucao_ini` e `hora_execucao_end` das ordens de serviço que possuem os dois horários. Os resultados são agrupados:

- no total e por tipo de ordem de serviço;
- por técnico e tipo;
- por mês/ano e tipo.

Os filtros previstos são período de execução, situação da OS, situação da conclusão (**Com Sucesso** e **Sem Sucesso**) e tipos de OS. O componente prevê atualização, impressão, gráfico de média e tabelas detalhadas.

## Limite da documentação

Como a rota está desativada e o componente não está conectado à API HTTP atual, não existe fluxo operacional disponível para documentar. A descrição acima registra somente o código inativo encontrado, não uma tela utilizável.
