---
title: Contratos sem Mensalidade
published: true
editor: markdown
description: Localize serviços pagos sem conta de mensalidade aberta ou paga em cada janela mensal consultada.
---

# Contratos sem Mensalidade

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.

O relatório legado `relatorios/clientes_sem_mensalidade` percorre os serviços e verifica a existência de contas do tipo **Mensalidade** por janela de vencimento. Cada linha representa uma combinação **serviço × período sem conta**; um contrato pode aparecer várias vezes.

## Consultar

1. Abra o relatório com sessão e acesso ao formulário.
2. Selecione filial e situação do serviço, quando necessário.
3. Informe mês/ano de **Vencimento Inicial** e **Vencimento Final**.
4. Opcionalmente, preencha **Data de Ativação Max.**.
5. Clique em **Exibir**, confira os serviços e use **Imprimir**.

O formulário não oferece filtro efetivo por plano nem CSV próprio. O recorte é de vencimento das contas, não da data em que foram geradas.

## Serviços e contas considerados

O serviço precisa ter valor maior que zero, não estar cancelado e ter sido ativado **antes do início da janela mensal**. A situação escolhida é aplicada adicionalmente; escolher Cancelado não produz resultado porque o relatório sempre exclui cancelados.

Quando informada, **Data de Ativação Max.** mantém serviços ativados até essa data. Serviços gratuitos, sem ativação anterior à janela ou com mensalidade aberta/paga encontrada ficam fora.

Somente contas de mensalidade **Em aberto** ou **Pagas** comprovam cobertura. Uma mensalidade cancelada ou negociada, isoladamente, não impede o serviço de aparecer.

## Limites da janela e da saída

A verificação usa `BETWEEN` inclusivo do primeiro dia do mês até o **primeiro dia do mês seguinte**. Uma conta vencendo no dia 1 do mês seguinte pode impedir a indicação de ausência no mês anterior. Confira esses títulos antes de gerar uma cobrança corretiva.

A coluna **Faturamento** imprime o início de cada janela junto com o fim geral da consulta, em vez de mostrar sempre o fim daquele mês. O rodapé **Contratos** conta linhas, não contratos únicos.

A grade também mostra filial, cliente, telefones, serviço, ativação e situação. O relatório só consulta: não gera a conta faltante. Antes de usar [Gerar carnês](/financeiro/gerar-carnes), confira mensalidades existentes, acordos, primeiro proporcional, período de ativação e vencimentos nas bordas para evitar duplicidade.
