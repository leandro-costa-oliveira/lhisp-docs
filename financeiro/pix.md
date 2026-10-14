---
title: Cobranças e QR Code Pix
published: true
editor: markdown
description: Consulte o QR Code Pix de uma conta a receber e trate configuração incompleta, rejeição bancária e cobranças já pagas.
---

# Cobranças e QR Code Pix

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.

O QR Code Pix está associado à conta a receber. Configure o meio de recebimento no [cadastro da conta bancária](/cadastros/financeiro/contas-bancarias) e vincule a conta Pix ao serviço ou título correspondente.

## Consultar o QR Code

1. Abra o contrato e a aba **Financeiro**.
2. Nas ações do título que possui conta Pix ou código associado, escolha **QRCODE PIX**.
3. Confira o título e o valor antes de entregar o código ao cliente.
4. Use **Copiar QRCode** para copiar o Pix Copia e Cola exibido no campo.

Para contas em aberto, a consulta pode solicitar a geração/obtenção da cobrança no serviço Pix. A exibição do QR Code não confirma recebimento: acompanhe a situação financeira e o histórico da conta.

## Contas já pagas

Em contas pagas, o sistema apenas exibe o Pix Copia e Cola já salvo no título. Não consulta nem cria outra cobrança bancária nesse fluxo. Se não houver código salvo válido, apresenta **Conta paga sem QR Code Pix associado**.

A presença de uma conta bancária Pix vinculada ou de um identificador de transação não substitui o código salvo. Um QR Code exibido para conta paga serve para consultar o registro existente; confira o pagamento antes de reenviá-lo ao cliente.

## Erros de configuração e do banco

| Mensagem/situação | Verificação |
|---|---|
| **Configuração Pix incompleta** | Confira a conta bancária indicada e os campos faltantes apresentados. Conforme o provedor, podem incluir Client ID, Client Secret, Chave Pix, Certificado Pix e Application Key. |
| **Não foi possível obter o QR Code Pix. Banco: ...** | Leia o motivo retornado; confira credenciamento, escopos da aplicação, ambiente e certificado com o administrador da integração. |
| **Não foi possível obter o QR Code Pix. Tente novamente mais tarde.** | Falha de comunicação ou resposta não reconhecida. Confira situação e histórico antes de tentar novamente. |
| **Conta paga sem QR Code Pix associado** | A conta está paga e não possui código salvo utilizável; o sistema não gera outro Pix para ela. |
| Ação **QRCODE PIX** ausente | Confira se existe conta Pix vinculada ao título ou código Pix associado. |

Informe ao suporte o identificador da conta a receber, a conta bancária e a mensagem exibida. Preserve senhas, tokens e certificados.

## Serviços Pix por empresa

O sistema possui dois caminhos de processamento: o serviço Pix legado e o fluxo integrado de cobranças. A escolha é feita pela configuração persistida de cada empresa, com o mesmo comando operacional para o usuário. Uma empresa migrada pode usar um caminho diferente de outra no mesmo ambiente.

Essa escolha não é corrigida trocando o banco do cliente nem marcando uma opção na tela do QR Code. Em divergências após migração, peça ao suporte que confira a configuração da empresa e o serviço responsável, junto com o cadastro bancário.
