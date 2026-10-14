---
title: LHChat
published: true
editor: markdown
description: Configure o serviço de conversas e use a visualização no painel.
---

# LHChat

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.

A integração habilita a visualização de conversas no painel do LHISP e guarda a URL e a credencial do serviço de atendimento. A janela de conversas usa chamadas próprias; **Abrir** na configuração apenas abre a URL informada em outra aba.

## Configurar o serviço

1. Abra **Sistema > Integrações > LHChat** com uma sessão administrativa.
2. Informe a **URL base** do serviço compatível.
3. Informe o **Token** aceito por esse serviço. Gerar um valor no campo não configura automaticamente a credencial no servidor externo.
4. Marque **Ativo**, clique em **Salvar** e reabra para conferir.
5. Teste a lista de conversas no painel, além do botão **Abrir**.

O formulário também exibe **Histórico de Eventos** da integração. Uma configuração salva registra dados locais; não prova que a URL responde ao contrato esperado nem que as conversas já estão acessíveis.

## Compatibilidade exigida

Use a URL base e a credencial fornecidas para a integração LHChat da sua instalação. Uma URL que apenas abre uma página de chat não garante acesso às consultas do painel. Confirme a compatibilidade com o suporte antes de apontar o cadastro para outro serviço de atendimento.

## Consultar no painel

Com a integração ativa, o painel oferece a janela flutuante do LHChat e a visualização separada em `/lhchat/standalone`. É possível minimizar/restaurar e alternar entre a lista e uma conversa.

A lista é consultada a cada **5 segundos** e ordenada pela mensagem mais recente. Ao abrir uma conversa, as mensagens são consultadas no mesmo intervalo e ordenadas da mais antiga para a mais recente. Sem texto, a interface informa o tipo de mensagem, como áudio, imagem ou documento.

A visualização mostra mensagens e identificação de cliente/bot/atendente; **não possui campo para redigir resposta**. Use a interface operacional do serviço de atendimento para as ações que ela disponibiliza.

## Diagnóstico

| Sintoma | Conferência |
|---|---|
| Janela não disponível | Integração ativa e leitura do cadastro na sessão. |
| Abrir funciona, mas lista falha | Confira URL base, token e compatibilidade da integração com o suporte. |
| Configurações do chatbot incompletas | URL e Token salvos; a integração precisa estar ativa. |
| Nenhuma conversa | Distinga retorno vazio de erro de consulta; confira o serviço e a empresa corretos. |
| Conversas aparecem sem atualização imediata | Aguarde a próxima consulta de cinco segundos e confira eventual erro da lista/conversa. |

O token é uma credencial de serviço compartilhada pela integração, não a senha individual do atendente. Não o publique em capturas ou chamados. Para conectar sistemas externos ao cadastro/financeiro do LHISP, veja a integração separada [API de Parceiros](/sistema/api-parceiros).
