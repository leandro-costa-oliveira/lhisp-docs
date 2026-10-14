---
title: Clientes por Plano
published: true
editor: markdown
description: Conte serviços por plano usando ativação, situação atual, filial e inclusão de valores gratuitos.
---

# Clientes por Plano

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.

A tela `/relatorios/clientes_por_plano` apresenta gráfico e tabela agrupados por **plano**. Embora os rótulos falem em clientes e assinantes, a consulta usa a quantidade de **serviços contratados**, sem deduplicar pessoa ou contrato.

## Filtros

| Campo | Critério |
|---|---|
| **Filial** | Filial do contrato associado, dentro das filiais permitidas ao usuário. |
| **Data de Ativação** | Campo de ativação do serviço; começa no primeiro dia do mês de um ano atrás e termina no fim do mês atual. |
| **Listar VIP?** | Inclui valores gratuitos; desmarcado exige valor maior que zero. |
| **Filtros > Situação do Serviço** | Ativo e Bloqueado começam selecionados. Pode incluir outras situações. |

Os filtros integram a consulta ao serem alterados. Desmarcar todas as situações **remove a restrição de situação**, em vez de produzir uma lista vazia. A consulta exige associação a contrato e segue as restrições de filial da API. Abra com sessão autenticada e acesso ao relatório/Contratos.

## Resultado

Cada plano ocupa uma linha com ID/nome, **valor atual do catálogo do plano** e quantidade de serviços encontrados. O total soma serviços, não pessoas. O gráfico mostra a mesma quantidade por plano.

O valor da tabela não é a soma dos serviços nem a receita daquele plano. Serviços com preço individual, descontos ou quantidades diferentes continuam somando uma unidade na contagem.

Use **Imprimir** para a saída do navegador. Não há botão de CSV nessa tela. Para nomes e contatos dos assinantes, consulte [Lista de Clientes por Plano](/relatorios/lista-de-clientes-por-plano) ou [Relatório de Clientes](/relatorios/relatorio-de-clientes).

## Período e comparação

O relatório seleciona ativação no intervalo e verifica a **situação atual** do serviço. Não conta todas as assinaturas que estiveram ativas em algum momento do período e não reconstrói a base no último dia escolhido.

As datas são enviadas sem expansão explícita para 23:59:59 do último dia. Ao conferir ativações próximas do limite final, valide o horário no histórico ou amplie o limite para o dia seguinte. Para analisar eventos de ativação e cancelamento, use [Ativações / Cancelamentos](/relatorios/ativacoes-cancelamentos).
