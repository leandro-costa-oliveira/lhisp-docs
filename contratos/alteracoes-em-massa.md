---
title: Alterações em massa nos contratos
published: true
editor: markdown
description: Habilite ou desabilite a preferência de envio de SMS e consulte o histórico administrativo da operação.
---

# Alterações em massa nos contratos

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.

A tela **Alterações em massa nos contratos** está disponível em `/contratos/alteracoes-em-massa` para usuários administradores. Atualmente, sua ação é habilitar ou desabilitar a preferência de SMS nas posições de telefone **1 a 4** das pessoas vinculadas a contratos.

## Alcance da alteração

A operação alcança pessoas da empresa atual que possuem pelo menos um contrato não apagado. Não existe filtro por filial, situação, plano ou pela pesquisa feita na listagem de contratos. Contratos cancelados também podem manter a pessoa dentro desse conjunto.

A preferência pertence à **pessoa**: vários contratos do mesmo titular não geram alterações independentes para cada contrato. As posições não selecionadas preservam sua configuração.

Habilitar SMS altera os indicadores de envio; não envia mensagens naquele momento, não preenche números de telefone e não comprova que o número é válido. A quantidade exibida representa cadastros de pessoas alterados, não mensagens nem contratos.

## Executar

1. Abra a tela com um usuário administrador.
2. Selecione uma ou mais posições de telefone.
3. Clique em **Habilitar SMS** ou **Desabilitar SMS**.
4. Confira na confirmação as posições e a ação escolhidas.
5. Confirme e aguarde o total de cadastros atualizado.

Os indicadores selecionados são gravados junto com o registro de auditoria em uma transação. Não há prévia individual dos titulares nem botão para restaurar a configuração anterior de cada pessoa. Executar a ação oposta aplica uma nova configuração ao conjunto inteiro, inclusive a quem já tinha uma preferência diferente antes da primeira operação.

## Histórico

Use **Ver histórico** para abrir `/contratos/alteracoes-em-massa/historico`. A consulta permite combinar período, ação e parte do nome do usuário. Mostra data/hora, responsável, posições de telefone e quantidade de cadastros alterados, com 50 operações por página e as mais recentes primeiro.

O histórico registra o resumo da ação, sem uma lista dos valores anteriores por pessoa. Se a tela informar que a consulta está limitada aos registros retornados pelo servidor, o total corresponde somente à resposta disponível nessa versão do servidor.

| Situação | Verificação |
|---|---|
| A tela volta para Contratos | O usuário precisa estar marcado como administrador. |
| Botões indisponíveis | Selecione pelo menos um telefone e aguarde a operação em andamento. |
| Total menor que o número de contratos | A contagem é de pessoas alteradas; titulares repetidos e configurações que já estavam no estado escolhido não aumentam o total. |
| Alteração atingiu outras filiais | A operação usa a empresa inteira e não recebe filtro por filial. |

Veja também [Contratos](/contratos/contrato) e [Pessoas](/cadastros/pessoas).
