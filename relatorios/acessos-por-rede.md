---
title: Acessos por Rede
published: true
editor: markdown
description: Listagem legada de acessos por servidor, setor, rede e estado online atual.
---

# Acessos por Rede

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.

A consulta é implementada no legado como **Relatório de Clientes por Rede**. Lista acessos das redes selecionadas, excluindo serviços **CANCELADOS** e **SUSPENSOS**. Não é uma contagem de pessoas únicas: um contrato com vários acessos pode gerar várias linhas.

## Consultar

1. Abra **Relatórios → Acessos por Rede** no menu legado.
2. Escolha **Servidor**, **Setor** e/ou **Rede**. Rede específica tem prioridade; sem rede, usa o setor; sem ambos, percorre as redes disponíveis. O servidor restringe os acessos depois dessa seleção.
3. Escolha **Somente Online**, **Somente Offline** ou **Todos**.
4. Opcionalmente marque **Simplificado**, **Exibir Nível de Sinal** e **Listar somente Clientes com a Velocidade Reduzida**.
5. Clique em **Exibir** e confira o resultado antes de imprimir.

A opção de reduzidos considera a marcação de redução do acesso, sem recalcular toda diferença entre acesso e plano. O estado online é o atualmente registrado no cadastro.

## Campos e totais

A listagem completa apresenta contrato, cliente, plano, endereço, documento, telefones, servidor, rede, usuário, senha, MAC, IP, estado PPPoE e valor do serviço. **Simplificado** oculta parte desses dados, incluindo a senha. Consultar sinal pode executar leitura no equipamento e aumentar o tempo da consulta.

O valor é acumulado por linha de acesso. Se vários acessos usam o mesmo serviço, não trate a soma como receita única por contrato ou serviço. A tela não fornece exportação CSV própria.

## Limite do filtro por período

Os campos **Conectados em** e o título com período continuam no formulário, mas o trecho que consultaria o histórico de sessões está comentado na listagem atual. Portanto, informar datas **não transforma a saída em histórico de quem estava conectado no período**. Para sessões e horários, use a bilhetagem do acesso; para volume, consulte [Uso de Banda](/relatorios/relatorio-de-uso-de-banda).

A listagem completa contém credenciais e dados pessoais. Restrinja a impressão e prefira a saída simplificada quando a tarefa não exigir esses campos.
