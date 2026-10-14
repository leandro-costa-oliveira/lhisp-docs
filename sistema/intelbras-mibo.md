---
title: Intelbras Cloud Mibo
published: true
editor: markdown
description: Configure credenciais e produtos gatilho e acompanhe o ciclo de estoque, alocação e bloqueio das câmeras.
---

# Intelbras Cloud Mibo

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.

A integração relaciona câmeras identificadas pelo **número de série do patrimônio** à Intelbras Cloud Mibo. Ela usa eventos de estoque e do serviço contratado para cadastrar, liberar, bloquear ou desvincular os dispositivos na API Intelbras.

## Preparar e configurar

1. Confirme a contratação ativa do módulo **Intelbras Cloud Mibo**. A tela fica bloqueada enquanto a assinatura não for confirmada pela gerência.
2. Cadastre os modelos de câmera em [Produtos](/cadastros/estoque/produtos), com **controle patrimonial**.
3. Abra **Sistema > Integrações > Intelbras Cloud Mibo**.
4. Informe **Client ID** e **Client Secret** fornecidos para a API Intelbras.
5. Marque os **Produtos gatilho (câmeras Mibo)** que devem participar da sincronização.
6. Marque **Ativo**, clique em **Salvar**, reabra e confira a configuração persistida.
7. No [plano](/cadastros/financeiro/planos), habilite Intelbras Mibo e associe os produtos permitidos para aquele serviço.

A lista da integração mostra somente produtos com controle patrimonial. Selecionar o produto no cadastro da integração e autorizá-lo no plano são duas configurações distintas.

Use uma sessão administrativa para manter as credenciais. Salvar a integração grava a configuração; não testa autenticação na Intelbras nem sincroniza em massa todos os patrimônios antigos. O botão **Portal do Parceiro** abre o portal externo fornecido na tela.

## Ciclo do dispositivo

| Evento | Ação na integração |
|---|---|
| **Novo patrimônio no estoque** | Adiciona o número de série à whitelist e à blacklist; o dispositivo confirmado fica **EM_ESTOQUE**. |
| **Alocação ao serviço / desbloqueio / reativação** | Remove da blacklist; quando confirmado, fica **ALOCADA**. |
| **Bloqueio ou suspensão do serviço** | Adiciona à blacklist; quando confirmado, fica **BLOQUEADA**. |
| **Cancelamento do serviço** | Solicita desvinculação e depois adiciona à blacklist. |

A sincronização pode permanecer pendente até a confirmação da Intelbras. Salvar o contrato ou concluir uma movimentação local não comprova que a câmera já foi liberada/bloqueada na Intelbras.

O processamento de operações que adicionam blacklist possui limite de **100 por hora por empresa**. Ao atingir o limite, a fila aguarda nova janela; grandes lotes não têm conclusão imediata garantida.

## Adicionar câmera pela OS

A ordem deve estar aberta e ligada a um serviço cujo plano tenha Mibo habilitado. O produto precisa estar tanto na integração quanto na lista permitida pelo plano. O patrimônio deve estar disponível, em posse do técnico responsável e sem outra locação, venda ou contrato.

O fluxo retira uma unidade do material do técnico, cria a locação e vincula o patrimônio ao contrato/serviço. **Plano de valor fixo permite somente uma câmera por serviço contratado.** Nos tipos de cobrança que usam quantidade, adicionar/remover dispositivos ajusta a quantidade do serviço, respeitando o mínimo de uma unidade na remoção. Confira o efeito comercial antes de alterar a locação.

## Acompanhar e corrigir

No [Controle Patrimonial](/estoque/controle-patrimonial), confira o estado de sincronização e a mensagem retornada. Os estados pendentes são **PENDENTE_CADASTRO**, **PENDENTE_ALOCACAO** e **PENDENTE_BLOQUEIO**. Em falha externa, a mensagem pode registrar o erro mantendo o estado anterior/pendente; não dependa apenas do rótulo para concluir sucesso.

| Sintoma | Conferência |
|---|---|
| Produto não aparece na integração | Controle patrimonial do produto e acesso ao cadastro. |
| Evento não é gerado | Assinatura do módulo, integração ativa e produto na lista gatilho. |
| Patrimônio recusado na OS | Plano habilitado, produto permitido, posse do técnico e ausência de outro vínculo. |
| Credenciais não configuradas / autenticação recusada | Client ID e Client Secret da API Intelbras e situação da conta no parceiro. |
| Pendência prolongada | Confira a mensagem do patrimônio e o limite de blacklist; encaminhe falhas persistentes ao suporte. |

Desativar a integração interrompe o processamento de novas operações; não executa a liberação/desvinculação automática dos dispositivos já existentes. Revise o estado externo antes de retirar a integração de operação.
