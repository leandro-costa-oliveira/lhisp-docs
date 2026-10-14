---
title: PABX Megatelecom
published: true
editor: markdown
description: Cadastre a credencial copiada para o servidor VoIP MegaTelecom e conheça o limite atual do provisionamento.
---

# PABX Megatelecom

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.

A tela **Sistema > Integrações > Pabx Mega Telecom** mantém **Usuário**, **Token** e a indicação **Ativo**. Ao salvar, o backend cria ou atualiza um servidor VoIP do tipo **MegaTelecom**, copiando Usuário para o usuário do servidor e Token para sua senha.

**O cadastro não equivale a uma integração de telefonia concluída.** Na versão revisada, o salvamento de contrato VoIP com esse tipo de servidor retorna **MegaTelecom Não Implementado**. Não há confirmação de criação de ramais, números, portabilidade ou chamadas apenas pelo sucesso desta configuração.

## Manter a configuração

1. Abra a integração com uma sessão administrativa.
2. Informe o usuário e token fornecidos para o parceiro.
3. Ajuste **Ativo** e clique em **Salvar**.
4. Reabra a tela e confira o estado persistido.
5. Confira também o servidor VoIP correspondente antes de alterar qualquer contrato que o utilize.

O primeiro cadastro da integração usa uma rotina compartilhada que inicia a integração ativa. Se a intenção for mantê-la desativada, confira depois da criação e salve novamente com **Ativo** desmarcado.

## Efeitos e limites

- Salvar substitui as credenciais no servidor VoIP MegaTelecom encontrado para a empresa; cria **Pabx Megatelecom** quando ele ainda não existe.
- Esse passo ocorre também quando a configuração é salva como inativa. Desmarcar Ativo não apaga o servidor nem limpa sua senha.
- A tela não possui seleção de ambiente, URL da API, botão de teste ou histórico de eventos próprio.
- O daemon VoIP possui leitura de saldo e registros locais para esse tipo de servidor. Isso não demonstra consulta em tempo real ou provisionamento externo na MegaTelecom.

## Conferência operacional

Se o formulário salvar, mas a contratação VoIP falhar com **MegaTelecom Não Implementado**, trata-se do limite implementado do fluxo. Repetir o cadastro ou trocar o token não implementa o provisionamento ausente.

Se usuário/token aparecerem vazios para outro perfil, confira o acesso administrativo: a leitura das integrações omite configurações para usuários que não são admin/master. Evite salvar campos vazios sobre credenciais existentes.

Antes de colocar novos serviços nesse servidor, a operação precisa confirmar qual processo externo/manual atende a telefonia. Para um provedor VoIP diferente, use apenas a integração correspondente já configurada, sem trocar o tipo de um servidor que possui contratos para contornar a mensagem.
