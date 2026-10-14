---
title: LH-Zap
published: true
editor: markdown
description: Mantenha instâncias, entenda a publicação de configuração e os limites de sincronização e envio.
---

# LH-Zap

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.

O cadastro **Sistema > Integrações > LH-Zap** mantém uma lista de instâncias com **Nome, URL, Token e Ativo**. Ao salvar, o backend persiste a lista e publica eventos de configuração para processamento externo. Essa tela não cria uma sessão WhatsApp confirmada nem oferece envio de teste ou QR Code de conexão.

## Cadastrar e alterar instâncias

1. Abra a integração com uma sessão administrativa.
2. Clique em **Nova Instância**.
3. Informe **Nome** e **URL**; o formulário exige os dois em todas as linhas, inclusive inativas.
4. Informe o **Token** esperado pelo serviço e ajuste **Ativo** da instância.
5. Clique em **Salvar** para enviar a lista inteira.
6. Reabra a configuração e confira também o estado no serviço que consome os eventos.

Uma nova linha começa inativa. O token da linha não é automaticamente emitido nem validado pelo serviço externo; gerar um valor no campo exige coordenação com o consumidor.

**Limpe o filtro antes de editar ou excluir.** Na implementação atual, com filtro preenchido, a identificação da linha utiliza a primeira correspondência encontrada. Quando várias linhas combinam com a busca, alterar uma linha posterior pode atingir a primeira.

## Salvar, excluir e ativar

**Salvar** grava todas as linhas, não somente as visíveis no filtro. O estado Ativo é individual por instância. Ao excluir uma linha, a interface salva imediatamente a lista restante; não é necessário clicar em Salvar depois, e outras alterações ainda presentes nessa lista podem ser gravadas junto.

O nome é usado como referência nas operações de instância do backend. Evite nomes duplicados ou renomear uma instância sem conferir a correspondência no consumidor externo.

Excluir a linha no LHISP **não comprova exclusão da instância remota**. A interface salva a coleção completa, enquanto a operação específica de remoção do backend possui outro fluxo de evento. Confirme a remoção no serviço responsável antes de reutilizar nome ou credencial.

## Sincronização por eventos

As alterações são publicadas no canal de integração **LHZap**, com informações das instâncias. O backend mantém estados como pendente, publicado e erro e possui mecanismos técnicos de republicação/reconciliação.

**Publicado significa enviado à fila**, não conectado ao WhatsApp, entregue ao destinatário ou aplicado pelo consumidor. A tela atual não apresenta esses estados técnicos nem botão de retomada; use o **Histórico de Eventos** e encaminhe falhas persistentes ao suporte com o nome da instância e horário, sem o token.

## Limites da integração disponível

O serviço local **lh-zap-api** possui API autenticada própria para instâncias, conexão por QR Code e mensagens, mas não foi encontrado um consumidor que ligue diretamente os eventos de configuração do LHISP a esse serviço. O cadastro da URL/token sozinho não comprova essa ponte.

As notificações automáticas do LHISP também dependem do gateway configurado em [Empresa](/sistema/empresa). No daemon revisado, o envio implementado usa o gateway **Z-API.io** e seus campos de instância/token; não foi encontrado envio que consulte a lista LH-Zap desta tela. Cadastrar instâncias aqui não substitui automaticamente o gateway de notificações.

| Situação | Conferência |
|---|---|
| Nenhuma linha aparece | Verifique se há filtro ativo ou se a lista realmente está vazia. |
| Salvar recusa uma linha | Nome e URL de todas as instâncias, inclusive ocultas pelo filtro. |
| Salvar teve sucesso, mas não há conexão | Serviço consumidor, aplicação do evento e autenticação/conexão no serviço externo. |
| Exclusão não removeu instância externa | Distinga a retirada da lista LHISP da operação de remoção no serviço. |
| Notificação não foi enviada | Gateway em Empresa, fila de notificações e destino; salvar uma instância não envia mensagem. |
