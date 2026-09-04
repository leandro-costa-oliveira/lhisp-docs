---
title: Início
description: Visão geral da documentação operacional do LHISP
published: true
date: 2026-06-23T18:07:25.756Z
tags:
editor: markdown
dateCreated: 2026-06-23T17:26:13.031Z
---

# Documentação do LHISP

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.

O LHISP é uma plataforma de gestão para provedores de internet. Seus módulos compartilham os mesmos cadastros e processos: um contrato reúne serviços e acessos; a cobrança gera contas e documentos fiscais; a agenda conduz a instalação e o suporte; estoque e rede registram os recursos usados para entregar o serviço.

Esta documentação explica não apenas as telas, mas também as relações entre módulos, regras de negócio, integrações e tarefas automáticas verificadas no código do sistema.

## Principais áreas

| Área | O que você encontra |
|---|---|
| [Contratos](/contratos/contrato) | Cadastro do cliente, contratação de serviços, acessos de rede e geração de contas. |
| [Financeiro](/financeiro/gerencia-financeira) | Contas a receber e a pagar, cobrança bancária, carnês, bloqueios, reajustes e documentos fiscais. |
| [Agenda Técnica](/agenda-tecnica/agenda-tecnica) | Atendimento, agendamento e execução de ordens de serviço. |
| [Estoque](/estoque/almoxarifados) | Saldos, entradas, notas de compra, patrimônios, materiais de técnicos e transferências. |
| [Rede e Infraestrutura](/rede-infra/redes) | Servidores, redes, endereçamento, equipamentos, monitoramento e provisionamento. |
| [Sistema e integrações](/sistema/empresa) | Configuração da empresa, usuários, comunicação e serviços de terceiros. |
| [Relatórios](/relatorios/contas-a-receber) | Consultas operacionais, financeiras, comerciais, fiscais e técnicas. |
| [Dashboard Comercial](/dashboards/dashboard-comercial) | Indicadores de serviços vendidos e andamento das instalações. |

## Fluxo básico de um novo cliente

1. Cadastre a pessoa e o [contrato](/contratos/cadastrar-novo-cliente).
2. Adicione o [serviço contratado](/contratos/adicionar-servico-contratado), que define plano, valor e cobrança.
3. Configure o [acesso de rede](/contratos/adicionar-acesso-cliente), quando aplicável.
4. Gere ou confira as [contas do contrato](/contratos/gerar-contas-cliente).
5. Acompanhe a instalação e os atendimentos na [Agenda Técnica](/agenda-tecnica/agenda-tecnica).

Cada página informa os efeitos da operação e os cuidados necessários. Antes de executar uma ação em produção, confira permissões, filial, contrato e situação atual dos registros envolvidos.
