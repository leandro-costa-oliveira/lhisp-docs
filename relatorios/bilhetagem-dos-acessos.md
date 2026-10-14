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

A tela **Relatórios → Bilhetagem dos Acessos** continua no PHP e oferece **Servidor**, **Período**, **Exibir** e **Imprimir**. Porém, o destino `rel_bilhetagem_listagem.php` consulta `UsodeipDAO.listarPorIpPeriodo`, tenta ler um IP que esse formulário não envia e não usa o servidor informado.

Além disso, passa a data final como argumento de hora dessa consulta. A saída contém contrato, cliente, data inicial/final e IP, sem contadores de tráfego. **Esse formulário não pode ser tratado como relatório validado de bilhetagem por servidor no checkout auditado.** A existência do menu não garante coerência entre os filtros e a listagem.

## Alternativas verificadas

- Para sessões individuais e motivos: use o diálogo de bilhetagem do acesso.
- Para totais de upload/download e ranking no período: [Relatório de Uso de Banda](/relatorios/relatorio-de-uso-de-banda).
- Para reconexões frequentes: [Acessos Desconectando](/relatorios/acessos-desconectando).

Não use o resultado do formulário agregado como prova histórica de titularidade de IP. Essa análise exige consulta de uso de IP apropriada, horário/fuso e, quando houver CGNAT, faixa de portas e período do vínculo.

## Fontes conferidas

Comportamento confrontado com os checkouts locais em 14/10/2026. Não comprova a versão instalada nem execução com dados reais.

- `lhisp-php/web/form/contratos/dialogBilhetagemAcesso.php:15`
- `lhisp-php/web/form/relatorios/rel_bilhetagem.php:19`
- `lhisp-php/web/form/relatorios/rel_bilhetagem_listagem.php:36`
- `lhisp-php/web/inc/classes/UsodeipDAO.php:115`
