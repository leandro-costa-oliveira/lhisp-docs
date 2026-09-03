---
title: Relatório de Endereços
published: true
editor: markdown
description: ''
---

# Relatório de Endereços

## Disponibilidade atual

O item **Relatórios > Clientes > Relatório de Endereços** abre a rota legada `/lgc/relatorios|enderecos`, mas a página apresenta somente a mensagem **NÃO IMPLEMENTADO**. Não existem filtros, consulta, impressão ou exportação disponíveis nesse fluxo.

Esse comportamento foi confirmado no staging e no arquivo `lhisp-php/web/form/relatorios/rel_enderecos.php`.

## Alternativas disponíveis

- **Cadastros > Administrativo > Endereços** (`/cadastros/administrativo/enderecos`): consulta e mantém os endereços cadastrados.
- **Relatórios > Clientes > Clientes por Endereço** (`/lgc/relatorios|clientes_enderecos`): filtra clientes por UF, cidade, bairro e logradouro; também permite incluir contratos cancelados.

Essas telas têm finalidades relacionadas, mas não substituem um relatório consolidado de endereços.

## Captura de tela

![Relatório de Endereços não implementado](/assets/screenshots/relatorios/relatorio-de-enderecos.png)

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.
