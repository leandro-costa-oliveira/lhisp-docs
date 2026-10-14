---
title: Notificações dos Contratos
published: true
editor: markdown
description: Revise mensagens registradas por contrato, canal e status da integração sem reenviá-las.
---

# Notificações dos Contratos

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.

A tela `/relatorios/notificacoes_contrato` consulta **registros de notificação** dos contratos acessíveis ao usuário. Uma notificação pode conter mais de um canal; uma linha não equivale a uma mensagem entregue por canal nem a um cliente único.

## Filtros e operação

1. Abra o relatório com sessão e acesso ao menu/Contratos.
2. Selecione uma ou mais **Filiais**, se necessário.
3. Informe **Data Inicial** e **Data Final**, relativas à criação da notificação. O padrão é o mês atual.
4. Em **Filtros**, selecione os tipos **SMS**, **Email**, **App** e **WhatsApp**.
5. Confira as linhas e use **Imprimir** quando necessário.

A consulta combina os canais selecionados com **OU**: basta um dos indicadores estar marcado no registro. Os quatro canais começam selecionados. Desmarcar todos não constitui um modo confiável de pedir resultado vazio; mantenha ao menos um para uma consulta definida.

## Resultado e interpretação

A grade mostra filial, contrato, cliente, tipos, texto da notificação e **Status**. O status é o texto registrado pela integração; esta tela não traduz todos os códigos nem consulta o provedor em tempo real para comprovar entrega.

O período usa a criação do registro. Não filtra pelo momento de envio, confirmação, leitura ou recebimento pelo cliente. Os limites são enviados sem expansão explícita do último dia para 23:59:59; confira registros com horário no dia final quando faltar uma mensagem esperada.

## Limitações operacionais

O botão **Atualizar** não força nova leitura do servidor. Para confirmar uma mudança de status ocorrida depois da abertura, recarregue a página.

A tela imprime pelo navegador e não oferece CSV, reenvio, cancelamento ou alteração de mensagens. Para investigar uma falha, confira contrato, canal e texto de status e use o fluxo próprio da integração. O conteúdo pode conter dados pessoais; mantenha a impressão no atendimento autorizado.
