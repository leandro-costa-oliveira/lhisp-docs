---
title: Relatório de Ordens de Serviço
published: true
editor: markdown
description: OS por data de agendamento, filtros e limites da seleção de conclusão.
---

# Relatório de Ordens de Serviço

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.

A tela `/relatorios/agendatecnica/ordens_de_servico` consulta OS pela **data de agendamento**. Apresenta lista detalhada, quantidade por usuário de abertura e gráfico mensal. Não é apuração por data de execução.

## Gerar

1. Informe o período; o padrão é o mês corrente.
2. Abra **Filtros** para selecionar situação, tipos de OS e usuário de abertura.
3. Confira **Situação da Conclusão** e os limites descritos abaixo.
4. Clique em **Atualizar** e depois **Imprimir**.

O padrão de situação é **ABERTA**, com os tipos marcados. A consulta exige vínculo da OS a serviço contratado e contrato; registros sem esses vínculos não entram na lista detalhada. O backend de OS aplica empresa e filiais do usuário.

A tabela contém filial, contrato, cliente, técnico, tipo e data de agendamento. A tabela **Aberta Por** agrupa pelo usuário que cadastrou a OS, não pelo técnico executor. O gráfico soma as OS retornadas por mês de agendamento, preenchendo os meses do intervalo.

## Limite das opções de conclusão

No código atual, o filtro combina **conclusão com sucesso**, quando marcado, com **conclusão nula**. A caixa **Sem Sucesso** aparece, mas seu estado não é enviado à consulta. Portanto, marcar essa caixa não garante inclusão de OS concluídas sem sucesso. Quando **Com Sucesso** é desmarcado, a consulta ainda inclui conclusão nula.

Para situação **Todos**, a implementação usa o sentinela negativo; o backend só recebe situação numérica quando o valor é não negativo. Confira os filtros aplicados ao comparar com a Agenda técnica.

O gráfico define um limite visual de eixo de 12; para volumes maiores, confira os números da tabela, pois a escala pode limitar a visualização. Não há exportação CSV própria. Para comissão por data de execução e deduplicação, consulte [Comissão dos Técnicos](/relatorios/comissao-de-tecnicos-por-ordem-de-servico).

## Fontes conferidas

Comportamento confrontado com os checkouts locais em 14/10/2026. Não comprova a versão instalada nem execução com dados reais.

- `lhisp-frontend/src/paginas/relatorios/agendatecnica/ordenservico/RelatorioOrdensServico.tsx:45`
- `lhisp-backend/src/lhisp-business/src/business/agendatecnica/OrdemServicoBI.js:5`
- `lhisp-backend/src/lhisp-business/src/models/agendatecnica/OrdemServico.js:21`
