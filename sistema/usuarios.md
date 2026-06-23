---
title: Usuários
published: true
editor: markdown
description: ''
---

# Usuários

## Objetivo

Gerenciar usuários, permissões e vínculos operacionais no LHISP.

## Quando usar

Use esta tela para criar, editar ou revisar o cadastro de usuários do sistema.

## Pré-requisitos

- Acesso ao menu **Sistema > Usuários**.
- Permissão para visualizar ou editar usuários.

## Passo a passo

1. Acesse **Sistema > Usuários**.
2. Navegue entre as abas disponíveis:
   - **Dados do Usuário**
   - **Permissões**
   - **Horários**
   - **Filiais**
   - **Caixas**
   - **Contas Bancárias**
   - **Almoxarifados**
3. Clique em **Novo** para cadastrar um usuário.
4. Clique em **Editar** para alterar um registro existente.
5. Clique em **Salvar** para gravar mudanças.
6. Use **Procurar** para localizar usuários cadastrados.

## Campos importantes

| Campo | Descrição |
|---|---|
| **Nome** | Nome do usuário. |
| **Grupo de Atendimento** | Grupo associado ao usuário. |
| **Usuário** | Login do usuário. |
| **Senha** | Senha de acesso. |
| **Email** | Endereço de e-mail do usuário. |
| **Telefone** | Telefone de contato. |
| **Pode Acessar os Equipamentos de Rede** | Permissão para acessar equipamentos de rede. |
| **Grupo nos Mikrotiks** | Grupo de permissão para Mikrotik. |
| **Grupo nos Huaweis** | Grupo de permissão para Huawei. |
| **Grupo nos Cisco** | Grupo de permissão para Cisco. |
| **IPs** | Lista de IPs vinculados ao usuário. |

## Resultado esperado

- O usuário é cadastrado ou atualizado com sucesso.
- As permissões ficam refletidas nas abas e campos exibidos.

## Problemas comuns

| Problema | Como tratar |
|---|---|
| Botão **Salvar** desabilitado | Verifique se a tela está em modo de edição. |
| Campos bloqueados | Clique em **Editar** ou **Novo**. |
| Sem resultado em **Procurar** | Revise o filtro e o cadastro do usuário. |

## Observações

- A tela do demo abre em um iframe legado com as abas operacionais visíveis.
- O usuário exibido na captura é **SuporteLH**.
- O botão **Copiar Configurações de** fica no canto inferior direito da tela.

## Dúvidas para revisão

- Quais abas são obrigatórias para o cadastro mínimo?
- O botão **Copiar Configurações de** copia permissões, filiais ou ambos?
- Há validação específica para a lista de IPs?

## Screenshots sugeridos

- `assets/screenshots/sistema/usuarios.png` — captura limpa da tela de usuários no demo.

![Usuários no demo](/assets/screenshots/sistema/usuarios.png)
