---
title: Relatório de OTT / SVA
published: true
editor: markdown
description: Contratos OTT/SVA por filial, gateway, situação do serviço e data de criação.
---

# Relatório de OTT / SVA

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.

A tela `/relatorios/ott` lista registros OTT/SVA vinculados a contratos, serviços e planos com gateway OTT. É uma consulta do cadastro do LHISP; não consulta uso de streaming nem confirma login na plataforma externa.

## Filtrar

1. Selecione **Filial**, **Gateway Ott** e **Situação do Serviço**.
2. Em **Criado em**, informe o período ou use a opção de todos.
3. Aguarde a atualização e confira o contador por gateway e a lista.
4. Use **Exportar CSV** ou **Imprimir**.

O padrão é serviço **ATIVO** e registros OTT criados no mês corrente. O período filtra `ContratoOtt.createdAt`, não data de criação do contrato, ativação do serviço ou alteração de plano. Para uma base instalada antiga, remova o período antes de concluir que faltam assinaturas.

A consulta exige os vínculos de registro OTT → serviço contratado → plano → configuração de gateway. Registros sem esses vínculos não entram na lista. Excluídos logicamente são desconsiderados.

## Contagens e saída

A tabela e o CSV mostram **Data/Hora**, **Filial**, **Gateway**, **Contrato**, **Cliente**, **Descrição**, **Situação** e **Usuário**. Um registro pode exibir vários gateways ou descrições do plano, sem repetir os rótulos iguais dentro da célula. O CSV usa o nome-base `RelatorioOttSva`.

O contador por gateway conta **IDs únicos de serviço contratado para cada gateway**, enquanto o rodapé conta registros OTT da listagem. Um serviço associado a vários gateways pode contar uma vez em cada gateway; a soma dos contadores não precisa coincidir com número de contratos ou linhas.

A situação exibida é do serviço contratado. Ela não é confirmação do provisionamento na plataforma nem do estado da fila do daemon OTT. Se houver divergência, confira vínculo do plano e retorno da integração antes de reprovisionar. Empresa e filiais do contrato limitam o escopo visível ao operador.

## Fontes conferidas

Comportamento confrontado com os checkouts locais em 14/10/2026. Não comprova a versão instalada nem execução com dados reais.

- `lhisp-frontend/src/paginas/relatorios/sva/RelOttSva.tsx:18`
- `lhisp-frontend/src/paginas/relatorios/sva/RelOttSva.tsx:267`
- `lhisp-backend/src/lhisp-business/src/business/contratos/ContratoBI.js:6`
- `lhisp-backend/src/lhisp-business/src/business/contratos/ContratoOttBI.js:15`
