---
title: 'Mikrotik: Criando Usuário'
published: true
editor: markdown
description: Usuário de integração SSH do Mikrotik e vínculo com o cadastro do servidor.
---

# Mikrotik: Criando Usuário


## Objetivo

Registrar o procedimento para criar um usuário local no **Mikrotik** com permissões completas para integração com o LHISP.

A integração usa **SSH**, com usuário e senha cadastrados no [servidor](/rede-infra/servidores). A criação do usuário no Winbox não atualiza essas credenciais no LHISP.

## Quando usar

Use este fluxo quando for necessário:

- permitir que o sistema acesse um Mikrotik;
- criar um usuário administrativo no equipamento;
- ajustar credenciais para integração via Winbox/SSH;
- preparar o equipamento para automação e configuração remota.

## Pré-requisitos

- Acesso ao Mikrotik via **Winbox** ou console equivalente.
- Permissão administrativa para criar usuários.
- Nome do usuário desejado.
- Senha escolhida para o acesso.
- Acesso ao grupo **full** no equipamento.

## Passo a passo

1. Acesse o Mikrotik pelo **Winbox**.
2. Vá em **System > Users**.
3. Clique no botão **+** para abrir a tela de novo usuário.
4. Preencha o campo **name** com o nome desejado.
5. Selecione o grupo **full** no campo **group**.
6. Informe a senha no campo **password**.
7. Repita a senha em **Confirm Password**.
8. Clique em **OK** para criar o usuário.
9. No LHISP, abra o cadastro do servidor Mikrotik e informe o mesmo usuário e senha, o IP e a porta SSH configurados no equipamento. Salve.
10. Confira o status de comunicação e a execução de uma operação controlada antes de habilitar rotinas em lote.

O grupo **full** desta receita concede privilégios amplos. O código da integração não valida o nome do grupo: precisa de autorização para os comandos usados pelo ambiente. Uma política personalizada exige validar todas as rotinas necessárias; a revisão do código não estabelece uma lista mínima de permissões homologada para todas as versões do RouterOS.

## Campos importantes

| Campo | Descrição |
|---|---|
| **name** | Nome do usuário que será criado. |
| **group** | Grupo de permissões do RouterOS; esta receita usa **full**, com privilégios administrativos amplos. |
| **password** | Senha do novo usuário. |
| **Confirm Password** | Confirmação da senha informada. |

## Resultado esperado

- O usuário é criado com sucesso no Mikrotik.
- O sistema passa a ter um usuário com permissões totais para executar as configurações necessárias.
- As credenciais correspondem ao cadastro do servidor, e o SSH permite as operações verificadas.

## Problemas comuns

| Problema | Como tratar |
|---|---|
| O usuário não é criado | Verifique se a senha e a confirmação coincidem. |
| O sistema não consegue aplicar configurações | Verifique SSH, credenciais, porta e se as permissões do usuário autorizam o comando que falhou. |
| Acesso ao Winbox não está disponível | Verifique conectividade, credenciais e permissões administrativas. |

## Observações

- Restrinja o acesso de administração às origens autorizadas e use uma credencial exclusiva para a integração.
- Se houver servidor intermediário em **Conectar por**, confira também o encaminhamento descrito em [Servidores](/rede-infra/servidores).
- Os nomes e a disposição dos campos do Winbox dependem da versão; esta página não comprova compatibilidade de todos os firmwares.

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.
