---
title: LH-Crypto
published: true
editor: markdown
description: Conheça os campos de configuração e o estado incompleto do fluxo legado de QR Code e WebWallet.
---

# LH-Crypto

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.

A tela **Sistema > Integrações > LH-Crypto** armazena **ApiKey**, **Carteira / Wallet** e **Ativo**. O financeiro legado possui um botão **QRCODE CRYPTO** ligado a essa configuração.

**O fluxo encontrado é incompleto e não deve ser considerado uma cobrança conciliada automaticamente.** A geração usa uma quantia técnica fixa de `0.00005`, sem converter o valor em reais do título nem registrar cotação. Não foi identificado, nesse fluxo, um retorno que confirme o recebimento e baixe a conta a receber.

## O que a configuração salva

| Campo | Uso no código |
|---|---|
| **ApiKey** | Credencial enviada ao serviço de pagamentos no header `x-api-key`. |
| **Carteira / Wallet** | Destino informado na solicitação e na transação da carteira do navegador. A interface limita a 42 caracteres. |
| **Ativo ?** | Habilita a opção de QR Code Crypto no financeiro do contrato. |

Use sessão administrativa para revisar a configuração. Clique em **Salvar**, reabra e confirme os valores e a ativação. O salvamento não valida rede, titularidade da carteira, cotação ou capacidade de liquidação do título. A tela também não oferece seletor de ambiente; o destino do pedido depende de outra propriedade usada pelo backend.

## Comportamento do botão financeiro

Ao abrir **QRCODE CRYPTO**, o código solicita um pagamento ao serviço e mostra QR Code, URL e **Copiar QRCode**. O botão **Pagar por WebWallet** solicita uma conta da carteira disponível no navegador e envia uma transação com os dados retornados pelo serviço.

A confirmação dessa transação no navegador **não está ligada a uma baixa financeira implementada nessa rotina**. O código também não comprova persistência completa do pedido no título nem atualização de cotação ao reabrir.

A proteção de [Pix para contas já pagas](/financeiro/pix) pertence a outro fluxo. Não há a mesma verificação de situação na geração Crypto revisada; abrir uma conta já paga não deve ser tratado como uma consulta garantidamente sem criação externa.

## Antes de qualquer uso operacional

O responsável pela integração precisa concluir e validar conversão de valor, rede/moeda, persistência do pedido, mudança de cotação, confirmação externa e conciliação da conta. Até essa validação, preserve a integração desativada para a cobrança normal e utilize os meios de recebimento já operacionais na [Gerência Financeira](/financeiro/gerencia-financeira).

O primeiro cadastro compartilhado de integrações pode iniciar ativo mesmo com a opção desmarcada; reabra após criar e confirme a desativação. Não envie pagamento real para testar uma mensagem de sucesso de configuração.
