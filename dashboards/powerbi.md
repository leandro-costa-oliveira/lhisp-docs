---
title: PowerBI — disponibilidade
published: true
editor: markdown
description: Estado das rotas e componentes do painel de cancelamentos PowerBI no frontend atual.
---

# PowerBI — disponibilidade

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.

O frontend possui a rota pai `/dashboard/powerbi/*`, mas seu roteador interno não registra telas ativas. A rota **Cancelamentos** e a importação do componente estão comentadas. Abrir esse endereço não disponibiliza atualmente um painel operacional de cancelamentos por essa implementação.

## Componentes existentes

Há um componente de **Relatório de Cancelamentos Geral** com campos previstos para mês, ano e filial, gráficos por dia e filial e cartões de cancelamentos, perda de receita e ticket médio.

A consulta de dados e o processamento dos resultados também estão comentados nesse componente. Os cartões usam estados iniciais vazios/zerados. Esses zeros não podem ser interpretados como ausência de cancelamentos reais.

Não foram encontrados carregamento de relatório externo do Microsoft Power BI, configuração de incorporação, exportação ou autenticação nesse conjunto de componentes. Isso delimita esta implementação local; não determina se a empresa mantém relatórios externos por outros canais.

## Alternativas disponíveis

- [Ativações / Cancelamentos](/relatorios/ativacoes-cancelamentos): eventos de situação dos serviços, filtros e impressão.
- [Radar de Clientes](/dashboards/radar-de-clientes): contratos distintos com cancelamento efetivo e cobertura explícita.
- [Clientes Cancelados](/relatorios/clientes-cancelados): carteira atualmente cancelada no relatório legado.

A reativação do componente exige trabalho de implementação e validação; não basta liberar o menu para obter dados reais.
