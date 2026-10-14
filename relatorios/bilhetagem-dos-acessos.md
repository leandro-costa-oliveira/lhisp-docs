---
title: Bilhetagem dos Acessos
published: true
editor: markdown
description: Consulta de sessões por acesso e limite identificado no formulário agregado legado.
---

# Bilhetagem dos Acessos

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.

Bilhetagem registra sessões de acesso, com início/fim, NAS, IP, MAC e contadores de upload/download. É histórico de conexão; não equivale à medição instantânea de velocidade nem à cobrança financeira por consumo.

## Consultar as sessões de um acesso

No contrato, abra a ação de **Bilhetagem** do acesso correspondente. O diálogo legado consulta o histórico daquele ID e apresenta páginas de sessões com:

- NAS, MAC e IP;
- data/hora da conexão e desconexão;
- upload e download formatados em bytes;
- motivo de desconexão.

Selecione a página e confira as datas. Ausência de saída pode representar sessão ainda aberta ou accounting incompleto; compare com o equipamento antes de concluir que o cliente está conectado. O diálogo consulta o histórico registrado, sem iniciar coleta retroativa.

## Estado do relatório agregado legado

A tela legada **Relatórios → Bilhetagem dos Acessos** oferece **Servidor**, **Período**, **Exibir** e **Imprimir**, mas a consulta não aplica corretamente o servidor e o período informados. A saída contém contrato, cliente, data inicial/final e IP, sem contadores de tráfego. **Não use esse formulário para apurar bilhetagem por servidor.** Utilize as alternativas abaixo e encaminhe divergências ao suporte.

## Alternativas verificadas

- Para sessões individuais e motivos: use o diálogo de bilhetagem do acesso.
- Para totais de upload/download e ranking no período: [Relatório de Uso de Banda](/relatorios/relatorio-de-uso-de-banda).
- Para reconexões frequentes: [Acessos Desconectando](/relatorios/acessos-desconectando).

Não use o resultado do formulário agregado como prova histórica de titularidade de IP. Essa análise exige consulta de uso de IP apropriada, horário/fuso e, quando houver CGNAT, faixa de portas e período do vínculo.
