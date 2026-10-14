---
title: Contas a Receber por Cliente
published: true
editor: markdown
description: Consulte títulos abertos pelo CPF/CNPJ, agrupando os contratos do cliente e distinguindo valor nominal de saldo.
---

# Contas a Receber por Cliente

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.

Esta consulta busca **contas abertas de todos os contratos vinculados ao CPF/CNPJ informado**, dentro do período de vencimentos. O mesmo documento pode reunir vários contratos e filiais acessíveis ao usuário.

## Consultar

1. Abra **Relatórios > Clientes > Contas a Receber**.
2. Preencha **CPF / CNPJ** e saia do campo para aplicar o documento à pesquisa.
3. Informe o intervalo de vencimentos e aguarde a consulta.
4. Use **Atualizar** para repetir a busca ou **Imprimir** para imprimir a tabela.
5. Abra o número do contrato para investigar a cobrança na aba financeira.

O documento é comparado por igualdade no cadastro da pessoa. A consulta automática só é habilitada depois que existe um documento aplicado; digitar sem sair do campo pode manter a pesquisa anterior. O intervalo inicial vai de cinco anos atrás até o fim do mês corrente.

A leitura exige acesso às contas a receber. O backend restringe a empresa e os contratos às filiais do usuário; a tela não oferece seletor adicional de filial ou conta bancária.

## Ler o resultado

Cada linha corresponde a uma conta: **Contrato, Cliente, Descrição, Vencimento e Valor**. O rodapé informa a quantidade de títulos e a soma dos valores nominais.

**O total não desconta valores já recebidos parcialmente**, nem calcula multa, juros ou desconto. Uma conta aberta de R$ 100 com R$ 40 recebidos continua contribuindo com R$ 100 nessa consulta. Confira o saldo atual no contrato ou na [Gerência Financeira](/financeiro/gerencia-financeira).

A pesquisa fixa a situação em **Aberta**. Contas pagas, canceladas e negociadas não entram, e registros excluídos logicamente ficam fora da consulta padrão. Também podem aparecer contas ainda não vencidas quando o período as inclui.

## Resultado vazio ou divergente

| Situação | Conferência |
|---|---|
| Nada aparece após digitar | Saia do campo do documento e confira o CPF/CNPJ armazenado na pessoa. |
| Conta conhecida não aparece | Confira vencimento, situação, exclusão e acesso à filial do contrato. |
| Cliente aparece em mais de um contrato | É esperado: a seleção usa o documento da pessoa, não um único contrato. |
| Valor difere do saldo do contrato | O relatório soma valor nominal, sem abater recebimentos parciais. |

A tela não oferece CSV nem paginação própria. Para filtros de situação, banco, geração e pagamento, use [Contas a Receber](/relatorios/contas-a-receber); para um documento de quitação, revise os títulos no contrato.
