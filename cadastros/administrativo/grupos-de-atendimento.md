---
title: Grupos de Atendimento
published: true
editor: markdown
description: Cadastre grupos e associe usuários para definir o recorte da fila de atendimento.
---

# Grupos de Atendimento

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.

Os grupos organizam o recebimento de protocolos pela [fila da Agenda técnica](/agenda-tecnica/agenda-tecnica). O usuário possui **um grupo de atendimento**; a atribuição não é uma lista de vários grupos.

A listagem em `/cadastros/administrativo/grupos_atendimento` pesquisa parte do nome, ordena alfabeticamente e pagina em grupos de dez. É necessário acesso ao cadastro ou à Agenda técnica; criar, editar e apagar exigem `grupo_atendimento_add`, `grupo_atendimento_edit` e `grupo_atendimento_del`, respectivamente.

## Criar e editar

1. Abra **Cadastros > Administrativo > Grupos de Atendimento**.
2. Cadastre um nome de até 100 caracteres e salve.
3. Reabra o grupo salvo para gerenciar seus usuários.
4. Em **Adicionar usuário ao grupo**, pesquise nome/e-mail e confirme pelo botão de adicionar.
5. Use a remoção na linha do usuário para deixá-lo sem grupo.

Nome é obrigatório e não pode duplicar outro grupo da empresa. O gerenciamento de usuários exige `grupo_atendimento_edit`, valida usuário e grupo na mesma empresa e registra a alteração no histórico administrativo.

Adicionar um usuário que estava em outro grupo **substitui** sua associação anterior. A alteração é salva pela própria ação, separadamente do salvamento do nome do grupo. Remover não apaga nem desativa o usuário.

## Efeito na fila

O próximo atendimento considera o grupo atual e as **Filiais Atendidas** do usuário. Usuário sem grupo recebe somente protocolos sem grupo. Um grupo atribuído não concede acesso a novas filiais e não substitui a configuração de filiais atendidas.

A fila consulta o cadastro atual para decidir o próximo protocolo, sem depender de novo login depois da troca de grupo. Mudar o grupo não transfere automaticamente protocolos já atribuídos: confira-os e use o fluxo de liberação/transferência quando necessário.

## Exclusão

A exclusão do grupo é lógica e exige confirmação. O método não redistribui usuários ou atendimentos vinculados. Antes de apagar um grupo em uso, reassocie usuários e confira protocolos pendentes para que a fila permaneça coerente.

Veja também [Agenda técnica](/agenda-tecnica/agenda-tecnica) e [Usuários](/sistema/usuarios).
