---
title: Relatório de Endereços
published: true
editor: markdown
description: Estado da tela legada não implementada e alternativas para consulta de endereços e clientes.
---

# Relatório de Endereços

## Disponibilidade atual

O item **Relatórios > Clientes > Relatório de Endereços** abre a rota legada `/lgc/relatorios|enderecos`, mas a página apresenta somente a mensagem **NÃO IMPLEMENTADO**. Não existem filtros, consulta, impressão ou exportação disponíveis nesse fluxo.

A revisão local de 14/10/2026 conferiu esse estado no arquivo `lhisp-php/web/form/relatorios/rel_enderecos.php`, sem executar ambiente remoto. A captura abaixo é preexistente.

## Alternativas disponíveis

- **Cadastros > Administrativo > Endereços** (`/cadastros/administrativo/enderecos`): consulta e mantém os endereços cadastrados.
- **Relatórios > Clientes > Clientes por Endereço** (`/lgc/relatorios|clientes_enderecos`): filtra clientes por UF, cidade, bairro e logradouro; também permite incluir contratos cancelados.

Essas telas têm finalidades relacionadas, mas não substituem um relatório consolidado de endereços.

## Captura de tela

![Relatório de Endereços não implementado](/assets/screenshots/relatorios/relatorio-de-enderecos.png)

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.
