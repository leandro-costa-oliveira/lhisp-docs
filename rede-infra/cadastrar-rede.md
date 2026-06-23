---
title: Cadastrar rede
published: true
editor: markdown
description: ''
---

# Cadastrar rede

> **⚠️ Rascunho gerado por agente**
>
> Este documento foi elaborado a partir de exploração no ambiente de demonstração. A criação efetiva de redes deve ser validada pela equipe técnica antes de publicação.

## Objetivo

Cadastrar uma nova **rede** no módulo **Rede/Infra** do LHISP.

## Quando usar

Use este fluxo para registrar redes de acesso, redes administrativas/backbone e suas parametrizações de acesso por tecnologia.

## Pré-requisitos

- Acesso ao menu **Rede/ Infra**.
- Permissão para criar/editar redes.
- Dados da rede disponíveis: descrição, servidor, prefixo IPv4/IPv6, tecnologia e parâmetros específicos.
- Usar apenas dados fictícios no ambiente demo.

## Passo a passo

1. Acesse o menu lateral e abra **Rede/ Infra**.
2. Clique em **Redes**.
3. Clique em **Novo** para abrir o formulário em modo de criação.
4. Preencha os campos principais:
   - **Tipo** da rede
   - **Limitar Quantidade de Acessos**
   - **Setor**
   - **Descrição**
   - **Servidor**
   - **Interface**
   - **Prefixo IPv4**
   - **Prefixo IPv6**
   - **Tecnologia**
5. Selecione a tecnologia correta e complete os campos adicionais exibidos para o cenário.
6. Marque **Nat** e **Exigir Pop** quando aplicável.
7. Clique em **Salvar**.
8. Valide se a rede passou a aparecer na lista e se os vínculos com servidor/prefixos foram gravados.

## Campos importantes

### Identificação da rede

| Campo | Descrição |
|---|---|
| **Tipo** | Define se a rede é de **Acesso** ou **Administrativa/Backbone**. |
| **Limitar Quantidade de Acessos** | Limite numérico de acessos permitido na rede. |
| **Setor** | Setor vinculado à rede. |
| **Descrição** | Nome/descrição da rede. |
| **Servidor** | Servidor associado à rede. Possui botão de busca. |
| **Interface** | Interface de vínculo na rede. |
| **Prefixo IPv4** | Prefixo IPv4 associado à rede. |
| **Prefixo IPv6** | Prefixo IPv6 associado à rede. |

### Tecnologia

| Opção | Descrição |
|---|---|
| **Wireless** | Rede de acesso sem fio. |
| **GePON** | Rede óptica com configuração GePON. |
| **GePON - Auth Mac** | Variante GePON com autenticação por MAC. |
| **GPON** | Rede óptica GPON. |
| **Cabo UTP / Outros** | Rede cabeada ou cenário genérico/outros. |

### Campos específicos observados na tela

| Campo | Descrição |
|---|---|
| **Rede:** | Campo de configuração específico do perfil da rede. |
| **Máscara:** | Máscara de rede. |
| **Ponto de Acesso:** | Vínculo para redes wireless. |
| **GePON OLT:** | OLT usada no cenário GePON. |
| **Placa OLT:** | Placa da OLT. |
| **Porta PON:** | Porta PON utilizada. |
| **GPON OLT:** | OLT usada no cenário GPON. |
| **Porta UPLINK:** | Porta uplink no cenário GPON. |
| **Vlan:** | VLAN associada à rede. |

### Opções

| Campo | Descrição |
|---|---|
| **Nat** | Indica uso de NAT na rede. |
| **Exigir Pop** | Exige POP para a rede. |

## Resultado esperado

- A rede fica cadastrada no módulo **Rede/Infra**.
- O registro passa a ser usado em vínculos com servidores e liberações de clientes.
- As configurações específicas da tecnologia ficam disponíveis para operação.

## Problemas comuns

| Problema | Como tratar |
|---|---|
| O botão **Salvar** não grava | Revise **Descrição**, **Servidor**, **Prefixo IPv4/IPv6** e a tecnologia escolhida. |
| O servidor não aparece no campo de busca | Confirme se o servidor já foi cadastrado e está ativo. |
| A rede não aparece na lista | Verifique se o registro foi salvo e se a lista foi atualizada. |
| Campos de tecnologia não aparecem | Confirme se a tecnologia correta foi selecionada. |
| O cadastro não fecha corretamente | Use **Cancelar** e reabra o registro para validar o estado. |

## Observações

- Na exploração, o formulário ficou disponível em modo de criação com os botões **Salvar** e **Cancelar** no topo.
- A aba da tela possui apenas **Dados** e **Detalhes**.
- Os campos e opções mudam conforme a tecnologia escolhida.
- Foi observada a ação **Transferir Acessos**, que indica integração da rede com migração/liberação de clientes.

## Dúvidas para revisão

- Quais campos são obrigatórios além de **Descrição** e **Servidor**?
- O campo **Tipo** muda regras de validação ou exibição de outros campos?
- Em quais cenários **Nat** e **Exigir Pop** devem ser marcados?
- Como funciona a ação **Transferir Acessos**?
- O que exatamente deve ser preenchido em **Rede:** e **Máscara:** em cada tecnologia?

## Screenshots sugeridos

- Formulário de cadastro de rede: `assets/screenshots/rede-infra/cadastrar-rede-form.png`

![Cadastro de rede](/assets/screenshots/rede-infra/cadastrar-rede-form.png)
