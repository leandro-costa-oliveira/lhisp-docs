---
title: Relatório de Atendimentos por Canal
published: true
editor: markdown
description: Quantidade de atendimentos por canal e subcanal segundo a data de abertura.
---

# Relatório de Atendimentos por Canal

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.

A tela `/relatorios/agendatecnica/atendimentos_por_canal` agrupa atendimentos por **canal e subcanal registrados**, permitindo avaliar o volume de entrada. Ela não contabiliza mensagens, tempo de atendimento ou quantidade de interações de uma conversa.

## Gerar a distribuição

1. Escolha **Data do Atendimento**, início e fim; o padrão é o mês corrente.
2. Clique em **Atualizar** para repetir a consulta.
3. Compare gráfico e tabela.
4. Use **Imprimir** para obter a saída do navegador.

O backend conta `Atendimento.id`, agrupa por `canalDeAtendimento` e `subCanalDeAtendimento` e filtra `data_abertura` pelo intervalo enviado. Não há filtro de situação, responsável ou motivo nesta tela. Um atendimento conta uma vez no grupo dos valores atualmente gravados, mesmo que tenha passado por vários canais durante o tratamento.

A tabela contém **Canal**, **SubCanal** e **Quantidade**. A interface traduz os códigos pelas tabelas de canais; valores sem rótulo podem aparecer como código. Confira o cadastro/origem do atendimento quando um canal não corresponder ao esperado.

## Escopo e interpretação

A consulta passa pelo BI de atendimentos, com empresa e restrições de filial aplicáveis ao usuário. O volume pode diferir entre operadores com acesso a filiais diferentes. Alterações posteriores do canal/subcanal no cadastro também podem mudar a distribuição de um período passado.

Compare com o [Relatório de Atendimentos](/relatorios/relatorio-de-atendimentos) usando o mesmo período e escopo. Não compare diretamente com número de mensagens do WhatsApp ou OS: são unidades distintas. Não há botão de CSV nem envio automático desse relatório no código desta página.
