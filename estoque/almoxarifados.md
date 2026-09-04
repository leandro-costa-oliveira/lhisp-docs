---
title: Almoxarifados
published: true
editor: markdown
description: Organize os locais físicos de estoque e acompanhe saldos, movimentações e patrimônios.
---

# Almoxarifados

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.

O almoxarifado representa uma unidade física ou lógica onde a empresa mantém produtos antes de transferi-los, vendê-los ou alocá-los a clientes e técnicos. Ele é a origem dos saldos usados por compras, notas fiscais de compra, ordens de separação, remessas, vendas, locações e ordens de serviço.

O saldo não é apenas informativo. As rotinas operacionais verificam disponibilidade no almoxarifado e podem impedir saídas, transferências e baixas quando a quantidade ou o patrimônio já não está no local indicado.

## Cadastro e locais internos

No cadastro de almoxarifados, defina um nome único e, na interface legada, a filial responsável. As permissões são `almoxarifado_add`, `almoxarifado_edit` e `almoxarifado_del`.

Um almoxarifado pode ser dividido em **locais**, identificados por código e descrição, como corredor, estante e prateleira. O saldo é mantido pela combinação de almoxarifado, local e produto. Assim, o mesmo produto pode aparecer em mais de uma linha quando está distribuído em endereçamentos diferentes.

Na API atual, código ou descrição de local repetidos na empresa são recusados. Ao editar pela tela legada, retirar um local da grade solicita sua remoção no salvamento; não faça isso enquanto houver estoque associado.

## Acesso por usuário

Usuários comuns veem somente os almoxarifados aos quais foram associados. Administradores e usuários master não recebem essa restrição na consulta da API. Esse vínculo limita as opções exibidas em seletores de estoque, ordens de separação e outras operações.

Conceder acesso ao almoxarifado não substitui permissões de ação. Por exemplo, a movimentação avulsa exige `estoque_add_mov`.

## Consultar o estoque

1. Acesse **Almoxarifados** e selecione a unidade.
2. Restrinja por local, categoria ou nome do produto quando necessário.
3. Marque **Exibir estoques sem quantidade** para incluir linhas zeradas.
4. Atualize a listagem.
5. Abra **Detalhes** para consultar o histórico do item no período.

A grade apresenta produto, categoria, endereçamento, estoque mínimo e quantidade. O estoque mínimo vem do cadastro do produto: saldo abaixo do mínimo recebe destaque de alerta; saldo igual ao mínimo recebe aviso. Isso apoia reposição, mas não cria compra automaticamente.

O histórico é a fonte para reconciliar o saldo. Movimentações guardam tipo, quantidade, descrição e, conforme a origem, referências a compra, nota fiscal, OS, venda, locação, ordem de separação ou remessa.

## Movimentação avulsa

Use movimentação avulsa somente para ajustes operacionais que não pertençam a um fluxo mais específico. Entradas e saídas exigem descrição; transferência exige almoxarifado de destino. A quantidade precisa ser maior que zero e uma saída não pode exceder o saldo.

A transferência registra uma saída na origem e uma entrada no destino, vinculadas entre si. Para mudar apenas o endereçamento dentro do mesmo almoxarifado, use **Alterar local do produto**; origem e destino não podem ser o mesmo local.

Prefira as rotinas próprias quando houver documento ou processo de origem:

- **Nota fiscal de compra/entrada de material** para recebimento de fornecedor;
- **Ordem de separação** para entrega a técnico ou transferência planejada;
- **Remessa de material** para trânsito entre almoxarifados;
- **Venda ou locação** para saída destinada a contrato;
- **Devolução/recolhimento** para retorno de material de técnico ou cliente.

Isso preserva a referência que explica por que o saldo mudou.

## Produtos com controle patrimonial

Produtos patrimoniais ou que exigem número de série não aceitam movimentação manual por quantidade. A entrada deve ocorrer pela leitura/cadastro dos identificadores, e saída ou transferência precisa indicar os patrimônios exatos.

Cada patrimônio possui localização exclusiva. Ao sair para venda, locação, técnico ou outro estoque, seus vínculos são atualizados junto com o saldo. O sistema revalida a disponibilidade no momento da confirmação para evitar que o mesmo equipamento seja utilizado em duas operações.

Transferências entre locais são atômicas: o sistema valida que todos os patrimônios pertencem ao produto e ao estoque de origem, registra saída e entrada e só então os associa ao destino.

## Ajuste direto e exclusão

O ajuste direto de quantidade aparece somente para usuário master. Ele define o saldo informado e não pode ser usado em produto patrimonial, cuja quantidade é determinada pelos equipamentos cadastrados. Antes do ajuste, reconcilie o histórico; o recurso não deve substituir a correção do processo que gerou a divergência.

A exclusão do almoxarifado é lógica na API atual. Não exclua uma unidade com saldo, locais, usuários, ordens ou histórico associados. Transfira os materiais e encerre processos pendentes primeiro, pois apagar o cadastro não movimenta nem regulariza seus itens.

| Problema | Verificação |
|---|---|
| Almoxarifado não aparece | Confira o vínculo do usuário com a unidade e as permissões do menu. |
| Produto aparece mais de uma vez | Verifique os locais; cada endereçamento mantém saldo próprio. |
| Saída é recusada | O saldo disponível no local é menor que a quantidade solicitada. |
| Movimentação manual é bloqueada | O produto usa patrimônio ou número de série; selecione os equipamentos no fluxo apropriado. |
| Saldo diverge do esperado | Consulte o histórico e as referências de compra, separação, remessa, OS, venda e locação. |
| Transferência de local falha | O local deve pertencer ao mesmo almoxarifado e ser diferente da origem; patrimônios devem estar no estoque selecionado. |

![Controle de almoxarifados](/assets/screenshots/almoxarifados/almoxarifados.png)
