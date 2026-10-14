---
title: Retenção de Clientes
published: true
editor: markdown
description: Interprete os indicadores calculados a partir do histórico de situação dos contratos e seus limites de período.
---

# Retenção de Clientes

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.

A tela `/relatorios/retencao` usa o **histórico de situação do contrato**, diferente do relatório de movimentos dos serviços. Os registros são consultados no período, do mais recente para o mais antigo, e agrupados pelo identificador do contrato.

## Operação

1. Abra o relatório com sessão e acesso ao menu/Contratos.
2. Selecione **Filial** e **Período**; o padrão é o ano atual.
3. Use **Atualizar** para reler o servidor.
4. Marque **Analítico** para mostrar contratos e nomes nas faixas de cancelamento.
5. Use **Imprimir** para a saída do navegador.

A API limita os históricos aos contratos/filiais acessíveis ao usuário. Não há CSV ou ação de retenção/campanha na tela.

## Como a contagem é formada

O histórico mais recente encontrado **dentro da janela** define o primeiro grupo do contrato:

- se for **Ativo**, entra nas ativações que permaneceram;
- se for **Cancelado**, só entra nos cancelamentos contados quando também houver um evento **Ativo anterior dentro da mesma janela**;
- se for Pendente, Suspenso ou Desativado, fica no grupo intermediário “outros”, que não integra o denominador da taxa.

**Total de Ativações no Período** é a soma dos contratos classificados como ativos com os cancelados que possuem a ativação anterior exigida. **Taxa de Retenção** é `(total − cancelados) / total × 100`; quando não há base, mostra zero.

Isso não representa todos os cancelamentos da empresa: um contrato ativado antes do período e cancelado nele fica fora dos cancelamentos contados se a ativação anterior não estiver na janela. Tampouco utiliza a situação atual do cadastro quando há mudanças posteriores ao período.

## Tempo até cancelamento

As faixas usam a diferença entre ativação e cancelamento dividida por **30 dias**, arredondada para cima. São faixas individuais, apesar de os rótulos dizerem “com até N meses”; não são totais acumulados nem meses do calendário.

Se houver várias ativações anteriores para um contrato cancelado, a varredura pode terminar usando a mais antiga da janela. As faixas, portanto, não medem necessariamente a última permanência depois de uma reativação. Eventos no mesmo dia e lacunas entre faixas também exigem conferência do histórico antes de interpretar os rótulos.

As datas enviadas não expandem explicitamente o último dia para 23:59:59. Mantenha o mesmo intervalo ao comparar execuções e confira os horários dos eventos próximos ao limite final.

Para um inventário de movimentos por serviço, use [Ativações / Cancelamentos](/relatorios/ativacoes-cancelamentos). Para contratos distintos com cancelamento efetivo e validação de cobertura, use [Radar de Clientes](/dashboards/radar-de-clientes).
