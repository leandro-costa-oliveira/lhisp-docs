---
title: Usuários
published: true
editor: markdown
description: Cadastro de operadores, permissões, filiais visíveis e atendidas e vínculos de caixas, bancos e almoxarifados.
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
   - **Filiais Atendidas**
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

## Permissões e vínculos não são equivalentes

| Configuração | Alcance |
|---|---|
| **Menus** | Define opções disponibilizadas na navegação. Ver um menu não substitui a permissão da operação no servidor. |
| **Permissões** | Autoriza operações específicas; consulta, cadastro, alteração e exclusão podem exigir permissões diferentes. |
| **Filiais** | Define o recorte de filiais visíveis conforme a consulta/DAO e o perfil. |
| **Filiais Atendidas** | Define elegibilidade para receber protocolos da fila; é independente de apenas visualizar a filial. |
| **Grupo de Atendimento** | Restringe a distribuição da fila. Usuário sem grupo recebe protocolos sem grupo. |
| **Caixas e Contas Bancárias** | Restringem recursos financeiros conforme a operação; não são substituídos pela simples seleção de filial. |
| **Almoxarifados** | Vinculam os locais de estoque acessíveis pelo usuário conforme as regras do fluxo. |

Os perfis administrativo, administrador de filial e master não devem ser tratados como sinônimos. Os caminhos PHP e Node aplicam essas condições em pontos próprios; uma permissão administrativa em uma operação não comprova acesso global às demais filiais. Confira a operação específica com o usuário e contexto corretos.

Nos checadores genéricos de permissão PHP e Node, esses perfis dispensam a permissão nominal da ação. Filtros de dados, vínculos de recursos e verificações que exigem especificamente administrador ou master podem continuar sendo aplicados por outros trechos. Esse atalho de permissão não substitui a revisão do escopo de leitura/escrita.

Para diagnosticar acesso negado, registre usuário, empresa/filial atual, ação tentada e recurso envolvido. Confira menu, permissão e vínculos antes de ampliar o perfil inteiro. Para login, autenticador e passkeys, consulte [Segurança da conta](/sistema/seguranca-da-conta).

## Copiar configurações

**Copiar Configurações de** aplica ao usuário de destino as **permissões, menus e filiais** do usuário de origem. A ação exige perfil aceito como administrador de filial pelo backend.

Essa implementação não copia todos os dados do cadastro: filiais atendidas, caixas, contas bancárias, almoxarifados, horários e credenciais não fazem parte dessa cópia. Revise esses vínculos separadamente e confirme o resultado no destino.

## Credencial de equipamentos

A senha de acesso aos equipamentos é diferente da senha de login no painel. O cadastro atual grava essa credencial cifrada e exige chave própria do tenant; ausência da chave impede a gravação. Não reutilize a senha do painel como indicação de que o acesso RADIUS administrativo está configurado.

## Problemas comuns

| Problema | Como tratar |
|---|---|
| Botão **Salvar** desabilitado | Verifique se a tela está em modo de edição. |
| Campos bloqueados | Clique em **Editar** ou **Novo**. |
| Sem resultado em **Procurar** | Revise o filtro e o cadastro do usuário. |

## Observações

- A tela do demo abre com as abas operacionais visíveis.
- O usuário exibido na captura é **SuporteLH**.
- O botão **Copiar Configurações de** fica no canto inferior direito da tela.


## Screenshots sugeridos

- `assets/screenshots/sistema/usuarios.png` — captura limpa da tela de usuários no demo.

![Usuários no demo](/assets/screenshots/sistema/usuarios.png)

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.
