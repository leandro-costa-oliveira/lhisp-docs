---
title: Reajuste de serviços contratados
published: true
editor: markdown
description: Simule e aplique reajustes em lote aos serviços contratados e, opcionalmente, ao plano e às mensalidades abertas.
---

# Reajuste de serviços contratados

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.

Esta rotina altera o valor cobrado nos serviços já contratados. O reajuste pode ser percentual ou um acréscimo fixo e pode, mediante confirmação, alcançar também o preço do plano e mensalidades em aberto ainda não remetidas ao banco.

O preço do plano e o preço do serviço contratado são dados distintos. Reajustar apenas o plano não corrige contratos existentes; reajustar apenas os serviços não muda o valor oferecido em novas contratações.

## Como a elegibilidade é calculada

Entram na consulta serviços em situação **ATIVO** ou **BLOQUEADO** que cumpram a carência informada. A data de referência é a mais recente entre:

- ativação do serviço;
- último reajuste;
- última renovação.

A carência é a quantidade de meses completos entre essa referência e a data atual. Os filtros opcionais restringem por filial, plano, categoria do contrato (**B2C** ou **B2B**) e tipo de pessoa.

## Simular

1. Selecione filial, plano, categoria e tipo de pessoa conforme a política aprovada.
2. Informe a **Carência** em meses. A consulta só é habilitada com valor maior que zero.
3. Informe o reajuste e use o botão **%/R$** para escolher:
   - **%**: `valor atual + (valor atual × percentual ÷ 100)`;
   - **R$**: `valor atual + acréscimo fixo`.
4. Clique em **Visualizar**.
5. Confira categoria, contrato, cliente, ativação, último reajuste, última renovação, referência, valor atual, valor do plano e valor calculado.
6. Percorra todas as páginas. A listagem mostra dez itens por página.

A prévia é recalculada no navegador e não grava alterações.

## Aplicar o reajuste

1. Mantenha os filtros usados na conferência e clique em **Reajustar**.
2. No modal, confirme se deseja **Reajustar Plano**.
3. Confirme se deseja **Reajustar Contas a Receber**.
4. Revise novamente o tipo e o valor destacados no modal.
5. Clique em **Reajustar** e aguarde a conclusão.

As duas respostas do modal são obrigatórias, inclusive quando forem **Não**.

### Reajustar plano

Disponível somente quando um plano foi selecionado. Altera o valor cadastral desse plano uma vez, antes de processar os serviços. A alteração é registrada no log do sistema.

### Reajustar serviços contratados

Sempre ocorre para todos os serviços considerados elegíveis na execução. O sistema atualiza o valor e a data do último reajuste, adiciona histórico e dispara a notificação de reajuste configurada para o contrato.

### Reajustar contas a receber

Quando habilitado, alcança apenas contas que atendam simultaneamente a estes critérios:

- pertencem ao serviço reajustado e ao plano filtrado;
- são mensalidades;
- estão em aberto;
- ainda não foram enviadas em remessa bancária.

Contas pagas, canceladas, negociadas, de outro tipo ou já remetidas permanecem inalteradas. Compare os títulos futuros na Gerência Financeira depois do lote.

## Limitações atuais

### Categoria não é preservada na execução

O filtro **Categoria** é enviado à prévia, mas a interface atual não o envia ao confirmar o reajuste. A execução pode, portanto, alcançar serviços B2C e B2B que atendam aos demais filtros, mesmo que a prévia tenha mostrado apenas uma categoria.

Não execute um lote cuja separação dependa somente desse filtro. Combine-o com plano, filial e tipo de pessoa ou faça o tratamento por outro fluxo até a correção da interface.

### Lote pode terminar parcialmente aplicado

Plano, serviços e contas são salvos em operações sucessivas, sem uma transação única envolvendo todo o lote. Se ocorrer erro após parte do processamento, as alterações anteriores podem permanecer. Antes de repetir, refaça a visualização e confira plano, históricos e títulos para evitar um segundo reajuste.

### Auditoria de acréscimo fixo

O cálculo em reais é aplicado corretamente, mas os textos atuais de histórico/log usam a expressão “reajuste percentual” também para o tipo fixo. Use valores anterior e novo para interpretar a auditoria.

## Cuidados

- Se for reajustar mensalidades existentes, selecione explicitamente o plano e confira se nenhuma delas já foi remetida.
- Valores percentuais são arredondados para duas casas decimais.
- O acréscimo fixo incide por serviço e por conta elegível, não sobre o total do contrato.
- Gere uma listagem final e confronte amostras de cada filial antes de comunicar os clientes.
- Não repita a operação apenas porque a tela perdeu os filtros após o sucesso; o primeiro lote pode já ter sido aplicado.

## Diagnóstico

| Situação | Verificação |
|---|---|
| A prévia não carrega | A carência precisa ser maior que zero e **Visualizar** deve ser acionado. |
| Serviço esperado não aparece | Confira situação, data de referência, carência e filtros de plano, filial, categoria e pessoa. |
| Plano não mudou | **Reajustar Plano** exige resposta **Sim** e um plano selecionado. |
| Mensalidade não mudou | Ela deve estar aberta, ser mensalidade, pertencer ao plano e não ter remessa. |
| Resultado alcançou outra categoria | É a limitação atual do modal; suspenda novos lotes e audite os históricos. |
| Operação retornou erro | Considere possível aplicação parcial; confira os dados antes de tentar novamente. |

![Tela Reajuste de serviços contratados](/assets/screenshots/financeiro/reajuste-servicos-contratados.png)
