---
title: CGNAT
published: true
editor: markdown
description: ''
---

# CGNAT

> **⚠️ Rascunho gerado por agente**
>
> Este documento foi elaborado a partir de exploração no ambiente de demonstração. A criação efetiva de regras e prefixos de CGNAT deve ser validada pela equipe técnica antes de publicação.

## Objetivo

Gerenciar os **prefixos CGNAT** vinculados ao servidor, além de consultar os endereços públicos/privados mapeados e seus filtros.

## Quando usar

Use este fluxo para:

- cadastrar um novo par de **prefixo público** e **prefixo privado**;
- consultar os mapeamentos já existentes;
- filtrar endereços por IP público ou por porta;
- verificar se há contratos associados aos mapeamentos.

## Pré-requisitos

- Acesso ao menu **Rede/ Infra**.
- Um servidor previamente selecionado.
- Permissão para editar o servidor.
- Prefixos válidos para uso no ambiente demo.

## Passo a passo

1. Acesse **Rede/ Infra** → **Servidores**.
2. Abra o servidor desejado.
3. Clique na aba **CGNAT**.
4. No bloco **Prefixos CGNAT**, preencha:
   - **Prefixo Público**
   - **Prefixo Privado**
5. Clique em **+ Adicionar**.
6. Valide se a nova linha aparece na grade de prefixos.
7. Use os filtros e opções da tela para localizar mapeamentos específicos.

## Campos importantes

### Prefixos CGNAT

| Campo | Descrição |
|---|---|
| **Prefixo Público** | Faixa pública usada no NAT. Na tela há exemplo de placeholder `200.10.10.0/24`. |
| **Prefixo Privado** | Faixa privada mapeada para o CGNAT. Na tela há exemplo de placeholder `100.64.0.0/17`. |
| **+ Adicionar** | Insere o novo par de prefixos na grade. |

### Grade de prefixos

| Coluna | Descrição |
|---|---|
| **ID** | Identificador do vínculo CGNAT. |
| **Prefixo Público** | Prefixo público cadastrado. |
| **Prefixo Privado** | Prefixo privado cadastrado. |
| **Portas CGNAT** | Faixa de portas reservada para o mapeamento. |
| **Ações** | Ações por linha, incluindo exclusão do vínculo. |

### Filtros e opções

| Campo | Descrição |
|---|---|
| **Filtrar Por Endereço Ip Público** | Busca mapeamentos por IP público. |
| **Filtrar Por Porta** | Busca mapeamentos por porta. |
| **Listar Somente com Contrato Associado ?** | Restringe a visualização aos mapeamentos com contrato vinculado. |
| **Ações** | Botões de atualização e impressão/exportação observados na tela. |

### Mapeamento observado no demo

| Campo | Valor observado |
|---|---|
| **Prefixo Público** | `200.200.200.0/29` |
| **Prefixo Privado** | `192.168.10.0/28` |
| **Portas CGNAT** | faixa exibida automaticamente na grade |

## Resultado esperado

- O vínculo CGNAT passa a aparecer na grade da aba **CGNAT**.
- Os endereços públicos/privados ficam disponíveis para consulta.
- A filtragem por IP público, porta e contrato associado funciona conforme a tela.

## Problemas comuns

| Problema | Como tratar |
|---|---|
| O botão **+ Adicionar** não grava | Verifique se **Prefixo Público** e **Prefixo Privado** foram preenchidos. |
| Aparece a mensagem **“Informe os prefixos público e privado”** | Um ou ambos os campos estão vazios. Preencha os dois antes de adicionar. |
| O mapeamento não aparece na grade | Confirme se o servidor correto está aberto e se o vínculo foi salvo. |
| Não encontro o contrato associado | Use o filtro de contrato associado e valide o vínculo na operação correspondente. |

## Observações

- Na exploração, a aba **CGNAT** mostrou uma grade com mapeamentos já existentes e uma seção de filtros abaixo.
- A mensagem de validação do sistema, quando os campos ficam vazios, é: **“Informe os prefixos público e privado”**.
- O sistema exibiu um vínculo já existente com **Prefixo Público** `200.200.200.0/29` e **Prefixo Privado** `192.168.10.0/28`.

## Dúvidas para revisão

- O botão **+ Adicionar** cria apenas o vínculo de prefixos ou também gera automaticamente as portas CGNAT?
- A faixa de portas exibida é calculada pelo sistema ou configurável manualmente?
- Há regra de exclusão/edição para vínculos já usados por contratos?
- O filtro **Listar Somente com Contrato Associado ?** altera somente a tabela inferior ou também a grade superior?
- Existe limite de quantidade de prefixos CGNAT por servidor?

## Screenshots sugeridos

- Aba **CGNAT** no demo: `assets/screenshots/rede-infra/cgnat.png`

![CGNAT no demo](/assets/screenshots/rede-infra/cgnat.png)
