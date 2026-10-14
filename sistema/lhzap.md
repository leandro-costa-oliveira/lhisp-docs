---
title: LH-Zap
published: true
editor: markdown
description: Mantenha instâncias e confira a conexão e os limites de sincronização e envio.
---

# LH-Zap

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.

O cadastro **Sistema > Integrações > LH-Zap** mantém uma lista de instâncias com **Nome, URL, Token e Ativo**. Essa tela não cria uma sessão WhatsApp confirmada nem oferece envio de teste ou QR Code de conexão.

## Cadastrar e alterar instâncias

1. Abra a integração com uma sessão administrativa.
2. Clique em **Nova Instância**.
3. Informe **Nome** e **URL**; o formulário exige os dois em todas as linhas, inclusive inativas.
4. Informe o **Token** esperado pelo serviço e ajuste **Ativo** da instância.
5. Clique em **Salvar** para enviar a lista inteira.
6. Reabra a configuração e confira também o estado no serviço de mensagens.

Uma nova linha começa inativa. O token da linha não é automaticamente emitido nem validado pelo serviço externo; use a credencial fornecida para a integração.

**Limpe o filtro antes de editar ou excluir.** Na implementação atual, com filtro preenchido, a identificação da linha utiliza a primeira correspondência encontrada. Quando várias linhas combinam com a busca, alterar uma linha posterior pode atingir a primeira.

## Salvar, excluir e ativar

**Salvar** grava todas as linhas, não somente as visíveis no filtro. O estado Ativo é individual por instância. Ao excluir uma linha, a interface salva imediatamente a lista restante; não é necessário clicar em Salvar depois, e outras alterações ainda presentes nessa lista podem ser gravadas junto.

O nome identifica a instância nas operações. Evite nomes duplicados ou renomear uma instância sem conferir a correspondência no serviço externo.

Excluir a linha no LHISP **não comprova exclusão da instância remota**. Confirme a remoção no serviço de mensagens antes de reutilizar nome ou credencial.

## Conferir a sincronização

Salvar a configuração não confirma conexão ao WhatsApp ou entrega de mensagens. Use o **Histórico de Eventos** e encaminhe falhas persistentes ao suporte com o nome da instância e horário, sem o token.

## Limites da integração disponível

Antes de usar a configuração, confirme com o suporte a disponibilidade da conexão e do envio na sua instalação. O cadastro da URL/token sozinho não confirma funcionamento.

As notificações automáticas do LHISP dependem do gateway configurado em [Empresa](/sistema/empresa). Cadastrar instâncias aqui não substitui automaticamente o gateway de notificações.

| Situação | Conferência |
|---|---|
| Nenhuma linha aparece | Verifique se há filtro ativo ou se a lista realmente está vazia. |
| Salvar recusa uma linha | Nome e URL de todas as instâncias, inclusive ocultas pelo filtro. |
| Salvar teve sucesso, mas não há conexão | Confira autenticação e conexão no serviço externo; encaminhe a falha ao suporte. |
| Exclusão não removeu instância externa | Distinga a retirada da lista LHISP da operação de remoção no serviço. |
| Notificação não foi enviada | Gateway em Empresa e destino; salvar uma instância não envia mensagem. |
