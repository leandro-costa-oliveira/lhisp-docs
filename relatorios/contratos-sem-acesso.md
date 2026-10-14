---
title: Contratos sem Acesso
published: true
editor: markdown
description: Identifique serviços sem registro correspondente na tabela de acessos, por cadastro do contrato e situação do serviço.
---

# Contratos sem Acesso

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.

O relatório legado `relatorios/contratos_sem_acesso` procura **serviços contratados sem registro de acesso associado**. Cada linha representa um serviço, não um contrato único, e o resultado não significa que a pessoa esteja sem qualquer acesso de internet.

## Consultar

1. Abra o relatório com sessão autenticada e acesso ao formulário.
2. Selecione **Filial**, se necessário.
3. Informe os dois limites de **Cadastrado em**, relativos ao cadastro do contrato.
4. Escolha a **Situação do serviço**, ou deixe vazia para não restringir.
5. Clique em **Exibir**, confira o serviço e use **Imprimir** quando necessário.

Sem período, a consulta não restringe o cadastro do contrato. Quando um dos limites é enviado, o DAO utiliza os dois em `BETWEEN`; preencha o par para obter um recorte definido. Não há CSV próprio.

## Critério técnico

A consulta parte dos serviços contratados e exclui os identificadores encontrados na tabela de acessos. Ela **não exige que o plano ofereça acesso de internet**. Serviços de OTT, telefonia ou outros tipos podem aparecer legitimamente sem acesso.

O subselect de acessos não filtra exclusão lógica. Um acesso apagado ainda presente na tabela pode fazer o serviço ficar fora deste relatório. Confira a opção de registros apagados no cadastro quando a ausência parecer incorreta.

A grade mostra contrato, filial, cliente, telefones, ID/descrição do serviço e situação. O rodapé usa o rótulo **Contratos**, mas conta linhas de serviços. Contratos sem nenhum serviço não entram; use [Contratos sem Serviço](/relatorios/contratos-sem-servico).

A consulta não cria nem provisiona acessos. Antes de corrigir, confira tipo do plano, aceite exigido e serviço correto em [Adicionar acesso ao cliente](/contratos/adicionar-acesso-cliente).
