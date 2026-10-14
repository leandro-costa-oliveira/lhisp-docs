---
title: Clientes por Filial
published: true
editor: markdown
description: Compare contratos e serviços por filial na consulta atual e na listagem legada.
---

# Clientes por Filial

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.

A distribuição por filial está disponível no [Relatório de Clientes](/relatorios/relatorio-de-clientes), em `/relatorios/clientes`, e no relatório legado `relatorios/clientes`. As duas implementações têm critérios diferentes; compare totais somente depois de alinhar situações, valores gratuitos e unidade de contagem.

## Consulta atual

Na tela atual, selecione filial e use **Mais filtros** para tipo de pessoa, categoria B2C/B2B, segmento, plano, data de referência e inclusão de bloqueados/suspensos. **Incluir clientes VIP** controla o recorte de contratos gratuitos.

Os cartões contam contratos distintos e serviços separadamente. O gráfico por filial representa serviços ativos, bloqueados e suspensos. Cada linha detalhada é um serviço. **Exportar CSV** inclui o resultado detalhado da consulta, com as outras páginas.

A data de referência limita o cadastro do contrato. As situações e os valores continuam atuais; não se reconstrói uma base histórica fechada. Consulte o guia completo antes de comparar esse resultado com um mês já encerrado.

## Consulta legada por filial

1. Abra o formulário legado com sessão e acesso ao menu.
2. Deixe **Filial** e **Plano** vazios e **Exibir Lista Detalhada** desmarcado para consultar o resumo por filial.
3. Defina tipo de pessoa, categoria, segmento, VIP, bloqueados e suspensos.
4. Clique em **Exibir** e use **Imprimir**.

O resumo conta **contratos distintos** com ao menos um serviço elegível. Sem **Listar Clientes VIP**, o serviço precisa ter valor positivo. Ativos entram sempre; bloqueados e suspensos dependem das opções. Não há período no formulário legado.

Selecionar uma filial marca automaticamente a opção de lista detalhada na interface. O backend também assume detalhamento quando recebe filial ou plano sem o campo dessa opção. O modo detalhado mostra dados de pessoa/endereço, serviço, valor e situação, com CSV da tabela.

## Diferenças importantes no legado

O modo detalhado agrupa por contrato e seleciona um serviço sem ordem definida. Plano e opções de bloqueados/suspensos são conferidos depois dessa escolha, podendo omitir um contrato que teria outro serviço compatível. Seu total não é uma contagem completa de serviços.

O filtro **Plano** não é aplicado na consulta resumida por filial, embora apareça no formulário. Para analisar um plano específico, prefira [Clientes por Plano](/relatorios/clientes-por-plano) ou o filtro de plano da consulta atual.

Os valores exibidos são mensais cadastrais; não equivalem a dinheiro recebido. O acesso a filiais e contratos deve estar autorizado no perfil utilizado.
