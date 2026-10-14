---
title: Registro.BR
published: true
editor: markdown
description: Estado do relatório legado denominado Registro.BR e cuidados com a saída de acessos.
---

# Registro.BR

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.

O menu legado **Relatório de Clientes para o Registro.BR** abre uma listagem de acessos e dados cadastrais. Esse relatório **não envia dados ao Registro.br nem gera protocolo de entrega ou arquivo de formato oficial**. O título do menu, sozinho, não certifica adequação a uma solicitação externa.

## O que a consulta faz

1. Abra **Relatórios → Registro.BR** no menu legado.
2. Clique em **Exibir**.
3. Confira o conteúdo antes de usar **Imprimir**.

O formulário visível não apresenta filtros. A listagem percorre serviços contratados **ATIVOS ou BLOQUEADOS**, depois os acessos vinculados a cada serviço. Mostra contrato, cliente, plano, CPF/CNPJ, usuário, **senha do acesso**, IP, data/hora da conexão e indicador PPPoE ON/OFF.

Sem datas recebidas, utiliza o último histórico de sessão para preencher a conexão. O indicador ON/OFF continua vindo do estado atual do acesso; não significa que o cliente estava online na data de uma requisição histórica. Total de acessos não equivale a total de pessoas ou contratos únicos.

## Limites da consulta

O formulário não oferece filtros de rede/setor, datas ou estado. Não presuma que a saída está restrita a uma rede, região ou período específico.

Não há colunas de porta CGNAT ou protocolo de conexão neste relatório. Para investigar titularidade em um instante, é necessário cruzar o histórico apropriado de uso de IP e, quando aplicável, o mapeamento de portas, com horário e fuso da solicitação. Para sessões, consulte [Bilhetagem dos Acessos](/relatorios/bilhetagem-dos-acessos).

A saída expõe senha e dados pessoais. Restrinja sua circulação e prepare somente os campos necessários à finalidade autorizada. O relatório não mascara essas colunas automaticamente.
