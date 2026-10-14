---
title: Alteração de Plano
published: true
editor: markdown
description: Consulte o relatório legado de mudanças de plano, com usuário, filial, plano de origem e valores do histórico.
---

# Alteração de Plano

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.

Este relatório possui implementação no **legado**: formulário, consulta e impressão. Use o atalho legado correspondente; o caminho interno é `/lgc/relatorios|alteracao_de_plano`. A alternativa SPA [Upgrades / Downgrades de Plano](/relatorios/upgrades-downgrades-de-plano) usa outro agrupamento e não substitui todos os filtros deste relatório.

## Consultar

1. Selecione **Usuário**, **Filial** e **Plano de Origem**, se precisar restringir a busca.
2. Informe as datas inicial e final; a tela inicia no mês corrente.
3. Clique em **Exibir** para carregar o quadro inferior.
4. Use **Imprimir** depois de conferir os resultados.

O período considera a **data/hora do histórico do serviço**, do início do primeiro dia ao fim do último. Usuário significa quem registrou a alteração, não o vendedor. Plano de origem é o identificador do plano anterior gravado no histórico.

A consulta exige sessão autenticada, restringe a empresa e desconsidera contratos excluídos. Os seletores são carregados conforme os cadastros disponíveis à sessão; não presuma que selecionar uma filial altera as permissões do usuário.

## Origem dos dados

A listagem procura históricos de alteração com mensagem iniciada por `PLANO DE `. Relaciona os planos anterior e atual pelos identificadores guardados no evento. Para obter a mudança de preço do serviço, procura uma mensagem `VALOR DE` do mesmo serviço, situação e usuário, com diferença de até 30 segundos.

| Informação | Como interpretar |
|---|---|
| **Data/Hora, Usuário e Descrição** | Evento de histórico utilizado na linha. |
| **Plano Anterior / Plano Atual**, com valor entre colchetes | Nome e preço encontrados no cadastro dos planos durante a consulta. Não são garantia do preço de catálogo na data da troca. |
| **Valor Anterior / Valor Atual** | Valores extraídos da mensagem de mudança de preço do serviço. Podem ficar vazios se não houver evento de valor associado. |
| **Saldo** | Diferença entre a soma dos valores atuais e anteriores extraídos do histórico. Não representa recebimento em caixa. |
| **Alterações de Plano / Contratos** | Linhas retornadas e números de contrato distintos nessas linhas. |

## Agrupamento e limitações

A consulta agrupa por **serviço contratado e situação do histórico**, sem separar cada instante da troca. Várias mudanças do mesmo serviço no intervalo podem aparecer em uma única linha; o contador não é uma contagem integral de eventos.

A mensagem de valor associada usa o primeiro resultado encontrado na janela de 30 segundos, sem uma ordenação que garanta a correspondência quando houver várias alterações próximas. Os totais também dependem da interpretação de valores escritos em texto no histórico. Para uma auditoria de uma troca específica, abra o histórico do serviço no [contrato](/contratos/contrato) e confira os eventos completos.

O formulário oferece impressão do resultado, sem botão próprio de CSV. Uma listagem vazia pode indicar ausência dos vínculos de plano anterior/atual ou do padrão esperado de mensagem, além dos filtros selecionados.
