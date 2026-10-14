---
title: Clientes Suspensos
published: true
editor: markdown
description: Consulte serviços suspensos há mais dias que o limite informado, conforme o último histórico de suspensão.
---

# Clientes Suspensos

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.

O formulário legado `relatorios/clientes_suspensos` lista **serviços atualmente suspensos** cujo último histórico de suspensão ultrapassa o limite em dias informado. Uma linha é um serviço; um contrato pode aparecer várias vezes apesar do rodapé “Contratos”.

## Consultar

1. Abra o relatório com sessão autenticada e acesso ao formulário.
2. Selecione filial e plano, quando necessário.
3. Informe **Dias** e clique em **Exibir**.
4. Confira a data de suspensão e o serviço; use **Imprimir** para a listagem.

O formulário começa com **Dias = 0**. O cálculo usa dias inteiros transcorridos desde o último histórico **Suspenso** e exige quantidade **maior que** o limite. Com limite 30, uma suspensão com exatamente 30 dias fica fora. Sem histórico de suspensão com data válida, o serviço também fica fora.

O resultado apresenta contrato, filial, cliente, endereço, telefones, serviço, dia de vencimento, valor, situação, data de suspensão e dias suspenso. Não há data de referência histórica, intervalo de datas ou CSV próprio.

## Limites de seleção

A pré-seleção busca contratos com algum serviço ativo, bloqueado ou suspenso de valor positivo. Depois percorre seus serviços e aplica suspensão, dias e plano. Assim, um contrato composto somente por serviços gratuitos pode ficar fora; em um contrato misto, um serviço gratuito suspenso pode aparecer.

O estado apresentado é atual. O relatório não reconstitui todos os períodos de suspensão anteriores, não distingue automaticamente a causa da suspensão e não reativa o serviço.

Se houver divergência, confira o último histórico do serviço e o horário do servidor utilizado no cálculo. Para listar pendências de contratação use [Serviços Pendentes](/relatorios/servicos-pendentes), que utiliza outra situação.
