---
title: Upgrades / Downgrades de Plano
published: true
editor: markdown
description: Analise históricos agrupados por serviço e minuto, compreendendo como aumentos e reduções de valor são classificados.
---

# Upgrades / Downgrades de Plano

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.

O relatório SPA reúne mensagens de **mudança de plano ou de valor** do histórico dos serviços contratados. A classificação exibida se baseia na variação de preço registrada em texto; não compara velocidade, nome do plano ou preço atual de catálogo.

## Abrir e filtrar

1. Abra **Relatórios > Financeiro > Upgrades / Downgrades**.
2. Selecione **Filiais** e as datas inicial e final; o padrão é o mês corrente.
3. Escolha **Todos**, **Upgrades** ou **Downgrades**.
4. Aguarde a consulta e use **Imprimir**. O contrato na linha abre o cadastro correspondente.

As datas selecionam a data/hora do **histórico**, não ativação do contrato ou vencimento de cobrança. Os filtros atualizam a consulta automaticamente; não há botão Exibir nem CSV próprio. A leitura usa o acesso a contratos e o escopo de filiais do usuário.

## Como as linhas são formadas

A busca aceita mensagens iniciadas por `PLANO DE` ou `VALOR DE`. Agrupa por **serviço contratado, data, hora e minuto**. Assim, uma linha pode combinar vários eventos próximos; não equivale necessariamente a uma única troca.

A tabela mostra identificador do contrato, serviço, cliente, data/hora, tipo e as mensagens agregadas. O número na coluna Contrato é o identificador interno usado pelo link; pode diferir da numeração comercial mostrada em outras telas.

| Tipo | Regra atual |
|---|---|
| **UPGRADE** | O valor final extraído é maior que o valor inicial. |
| **DOWNGRADE** | O valor final é menor **ou igual** ao inicial. |
| **Sem tipo** | Não foi possível obter os dois valores das mensagens `VALOR DE`. |

Trocar apenas o plano, sem mensagem de preço, pode deixar o tipo vazio. Esses registros aparecem em **Todos**, mas são ocultados pelos filtros Upgrades e Downgrades. Uma simples alteração de preço também pode aparecer, mesmo sem mudança de plano.

## Cuidados com o histórico

O cálculo usa a primeira mensagem de valor e a última na coleção devolvida para o grupo. A agregação não define ordenação temporal dessas mensagens; várias trocas no mesmo minuto podem gerar uma classificação que exige conferência no histórico individual.

O filtro de datas envia dias sem horário final. Eventos com hora no último dia podem ficar fora do limite utilizado na consulta. Se faltar uma troca, confira seu horário no serviço e amplie o intervalo para investigar, sem tratar a ausência como prova de que não ocorreu.

Não há total de receita adicional nem cálculo de comissão. Para usuário responsável, plano de origem e valores detalhados, veja também [Alteração de Plano](/relatorios/alteracao-de-plano), que permanece no legado e possui outro agrupamento.
