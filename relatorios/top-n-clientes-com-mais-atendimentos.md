---
title: Top N Clientes com Mais Atendimentos
published: true
editor: markdown
description: Ranking de contratos por atendimentos abertos no período e comparação com OS criadas.
---

# Top N Clientes com Mais Atendimentos

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.

A tela `/relatorios/agendatecnica/top_n_atendimentos` ordena **contratos** pelo número de atendimentos abertos no período. Apesar do nome de clientes, não consolida todos os contratos de uma mesma pessoa em uma única linha.

## Configurar o ranking

1. Escolha **Data do Atendimento**; o padrão é o mês corrente.
2. Defina **Quantidade do ranking**; o padrão é dez e a interface exige pelo menos um.
3. Se necessário, selecione **Motivo** e **Aberto por**.
4. Clique em **Atualizar**, confira o ranking e use o ícone de impressão.

A tabela apresenta posição, filial, contrato, cliente, atendimentos e ordens de serviço. Os cartões superiores somam os valores **dos contratos retornados no ranking**, não de toda a base. O gráfico detalha a situação dos **dez primeiros contratos**, mesmo quando a tabela contém um N maior.

## Critérios das contagens

O backend agrupa atendimentos por `ContratoId`, filtra a abertura e ordena a contagem de forma decrescente. O filtro de usuário atua sobre quem abriu o atendimento.

A contagem de **OS** usa outra consulta: considera `createdAt` da ordem no mesmo intervalo e seu contrato, não o dia agendado/executado. Não exige que a OS pertença a um dos atendimentos contados naquela linha. Por isso não representa a conversão direta de atendimento em visita.

## Motivo, gráfico e situação

O motivo corresponde à coluna `MotivoId` do atendimento, exposta no modelo como `MotivoAtendimentoId`. O gráfico consulta novamente os atendimentos dos dez primeiros contratos e separa **Em aberto** (inclui em atendimento), **Concluídos** e **Aguardando OS**. Situações fora desses grupos não viram uma série adicional; por isso a soma visual deve ser confrontada com a contagem da tabela. O filtro de motivo não é reaplicado à contagem independente de OS.

A consulta respeita o escopo dos BIs de atendimento, OS e contrato. Para comparar operadores, mantenha o mesmo acesso às filiais. O relatório não identifica automaticamente defeito recorrente: investigue motivo e histórico antes de classificar o cliente.
