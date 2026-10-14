---
title: Relatório de Consultas Spc Brasil
published: true
editor: markdown
description: Histórico das consultas registradas ao SPC Brasil, por data, usuário e cliente.
---

# Relatório de Consultas Spc Brasil

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.

A tela `/relatorios/consultas_spcbrasil` lista consultas ao SPC Brasil **já registradas no LHISP**. Abrir o relatório não realiza uma nova consulta de crédito, não negativa clientes e não atualiza o resultado externo.

## Consultar e exportar

1. Informe **Data Inicial** e **Data Final**; o padrão é o mês corrente.
2. Aguarde o carregamento após alterar as datas.
3. Confira **Usuário**, **Data/Hora** e **Cliente**.
4. Use **Imprimir** ou **Baixar Planilha**.

A consulta filtra a data de registro e inclui o usuário e a pessoa vinculados. Não existe filtro de resultado da análise, tipo de consulta ou negativação nessa tela. O rodapé conta os registros retornados, não pessoas únicas; várias consultas para o mesmo cliente continuam sendo várias linhas.

O CSV usa o nome-base `RelatorioConsultasSpcBrasil` e contém as mesmas três colunas. Data/hora é formatada pelo navegador. Vínculos ausentes podem deixar os nomes vazios na tela; o CSV utiliza os textos substitutos **Usuario** e **Cliente**.

## Escopo e limitações

A consulta respeita a empresa do usuário. Este relatório é somente para consulta; não oferece criação ou edição dos registros.

A data do histórico é a gravação da consulta, não data de vencimento ou inclusão no SPC. O arquivo exportado não contém o parecer completo nem certifica a situação atual da pessoa no serviço externo. Para clientes negativados, use o relatório específico; não substitua essa verificação pela presença de uma consulta.

Se faltarem registros, confira o período e a empresa antes de repetir uma consulta externa. A repetição externa é uma ação independente e pode ter custo conforme a integração.
