---
title: Acessos Desconectando
published: true
editor: markdown
description: Diferenças entre o relatório diário legado e o ranking atual de desconexões.
---

# Acessos Desconectando

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.

Há duas consultas relacionadas, com critérios diferentes: o relatório diário legado **Acesso Desconectando** e o ranking React **Top N Clientes com Desconexões**. Uma linha representa um acesso; um contrato com vários acessos pode aparecer mais de uma vez.

## Ranking atual

Abra `/relatorios/redes/top_n_desconexoes`. Informe período e **Máximo de Registros**; o padrão é o mês corrente e dez acessos. Use **Atualizar** para refazer a consulta e **Imprimir** para imprimir.

O ranking conta registros de bilhetagem agrupados por `ACESSO_ID`, cuja **data/hora de saída** está no intervalo, e ordena pela contagem decrescente. Exibe filial, contrato, cliente e desconexões. O link do contrato abre seu cadastro.

O frontend envia o dia inicial às `00:00:00Z` e o final às `23:59:59Z`, explicitamente em UTC. Considere essa referência ao comparar com horários locais. Sessão sem saída registrada não entra nessa contagem. O relatório não distingue, por si, queda involuntária, reinício de equipamento e desconexão administrativa.

## Consulta diária legada

No legado, selecione a **Data** e clique em **Exibir**; **Imprimir** imprime a listagem. O método PHP inclui acessos com **pelo menos cinco registros de histórico** no dia. Primeiro tenta reutilizar o relatório arquivado para essa data; se existir, a saída pode refletir o arquivo, e não uma nova apuração.

A tabela mostra contrato, cliente, rede, MAC, usuário, IP e quantidade de registros. A opção de filial é apresentada, mas a chamada da listagem não passa a filial ao método de apuração. Também não utiliza o parâmetro de quantidade lido pela página: o limiar está fixado em cinco no DAO.

## Investigar reincidência

Confira sessões e motivos de desconexão no acesso, equipamento e horários afetados. Compare o mesmo período, fuso e critério antes de confrontar os dois relatórios: o limiar diário, o possível relatório arquivado e os limites UTC do ranking produzem recortes diferentes. Contagem alta indica necessidade de investigação, não diagnóstico automático de defeito.

## Fontes conferidas

Comportamento confrontado com os checkouts locais em 14/10/2026. Não comprova a versão instalada nem execução com dados reais.

- `lhisp-frontend/src/paginas/relatorios/redes/RelTopNDesconexoes.tsx:25`
- `lhisp-backend/src/lhisp-business/src/business/redeinfra/BilhetagemAcessoBI.js:11`
- `lhisp-php/web/form/relatorios/acessos_desconectando_listagem.php:57`
- `lhisp-php/web/inc/classes/AcessoDAO.php:1173`
