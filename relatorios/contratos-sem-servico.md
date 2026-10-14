---
title: Contratos sem Serviço
published: true
editor: markdown
description: Localize contratos sem nenhum registro de serviço contratado, por filial e data de cadastro.
---

# Contratos sem Serviço

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.

O formulário legado `relatorios/contratos_sem_servico` procura contratos cujo identificador **não aparece em nenhum serviço contratado**. Um contrato que possui apenas serviços cancelados, suspensos ou gratuitos continua tendo serviço e não entra nessa consulta.

## Operação

1. Abra o relatório com sessão autenticada e acesso ao formulário.
2. Selecione **Filial**, se necessário.
3. Preencha início e fim de **Cadastrado em** para limitar o cadastro do contrato.
4. Clique em **Exibir** e use **Imprimir** para a listagem resultante.

Sem período, não há restrição por data de cadastro. Quando um limite é informado, o DAO usa ambos em `BETWEEN`; informe o par completo. A seleção exclui contratos e filiais apagados e segue o escopo de consulta do usuário. Não há filtro de situação ou CSV próprio.

## Resultado e conferência

O total conta **contratos**, uma linha por contrato. A grade prevê contrato, filial, data de cadastro, cliente e telefones.

Na implementação atual, a seleção usa a data do contrato, mas a renderização da coluna **Cadastrado em** lê a data da pessoa. A coluna **Filial** também é obtida da pessoa, sem usar o nome de filial retornado para o contrato. Essas duas células podem divergir do recorte real ou ficar vazias; confira os dados diretamente no contrato.

A consulta não oferece contratação em lote. Para corrigir, abra o contrato e confira se ele deve receber um serviço ou se foi criado indevidamente. Use [Adicionar serviço contratado](/contratos/adicionar-servico-contratado) somente após validar titular, filial e plano.

Se o contrato possui serviço, mas falta provisionamento, use [Contratos sem Acesso](/relatorios/contratos-sem-acesso). Se possui serviço, mas falta cobrança, use [Contratos sem Mensalidade](/relatorios/contratos-sem-mensalidade).
