---
title: Notas Fiscais de Compra
published: true
editor: markdown
description: Recebimento de NF-e, conciliação dos produtos e integração da compra com estoque e contas a pagar
---

# Notas Fiscais de Compra

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.

Uma nota fiscal de compra reúne o documento fiscal recebido de um fornecedor e os dois desdobramentos operacionais da compra: a entrada do material no estoque e o registro das obrigações no financeiro. Importar a nota não altera esses módulos imediatamente. O LHISP mantém controles separados para indicar se o **material** e o **financeiro** já foram lançados.

A nota pode chegar ao sistema por upload manual do XML ou pela distribuição de documentos fiscais eletrônicos (DFe) da SEFAZ. Em ambos os casos, o usuário deve conferir fornecedor, filial, itens e valores antes de concluir os lançamentos.

## Como a NF-e chega ao LHISP

### Upload manual

Em **Estoque > Notas Fiscais de Compra > Cadastrar**, selecione a filial e envie o XML da NF-e. O frontend interpreta o documento para preencher emitente, data de emissão, número/série, natureza da operação, valor e itens. Revise os dados antes de salvar.

O sistema impede um novo cadastro quando já existe uma nota do mesmo fornecedor com o mesmo número/série. O XML deve representar uma NF-e válida; a data de emissão também precisa ser válida.

### Distribuição DFe

O botão **Sincronizar NF-e** consulta, para o CNPJ da filial, os documentos disponibilizados pela SEFAZ. A integração depende do certificado e da configuração de NF-e da filial. As notas encontradas são pré-cadastradas, sem lançar estoque ou contas a pagar.

A consulta também é executada automaticamente pelo backend a cada duas horas, aos 45 minutos. O processo percorre as empresas ativas e suas filiais, mas consulta apenas uma vez cada CNPJ. Filiais que representam divisões internas e compartilham o mesmo CNPJ também compartilham a sequência de consulta à SEFAZ.

A SEFAZ pode bloquear novas consultas por uma hora após uma resposta sem documentos ou quando há consumo indevido. Nesse período, novas tentativas não antecipam a liberação. O cursor NSU somente é atualizado depois que o lote termina de ser processado, e a chave de acesso evita importar a mesma NF-e novamente.

Todas as consultas, automáticas ou manuais, são registradas em **Consultas DFe**, com situação, quantidades processadas e eventual erro. A sincronização manual exige a permissão `notafiscalcompra_sincronizar_dfe`.

## Ciência da operação e XML completo

Em alguns casos, a SEFAZ entrega primeiro apenas um resumo da NF-e. A listagem identifica esse estado como **Aguardando ciência**, e a nota ainda não possui os itens necessários para lançar material ou financeiro.

Use **Dar ciência** para registrar o evento fiscal **Ciência da Operação**. Essa manifestação informa que a empresa tomou conhecimento do documento e é irreversível; ela não equivale à confirmação definitiva de que a operação ocorreu. A ação exige a permissão `notafiscalcompra_manifestar_dfe`.

Depois da ciência, o XML completo pode não estar disponível imediatamente. Aguarde a próxima sincronização. Se a integração estiver configurada para ciência automática, o processo agendado manifesta os resumos sem intervenção do usuário.

## Conciliação dos itens com o catálogo

Os nomes e unidades usados pelo fornecedor nem sempre coincidem com o cadastro interno. Em **Lançar Material**, selecione o almoxarifado e relacione cada item fiscal a um produto do LHISP. A quantidade pode ser ajustada por um multiplicador para converter, por exemplo, caixas compradas em unidades controladas no estoque.

Ao lançar:

- o LHISP grava a associação entre a descrição fiscal e o produto, incluindo código, unidade e multiplicador, para sugerir a mesma correspondência nas próximas compras;
- se nenhum produto for escolhido, procura um produto com o mesmo nome e unidade;
- se ainda não encontrar, cria o produto na categoria **IMPORTADO DE NOTA FISCAL DE COMPRA**;
- produtos comuns geram uma entrada no almoxarifado e um histórico vinculado à nota;
- a operação inteira de lançamento do material ocorre em uma transação: uma falha impede que apenas parte dos itens seja movimentada.

