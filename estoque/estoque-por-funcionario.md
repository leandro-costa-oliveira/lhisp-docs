---
title: Estoque por funcionário
published: true
editor: markdown
description: Controle materiais e patrimônios sob responsabilidade de técnicos e outros funcionários.
---

# Estoque por funcionário

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.

O estoque do funcionário representa materiais que saíram do almoxarifado, mas ainda permanecem sob responsabilidade da empresa e da pessoa que os recebeu. É usado principalmente para técnicos levarem insumos e equipamentos a campo sem registrá-los prematuramente como consumidos ou locados a um cliente.

O saldo é mantido por funcionário e produto. Patrimônios acrescentam a identificação individual do equipamento; por isso, a quantidade de um item controlado deve corresponder aos patrimônios atualmente vinculados ao estoque daquela pessoa.

## Como o material chega e sai

O fluxo normal é:

1. uma ordem de separação reserva produtos de um almoxarifado para o funcionário;
2. a confirmação retira o saldo da origem e adiciona ao estoque do funcionário;
3. patrimônios selecionados deixam o estoque físico e passam à posse do funcionário;
4. uma OS pode consumir o material e criar a locação no contrato;
5. itens não utilizados podem ser devolvidos a um almoxarifado.

Essas etapas gravam histórico. Para estoque patrimonial, também atualizam a localização exclusiva do equipamento. Consulte [Ordens de separação](/estoque/ordens-de-separacao), [Material para técnico](/estoque/material-para-tecnico) e [Agenda Técnica](/agenda-tecnica/agenda-tecnica).

## Consultar saldo e histórico

1. Acesse **Estoque > Estoque por funcionário**.
2. Selecione a pessoa marcada como funcionário.
3. Filtre por categoria ou produto, se necessário.
4. Atualize para visualizar somente saldos maiores que zero.
5. Abra **Histórico** para conferir entradas e saídas no período.

O filtro da categoria pode incluir somente a categoria selecionada ou excluir essa categoria. A pesquisa principal de produto procura pelo início do nome. A impressão reproduz o resumo carregado.

O histórico identifica data, usuário, produto, quantidade e descrição. Quando a movimentação pertence a uma OS, a tela substitui a descrição genérica por **Utilizado no contrato** ou **Retirado do contrato**, com o número do contrato. Isso permite conciliar o material levado a campo com a execução registrada.

## Devolver ao almoxarifado

1. Abra **Devolução** no estoque do funcionário.
2. Selecione o almoxarifado de destino.
3. Para cada produto comum, informe a quantidade a devolver.
4. Para produto patrimonial, marque cada número de série.
5. Escolha o local interno de destino para todo item com devolução.
6. Confirme e revise os dois estoques e seus históricos.

A devolução é transacional para os itens processados: reduz o estoque do funcionário, aumenta o saldo no almoxarifado e grava o histórico de devolução. Patrimônios são reassociados ao estoque de destino e deixam a posse do funcionário.

Em produto patrimonial, a quantidade é derivada dos equipamentos marcados e deve coincidir com a lista de IDs. O backend valida que os patrimônios pertencem ao produto antes de movê-los.

A interface oferece somente patrimônios vinculados aos estoques do funcionário. A validação atual da API de devolução, porém, não confirma novamente essa posse ao receber os IDs; ela confirma o produto. Integrações devem enviar exclusivamente os IDs obtidos para aquela pessoa, e o operador deve revisar as séries exibidas.

O backend atual ignora, sem mensagem específica, uma linha cuja quantidade seja inválida ou superior ao saldo do funcionário. A interface limita o valor normalmente, mas integrações podem enviar dados inconsistentes. Sempre confira o saldo após a operação; não considere a mensagem geral de sucesso como prova de que todas as linhas foram devolvidas.

## Consumo em ordem de serviço

Ao concluir uma OS com materiais, o sistema exige que o produto e os patrimônios estejam com o técnico e que haja saldo suficiente. O material comum é baixado da pessoa e locado no contrato. Para produto patrimonial, cada equipamento selecionado é retirado do estoque do funcionário e movido para a locação do cliente.

Uma baixa incorreta afeta simultaneamente responsabilidade do técnico, saldo, locação e contrato. Corrija pelo fluxo operacional correspondente; não compense com uma entrada avulsa desconectada da OS.

## Cuidados

- Material entregue diretamente ao técnico deve passar por ordem de separação para manter origem e autorização.
- A devolução deve ir para o almoxarifado e local físicos onde o item foi realmente recebido.
- Não altere o produto de um patrimônio enquanto ele estiver no estoque de funcionário; o backend bloqueia essa mudança.
- Antes de inativar um funcionário, confira e zere seu estoque por devolução ou consumo regular.

| Problema | Verificação |
|---|---|
| Funcionário não aparece | A pessoa precisa estar marcada como funcionário e visível nas filiais permitidas ao usuário. |
| Material não aparece | A tela mostra somente quantidade positiva; revise filtros e histórico. |
| Patrimônio não pode ser devolvido | Confirme que ele está vinculado ao estoque desse funcionário e ao produto exibido. |
| Devolução terminou, mas um item permaneceu | A quantidade inválida ou acima do saldo pode ter sido ignorada; confira o histórico e repita com o valor correto. |
| OS recusa o produto | O técnico precisa possuir saldo e, para item controlado, os patrimônios exatos. |
| Saldo do funcionário diverge dos equipamentos | Compare o histórico e o Controle patrimonial antes de novas movimentações. |

![Estoque por funcionário](/assets/screenshots/estoque/estoque-por-funcionario.png)
