---
title: Documentos complementares da folha — férias
published: true
editor: markdown
description: Confira documentos de férias vinculados à folha original antes de ajustar INSS e FGTS nas contas a pagar.
---

# Documentos complementares da folha — férias

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.

Na conferência de [Folha de Pagamento](/cadastros/financeiro/folha-de-pagamento), a seção **Documentos complementares — férias** recebe a **Listagem de Férias** da competência para conferir encargos que não constam da folha mensal.

O complemento prepara apenas itens de **INSS e FGTS**. Não importa automaticamente o pagamento líquido de férias nem recalcula salário ou 13º por esse fluxo.

## Requisitos do documento

O complemento exige a folha original não cancelada, a mesma competência e CNPJ, empregado existente na folha mensal e período de férias coincidente entre os dois documentos. O início e o fim das férias precisam pertencer à competência selecionada; férias em competências diferentes devem vir discriminadas por competência.

O sistema confere o PDF mensal pelo hash do arquivo original. Se sua cópia arquivada não estiver disponível, a tela solicita também **o mesmo PDF mensal usado na importação**, não uma versão reemitida com conteúdo aparentemente igual.

Se a folha mensal já contém INSS ou FGTS para o empregado, o complemento é recusado para evitar sobreposição. Outro complemento não cancelado para o mesmo empregado/competência também impede nova inclusão. Reenviar um PDF complementar idêntico devolve a conferência já existente, sem duplicar o documento ativo.

## Importar e conferir

1. Abra a importação mensal e clique em **Adicionar documento complementar**.
2. Envie a **Listagem de Férias — PDF** e a folha original se solicitada.
3. Confira os empregados e os totais lidos.
4. Abra **Conferência** do complemento.
5. Revise conta de destino, valor anterior, valor proposto, seleção e motivos.
6. Use **Trocar conta** quando o destino precisar ser reassociado.

Importar não altera contas. O complemento precisa ser arquivado com sucesso para concluir sua criação. Permissões de importação, edição, aplicação e cancelamento seguem as da folha mensal.

Os totais consolidados da seção somam a folha e os documentos **não cancelados**, inclusive complementos pendentes. Não comprovam que todos os ajustes já foram aplicados ou pagos.

## Aplicar

A **folha mensal deve estar Aplicada** antes de aplicar o complemento. Selecione os itens aptos, leia a diferença no resumo, clique em **Aplicar complemento** e depois em **Confirmar aplicação**.

Para contas existentes, o complemento preserva o vencimento que estava na conferência. Se valor ou vencimento mudou depois, o item é recusado e pede nova associação para conferir os dados atuais. Conta paga ou com qualquer valor pago não recebe esse ajuste automático.

Os itens aptos criam ou ajustam contas seguindo os vínculos de despesas. Itens recusados permanecem com motivo; itens já aplicados não são gravados de novo numa reaplicação das sobras. Confira o resumo e as contas a pagar após cada aplicação.

## Cancelamento

**Cancelar complemento** encerra somente um documento ainda não aplicado e não altera contas a pagar. Um complemento aplicado é histórico e não pode ser cancelado como forma de estorno.

Para divergência de encargos ou pagamento já realizado, confira os documentos e trate a correção com o responsável pela folha e o financeiro. Não reapresente férias de outro período para contornar uma validação de competência ou sobreposição.