Produtos com controle patrimonial ou exigência de número de série não entram no saldo comum nesse lançamento. Depois, registre as unidades e seus identificadores em **Estoque > Patrimônio > Lançar Patrimônio**. A fila dessa tela considera os produtos marcados com **controle patrimonial**; portanto, confira essa configuração antes de concluir a conciliação de itens seriados.

Após o lançamento, a nota fica marcada como **Material lançado** e não pode ser lançada novamente. Consulte [Entrada de Material](/estoque/entrada-de-material) para entradas sem documento fiscal e [Almoxarifados](/estoque/almoxarifados) para entender a separação dos saldos.

## Integração com contas a pagar

Em **Lançar Financeiro**, o LHISP usa as duplicatas do XML como sugestão de parcelas. Quando o XML não contém cobrança, sugere uma única parcela no valor total, com vencimento na data de emissão. Vencimentos, valores e demais dados podem ser revisados antes da confirmação.

Cada nova parcela é criada como uma conta a pagar, com filial, fornecedor, centro de custo, descrição e os demais classificadores informados. Se a conta já tiver sido cadastrada — inclusive se já estiver paga — use a conciliação: o sistema apenas grava nela o número da nota e registra a operação no histórico, sem alterar valor, vencimento ou situação.

A diferença entre a soma das parcelas e o total da nota produz um alerta, mas não impede o lançamento. A criação das contas, a conciliação e a marcação final da nota são requisições separadas. Se ocorrer uma falha no meio do processo, confira as contas a pagar já criadas ou conciliadas antes de tentar novamente, para não duplicar parcelas.

Quando tudo termina, a nota fica marcada como **Financeiro lançado**. Essa ação e a conciliação exigem a permissão `notafiscalcompra_lancar_financeiro`. Veja também [Despesas](/cadastros/financeiro/despesas) para contas recorrentes e [Gerência Financeira](/financeiro/gerencia-financeira) para acompanhar os títulos gerados.

## Situações na listagem

| Indicação | Significado |
|---|---|
| **Aguardando ciência** | Existe somente o resumo distribuído pela SEFAZ; é necessário manifestar ciência e obter o XML completo. |
| **Aguardando material** | A nota está salva, mas a entrada dos produtos ainda não foi concluída. |
| **Aguardando financeiro** | As contas a pagar ainda não foram criadas ou conciliadas e marcadas como lançadas. |
| **Concluída** | Tanto o material quanto o financeiro foram lançados. |
| **Erro de fornecedor** | A importação por DFe não conseguiu resolver ou cadastrar corretamente o emitente; revise o cadastro antes de prosseguir. |

Os estados de material e financeiro são independentes: uma nota pode ter apenas um deles concluído.

## Exclusão e rastreabilidade

Uma nota só pode ser excluída enquanto não tiver efeitos posteriores. O backend bloqueia a exclusão quando:

- o material já foi lançado;
- o financeiro já foi lançado; ou
- existe qualquer patrimônio vinculado à nota.

Esses bloqueios preservam o vínculo entre documento fiscal, movimentações de estoque, bens seriados e contas a pagar. Se algum dado estiver incorreto após o lançamento, corrija a operação no módulo de destino em vez de tentar remover o documento de origem.

## Sequência recomendada

1. Importe o XML manualmente ou aguarde a sincronização DFe.
2. Se houver somente o resumo, registre a ciência e aguarde o XML completo.
3. Confira filial, fornecedor, número/série, valores e itens.
4. Concilie os itens e lance o material no almoxarifado correto.
5. Lance separadamente os patrimônios ou números de série aplicáveis.
6. Revise as duplicatas, crie ou concilie as contas a pagar e conclua o financeiro.
7. Confirme na listagem se os dois controles ficaram concluídos.

## Cuidados importantes

- Selecione a filial pelo CNPJ destinatário da NF-e; ela define a integração fiscal e o contexto dos lançamentos.
- Não repita uma sincronização durante o bloqueio indicado pela SEFAZ.
- A ciência da operação não pode ser desfeita.
- Confira o multiplicador de unidade antes de movimentar o estoque.
- Antes de repetir um lançamento financeiro interrompido, pesquise as contas já criadas.
- O upload ou a sincronização apenas cadastra a nota; estoque e financeiro exigem ações próprias.
