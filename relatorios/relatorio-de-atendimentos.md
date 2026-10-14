---
title: Relatório de Atendimentos
published: true
editor: markdown
description: Atendimentos abertos no período, com motivo, situação e quantidade de OS associadas.
---

# Relatório de Atendimentos

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.

A tela `/relatorios/agendatecnica/atendimentos` lista atendimentos pela **data de abertura**, com opção de filtrar o motivo. Não filtra por data de fechamento nem pelo agendamento das ordens de serviço.

## Consultar

1. Informe **Data do Atendimento**, com início e fim; o padrão é o mês corrente.
2. Selecione **Motivo do Atendimento**, ou mantenha sem seleção.
3. Use **Atualizar** para refazer a consulta.
4. Confira a tabela e use **Imprimir**.

| Coluna | Origem |
|---|---|
| Contrato / Cliente | Contrato e pessoa vinculados ao atendimento. |
| Atendimento | Identificador do atendimento. |
| Aberto Por | Usuário que abriu o registro. |
| Canal / Motivo | Canal registrado e motivo associado. |
| Data | Data de abertura, apresentada sem horário. |
| Situação | Situação atual do atendimento. |
| Qtd OSs | Contagem das OS cujo `AtendimentoId` corresponde à linha. |

A consulta de OS é separada e agrupa pelo atendimento. Ela não repete o filtro de período nem exige OS concluída: uma OS criada fora do período pode ser contada se pertencer a um atendimento selecionado. O rodapé conta atendimentos, não soma de OS.

O relatório inclui as situações retornadas pela consulta, sem seletor de situação na tela. Um atendimento aberto no mês e concluído depois permanece no período original, com sua situação atual. Registros sem contrato ou motivo podem apresentar colunas vazias.

## Escopo e conferência

A área usa o BI de Agenda técnica: empresa e restrições de filiais do usuário influenciam o resultado, incluindo filiais atendidas pelo técnico quando aplicável. A ausência de uma linha não deve ser interpretada como exclusão do atendimento antes de conferir esse escopo.

Os limites de data são enviados pela interface à consulta. Para conferência por horário no último dia, compare com o registro de abertura, pois a tela imprime somente a data e não oferece seleção de hora. Não há exportação CSV própria nesta página. Para distribuição agregada, consulte [Atendimentos por Canal](/relatorios/relatorio-de-atendimentos-por-canal).

## Fontes conferidas

Comportamento confrontado com os checkouts locais em 14/10/2026. Não comprova a versão instalada nem execução com dados reais.

- `lhisp-frontend/src/paginas/relatorios/agendatecnica/atendimentos/RelatorioAtendimentos.tsx:18`
- `lhisp-backend/src/lhisp-business/src/business/agendatecnica/AtendimentoBI.js:6`
- `lhisp-backend/src/lhisp-business/src/business/agendatecnica/OrdemServicoBI.js:5`
