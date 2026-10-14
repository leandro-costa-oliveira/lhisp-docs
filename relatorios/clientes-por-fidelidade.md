---
title: Clientes por Fidelidade
published: true
editor: markdown
description: Consulte o valor de fidelidade cadastrado no serviço e conheça os limites da listagem legada.
---

# Clientes por Fidelidade

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.

O formulário legado `relatorios/clientes_fidelidade` filtra o campo numérico **Fidelidade** de um serviço representativo do contrato. Não calcula se uma data de fidelização já venceu e não calcula multa de rescisão.

## Operação e critérios

1. Abra o relatório com sessão autenticada e acesso ao formulário.
2. Selecione **Filial**, se necessário.
3. Em **Fidelidade**, escolha **Todos**, **Somente com Fidelidade** ou **Somente sem Fidelidade**.
4. Clique em **Exibir** e confira o serviço antes de usar **Imprimir**.

**Com fidelidade** exige valor maior que zero; **sem fidelidade**, valor menor ou igual a zero. A seleção inicial considera contratos com serviço ativo, bloqueado ou suspenso e inclui valores gratuitos. Não existe período, filtro de vencimento da fidelidade ou CSV próprio.

## Resultado

A grade prevê contrato, filial, cliente, telefones, serviço, valor, fidelidade, situação, quantidade de contas e quantidade em aberto. As colunas chamadas **Qtd. Mens.** consultam todas as contas a receber do serviço sem restringir o tipo a mensalidade; **em aberto** conta as que estão nessa situação.

A consulta agrupa por contrato antes de escolher o serviço para conferir a fidelidade. Em contratos com vários serviços, o serviço representado não tem ordenação definida; outro serviço do contrato pode ter condição de fidelidade diferente.

## Limitação atual importante

A coluna **Contrato** pode ficar vazia ou incorreta quando o serviço possui contas a receber. Não use essa coluna isoladamente para identificar um cliente ou justificar cobrança.

Confira o contrato, o serviço, os documentos e a condição de fidelidade diretamente no cadastro antes de tomar uma decisão. Para um inventário atual de serviços com identificação consistente, utilize [Relatório de Clientes](/relatorios/relatorio-de-clientes) e abra a aba **Serviços** do contrato.
