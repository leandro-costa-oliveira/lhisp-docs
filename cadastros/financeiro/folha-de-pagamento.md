---
title: Folha de Pagamento
published: true
editor: markdown
description: Importe a folha em PDF, confira vínculos e aplique somente os ajustes selecionados nas contas a pagar.
---

# Folha de Pagamento

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.

O módulo em `/cadastros/financeiro/folha_pagamento` lê a **Folha de Pagamento do Fortes Pessoal** e prepara uma conferência antes de criar ou alterar contas a pagar. Não executa pagamento nem substitui a conferência contábil do documento.

## Permissões e documento

É necessário acesso ao módulo. Importar e editar a conferência exigem `folha_importacao_add`; aplicar exige `folha_importacao_aplicar`; cancelar/apagar exige `folha_importacao_cancelar`.

Envie um PDF por vez, com texto extraível, de até **20 MB**. Recibo de pagamento, PDF somente escaneado, documento ilegível ou totais que não fecham podem ser recusados antes da criação da importação. A competência vem do documento.

A listagem apresenta até 24 importações, ordenadas pela competência, com filtros de competência e situação. **Importar folha** aceita seleção ou arraste do arquivo. Nessa etapa são gravados rascunho e itens; as contas a pagar ainda não mudam.

## Preparar vínculos

Em **Gerenciar vínculos**, associe o código do empregado da folha a uma **Pessoa** do LHISP e, por tipo, à **Despesa** correspondente. Os códigos numéricos são normalizados com zeros à esquerda; nome parecido gera sugestão, nunca associação automática confirmada.

Os tipos são Salário, INSS, FGTS, Prolabore e 13º. Criar/editar/apagar vínculos usa `folha_vinculo_add`, `folha_vinculo_edit` e `folha_vinculo_del`. Salve primeiro o vínculo e depois configure seus destinos. Correções de vínculo permanecem disponíveis para as próximas competências.

O salário usa por padrão **Líquido**, somando ao líquido os adiantamentos identificados para não descontá-los duas vezes no saldo da conta. **Cheio** usa o salário contratual e é uma escolha explícita. INSS e FGTS usam os respectivos valores do documento. O item 13º usa **base de FGTS / 12** no importador. Prolabore começa com sincronização desabilitada, apenas para conferência de divergências.

Essas são regras do cálculo implementado, não determinação de obrigações trabalhistas. Confira a base e o documento com o responsável pela folha.

## Conferir o rascunho

A conferência agrupa itens por empregado e mostra valor/vencimento anterior, valor/vencimento proposto, destino, ação e motivo. Ações possíveis:

| Ação | Efeito ao aplicar |
|---|---|
| **CRIAR** | Cria uma conta a pagar vinculada à despesa. |
| **ATUALIZAR** | Ajusta valor e, quando definido, vencimento da conta indicada. |
| **MANTER** | Não grava alteração financeira. |
| **IGNORAR** | Não sincroniza aquele item. |
| **SEM VÍNCULO / SEM CORRESPONDÊNCIA** | Exige revisão do destino; não aplica automaticamente. |

A competência procura contas no **mês de pagamento seguinte**, inclusive dezembro para janeiro. O vencimento proposto usa o dia da despesa, limitado ao último dia desse mês. Se houver mais de uma conta não cancelada para a mesma despesa no mês, a resolução automática escolhe a de menor ID: confira o destino e use **Trocar conta** se necessário.

Contas pagas ou canceladas não são alteradas pelo importador. Uma conta nova exige despesa e dia de vencimento válidos. Quando uma conta existente não possui despesa, a criação/vinculação precisa de confirmação explícita na conferência.

Revise também empregados ausentes do PDF e eventos não mapeados. Eles não justificam zerar ou cancelar contas automaticamente. Confira as férias no fluxo de [Documentos complementares](/cadastros/financeiro/complementos-da-folha).

## Aplicar e tratar sobras

1. Selecione somente os itens conferidos; a seleção por empregado marca seus itens aplicáveis.
2. Confira quantidades, valores e mudanças de vencimento no resumo de confirmação.
3. Clique em **Aplicar** e confirme.
4. Confira as contas criadas/alteradas e os itens não aplicados com seus motivos.

A aplicação usa transação, mas recusas previstas por item são registradas e permitem concluir os demais. A importação pode ficar **Aplicada** com sobras. Corrija esses itens e reaplique: itens já aplicados não são gravados outra vez.

Se uma conta tiver surgido entre a conferência e a aplicação, o importador recusa criar outra para a mesma despesa/mês. Uma falha técnica da transação exige conferir o estado retornado antes de repetir; não lance contas paralelas sem revisar a competência.

## Reenvio, cancelamento e exclusão

Reenviar a mesma competência pendente exige confirmação de substituição e refaz a conferência, inclusive se o PDF for idêntico. Complementos não cancelados impedem substituir a folha. Uma competência aplicada não pode ser substituída, cancelada ou apagada; corrija as sobras ou trate as contas pelo fluxo financeiro.

**Cancelar importação** preserva o registro como cancelado. **Apagar importação** remove o rascunho e seus itens. Nenhuma dessas ações estorna contas a pagar; por isso são bloqueadas depois da aplicação.

Veja também [Despesas](/cadastros/financeiro/despesas) e [Gerência Financeira](/financeiro/gerencia-financeira).
