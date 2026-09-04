---
title: Dashboard Comercial
published: true
editor: markdown
description: Indicadores de serviços vendidos e do andamento atual das respectivas instalações
---

# Dashboard Comercial

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.

O Dashboard Comercial acompanha a conversão dos serviços contratados em instalações concluídas. Sua unidade de contagem é o **serviço contratado**, e não a pessoa ou o contrato: um mesmo cliente com dois serviços adiciona dois cadastros aos indicadores.

O painel conecta dados de [Contratos](/contratos/contrato), [Planos](/cadastros/financeiro/planos), usuários responsáveis pela venda e ordens de serviço de instalação. Ele ajuda a localizar vendas ainda sem OS, medir a fila de instalação e comparar a distribuição por filial, atendente e plano.

## O que o período representa

O período filtra a data em que o **serviço contratado foi criado**. Ele não representa a data de cadastro da pessoa, a assinatura do contrato nem a execução da instalação.

O resultado não é uma fotografia histórica fechada. Para os serviços criados no período escolhido, o LHISP consulta a situação atual das ordens de instalação e os relacionamentos atuais. Assim, o total de instalações concluídas pode crescer quando uma OS antiga for finalizada, mesmo sem novos serviços no intervalo. Serviços hoje cancelados também permanecem na contagem, pois a consulta não filtra a situação do serviço.

## Quando usar

Use o dashboard para analisar cadastros comerciais, identificar serviços sem ordem de instalação, acompanhar instalações pendentes ou concluídas e exportar os registros da consulta.

## Pré-requisitos

- Estar autenticado no LHISP.
- Ter acesso ao menu **Dashboard Comercial**.
- Ter acesso aos dados comerciais e relatórios da empresa.

## Filtros

| Campo | Comportamento |
|---|---|
| **Período** | Intervalo inclusivo da data de cadastro do serviço contratado. Inicia no primeiro e no último dia do mês atual. As duas datas são obrigatórias e a inicial não pode ser posterior à final. |
| **Filial** | Restringe os serviços aos contratos da filial escolhida. Vazio consulta todas as filiais permitidas ao usuário. |
| **Atendente** | Restringe os serviços pelo usuário associado ao cadastro. Vazio consulta todos os atendentes. |
| **Atualizar** | Aplica os filtros preenchidos. Alterar um campo sem clicar neste botão não muda os indicadores. |

## Indicadores

| Indicador | Regra aplicada |
|---|---|
| **Cadastros no período** | Quantidade de serviços contratados criados no intervalo, não a quantidade de pessoas ou contratos novos. |
| **Instalações concluídas** | Serviços cuja primeira ordem de serviço do tipo instalação está concluída. O cartão também apresenta a proporção sobre os cadastros do período. |
| **Aguardando instalação** | Serviços que possuem ordem de instalação, mas cuja primeira ordem ainda não está concluída. |
| **Cadastros sem OS** | Cadastros menos instalações concluídas e instalações em espera, limitado ao mínimo de zero. Representa serviços sem ordem de instalação associada. |
| **Cadastros por plano e atendente** | Distribuição dos serviços por plano, separada por atendente, com destaque para o plano de maior total. |
| **Cadastros por filial** | Distribuição dos serviços pela filial do contrato. |
| **Cadastros por atendente** | Quantidade de serviços vinculados a cada atendente, com destaque para o maior valor. |
| **Vendas instaladas por atendente** | Instalações concluídas agrupadas pelo atendente associado ao serviço. |

Quando plano, filial ou atendente não está associado ao registro, o agrupamento usa respectivamente **SEM PLANO**, **SEM FILIAL** ou **SEM VENDEDOR**.

Se um serviço tiver mais de uma OS do tipo instalação, o backend classifica o serviço pela primeira ordem devolvida pela consulta. Como não há ordenação explícita nesse relacionamento, divergências nesse cenário devem ser verificadas diretamente no serviço e em suas ordens.

## Passo a passo

1. Acesse **Dashboard Comercial**.
2. Informe o período desejado.
3. Se necessário, selecione uma filial e/ou um atendente.
4. Clique em **Atualizar**.
5. Consulte os cartões e gráficos.
6. Para obter os registros da consulta, clique em **Baixar cadastros (.csv)**.

## Exportação CSV

O arquivo usa os mesmos filtros já aplicados ao painel e contém:

- ID do serviço;
- filial;
- contrato;
- cliente;
- plano;
- atendente;
- data do cadastro;
- situação do serviço;
- situação da instalação (**SEM OS**, **INSTALADA** ou **AGUARDANDO INSTALAÇÃO**);
- valor do serviço.

O botão de exportação fica indisponível enquanto há consulta/exportação em andamento ou quando o total de cadastros é zero.

## Interpretação e conferência

- A consulta considera a data de criação do **serviço contratado**.
- **Aguardando instalação** significa que existe uma OS de instalação não concluída; não informa se ela já foi agendada ou está em execução.
- **Cadastros sem OS** sinaliza que a etapa técnica ainda não foi vinculada ao serviço e merece conferência operacional.
- Compare o total por atendente com o cadastro do serviço, não apenas com o vendedor registrado no contrato: o agrupamento usa o usuário associado ao serviço contratado.
- O CSV é a melhor forma de identificar os registros que compõem um indicador e investigar diferenças.
- Em caso de falha, a tela exibe **Não foi possível carregar a dashboard** com a mensagem devolvida pela API.

## Captura de tela

![Dashboard Comercial](/assets/screenshots/dashboards/dashboard-comercial.png)
