---
title: Clientes Cancelados
published: true
editor: markdown
description: Consulte contratos com serviço cancelado, período de cancelamento, motivo e situação de negativação.
---

# Clientes Cancelados

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.

Este relatório permanece no formulário legado `relatorios/clientes_cancelados`, acessível pela camada de telas legadas do painel. A seleção parte de **serviços atualmente cancelados**, agrupados por contrato. Não é uma lista de todos os eventos históricos de cancelamento nem exige que todos os serviços do contrato estejam cancelados.

## Consultar

1. Abra **Relatórios > Clientes Cancelados**, com sessão autenticada e acesso ao formulário.
2. Selecione filial e, se necessário, plano.
3. Informe o período do **cancelamento do serviço**, motivo e recorte de negativação: **Negativados**, **Não Negativados** ou **Todos**.
4. Marque **Somente com acesso** quando quiser restringir aos serviços selecionados que ainda possuem acesso cadastrado.
5. Clique em **Exibir**; **Imprimir** imprime a listagem resultante.

Não há exportação CSV própria nessa tela. Filial e registros disponíveis dependem do acesso do usuário no painel.

## Critérios e datas

O período é aplicado ao campo de cancelamento do serviço com comparações estritas: data/hora **maior que** o início e **menor que** o fim informado. O formulário converte as datas sem acrescentar o fim do dia; eventos no dia final após meia-noite podem ficar fora. Para conferir um mês completo, inclua o primeiro dia do mês seguinte como limite final e confira os casos nas bordas.

O motivo é comparado ao último histórico de situação **Cancelado** do serviço escolhido. O filtro **Negativados** exige registro SPC ainda sem data de encerramento; **Não Negativados** exclui pessoas com esse registro aberto. Em **Todos**, o vínculo com SPC não filtra registros encerrados, portanto uma data SPC exibida não comprova negativação atual.

## Resultado e limite de cobertura

A grade mostra contrato, filial, cliente, e-mail, CPF/CNPJ, telefones, serviço, valor, cancelamento, ativação, motivo/histórico, data SPC e situação. O total conta linhas de contratos selecionados.

A consulta agrupa por contrato **antes** de aplicar na listagem plano, motivo e existência de acesso. Em contratos com vários serviços cancelados, o serviço devolvido pelo agrupamento não possui ordenação definida. O contrato pode ser omitido por esses filtros mesmo que outro serviço seu os satisfaça. Confira todos os serviços do contrato antes de concluir que ele não teve cancelamento compatível.

Para analisar cada movimento de serviço e separar ativações, reativações e cancelamentos, use [Ativações / Cancelamentos](/relatorios/ativacoes-cancelamentos). Para contratos distintos com cobertura histórica explícita, consulte [Radar de Clientes](/dashboards/radar-de-clientes).
