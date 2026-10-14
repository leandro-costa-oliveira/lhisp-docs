---
title: Serviços Pendentes
published: true
editor: markdown
description: Localize serviços contratados ainda pendentes por criação, filial e nome do cliente.
---

# Serviços Pendentes

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.

O relatório `/relatorios/clientes/servicos_pendentes` consulta serviços na situação atual **Pendente**. Cada linha é um serviço contratado; não é uma contagem de contratos, pré-cadastros ou ordens de instalação.

## Filtros e consulta

| Campo | Critério |
|---|---|
| **Cliente** | Trecho do nome da pessoa vinculada ao contrato. Não pesquisa CPF/CNPJ ou número do contrato. |
| **Filial** | Filial do contrato, dentro do acesso autorizado do usuário. |
| **Período** | Data de criação do serviço; o padrão é o mês atual. Só é aplicado quando as duas datas estão preenchidas. |

Abra com sessão e acesso ao menu/Contratos, preencha o recorte e aguarde o resultado. **Atualizar** refaz a consulta da lista. A API também obtém a quantidade total para paginação em grupos de **10 serviços**.

A grade mostra ID do serviço, número do contrato com atalho para cadastro, cliente, plano e data de criação. O serviço precisa continuar pendente no momento da consulta; um serviço depois ativado não permanece nesse relatório para o mesmo período.

## Impressão

**Imprimir** faz uma nova consulta com os mesmos filtros, retirando o limite e o deslocamento da página. Assim, imprime **todos os serviços encontrados**, não apenas os dez visíveis. Não há exportação CSV nem ativação em lote.

## Conferências

O período não mede há quanto tempo o serviço está pendente nem a data de agendamento técnico. A situação pode resultar de falta de acesso, aceite ou outras etapas da contratação; a listagem não determina a causa automaticamente.

Os limites de criação são enviados sem expansão explícita do fim para 23:59:59. Confira horários no último dia se um registro esperado faltar. Ao alterar filtros enquanto estiver em página posterior, retorne à primeira página antes de interpretar uma grade vazia.

Para continuar o fluxo, abra o contrato e confira [Serviços contratados](/contratos/adicionar-servico-contratado), [Acessos](/contratos/adicionar-acesso-cliente) e [Agenda técnica](/agenda-tecnica/agenda-tecnica).
