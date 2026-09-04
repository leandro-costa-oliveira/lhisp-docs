---
title: Condomínios
published: true
editor: markdown
description: Identifique empreendimentos dentro de um logradouro e associe-os aos endereços de instalação e cobrança dos contratos.
---

# Condomínios

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.

Um condomínio complementa o cadastro de endereço. Enquanto **Endereço** guarda UF, cidade, bairro, logradouro e CEP reutilizáveis, o condomínio identifica um empreendimento naquele logradouro por **Nome** e **Número**.

Nos contratos, ele pode ser associado separadamente ao endereço de instalação e ao endereço de cobrança. Essa estrutura evita cadastrar o mesmo logradouro para cada cliente e permite distinguir edifícios ou conjuntos atendidos na mesma via. A ordem de serviço impressa também consulta o condomínio do endereço de instalação.

## Regras do cadastro

- **Logradouro**, **Número** e **Nome** são obrigatórios.
- O logradouro precisa existir em **Cadastros > Administrativo > Endereços**. Ele pode ser pesquisado ou criado sem sair do fluxo.
- O nome é convertido para maiúsculas ao salvar.
- Não podem existir dois condomínios com o mesmo nome na empresa. A validação ignora acentos; por isso, mudar apenas acentuação ou capitalização não cria um registro distinto.
- A pesquisa de condomínio dentro do contrato é filtrada pelo endereço selecionado. Escolha primeiro o logradouro correto.

## Cadastrar ou alterar

1. Acesse **Cadastros > Administrativo > Condomínios**.
2. Clique em **Novo** ou localize um cadastro existente.
3. Use a pesquisa de endereço. Se o logradouro ainda não existir, use **Cadastrar Endereço** e conclua UF, cidade, bairro, rua e CEP.
4. Informe o número do empreendimento e seu nome oficial.
5. Salve e confirme o endereço completo exibido.

Inclusão e alteração exigem, respectivamente, as permissões `condominio_add` e `condominio_edit`.

## Uso no contrato

Na edição do contrato, as seções **Endereço da instalação** e **Endereço de cobrança** possuem campos próprios de condomínio. Selecionar um condomínio não substitui número, complemento ou ponto de referência do cliente; esses dados continuam pertencendo ao contrato.

Se um condomínio não aparecer na pesquisa:

1. confira se o endereço da seção já foi selecionado;
2. confirme se o condomínio está vinculado exatamente a esse endereço;
3. pesquise pelo nome cadastrado, considerando que ele é armazenado em maiúsculas.

Alterar endereço, nome ou número do cadastro afeta a identificação reutilizada pelos contratos que apontam para ele. Antes de editar um registro existente, confirme se a mudança é uma correção compartilhada ou se representa outro empreendimento.

## Limitação da exclusão

A interface genérica apresenta **Apagar**, mas a ação específica de condomínio no backend atual implementa apenas cadastro e alteração. Não considere a remoção concluída sem confirmação explícita do sistema e sem verificar os contratos vinculados.

![Condomínios no demo](/assets/screenshots/cadastros/administrativo/condominios.png)
