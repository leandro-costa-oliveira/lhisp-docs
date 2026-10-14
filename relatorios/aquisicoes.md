---
title: Aquisições
published: true
editor: markdown
description: Acompanhe o estado atual dos serviços que tiveram evento de cadastro no período.
---

# Aquisições

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.

O relatório `/relatorios/clientes/aquisicoes` seleciona históricos de serviço com situação **Cadastro** no período e os classifica pela **situação atual do serviço**. A data selecionada é a do evento de cadastro, não a ativação, a venda ou a instalação.

## Consultar

Abra a tela com sessão e acesso ao relatório/Contratos. Selecione **Período** e **Filial**; o período começa no mês atual. Os filtros mudam a consulta quando alterados. A API restringe os históricos aos contratos/filiais permitidos ao usuário.

Cada histórico de cadastro ocupa uma linha. O código não deduplica serviços ou contratos: mais de um evento Cadastro para o mesmo serviço aumenta o total. A mesma pessoa pode aparecer por vários contratos e serviços.

## Classificação

| Grupo | Situação atual do serviço |
|---|---|
| **Pendentes** | Pendente. |
| **Convertidos** | Ativo. |
| **Desistências** | Desativado. |
| **Cancelados** | Cancelado. |
| **Outros** | Demais situações, incluindo bloqueado e suspenso. |

Um serviço ativo depois bloqueado passa de Convertidos para Outros em uma nova consulta do mesmo período. Portanto, o resultado não é uma fotografia histórica da conversão ao fim daquele mês.

## Gráficos, valores e saída

O primeiro gráfico distribui os eventos por grupo. Sem filial selecionada, há também gráfico empilhado por filial. Os grupos só classificam registros cujo serviço e filial relacionados estão disponíveis; a contagem geral de históricos pode diferir se algum relacionamento estiver ausente.

A grade mostra filial, contrato, cliente, plano, telefone, data de aquisição/cadastro e situação atual. O rodapé apresenta totais e médias dos **valores atuais dos serviços** por grupo. Não soma pagamentos, não aplica uma fotografia de preço da época e não multiplica automaticamente o valor pela quantidade contratada.

**Imprimir** usa a saída do navegador. Não existe CSV ou alteração comercial nessa tela. O botão **Atualizar** não força nova consulta; recarregue a página para conferir alterações feitas em outra aba.

As datas são enviadas sem expansão explícita para o fim do último dia; confira eventos com horário nas bordas do intervalo. Para eventos de entrada/saída efetivamente ocorridos no período, consulte [Ativações / Cancelamentos](/relatorios/ativacoes-cancelamentos).
