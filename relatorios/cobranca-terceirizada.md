---
title: Clientes em Cobrança Terceirizada
published: true
editor: markdown
description: Consulte contratos com data de envio à cobrança terceirizada registrada, sem disparar novos envios.
---

# Clientes em Cobrança Terceirizada

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.

A tela `/relatorios/clientes/cobranca_terceirizada` lista contratos cujo campo **Data de Envio para Cobrança Terceirizada** está preenchido. Uma linha é um contrato; a consulta não verifica no prestador externo se o atendimento ou a dívida continuam ativos.

## Consultar

Abra com sessão e acesso ao menu/Contratos. Selecione **Filial** ou deixe a opção vazia para consultar o conjunto autorizado. A API mantém a restrição às filiais acessíveis ao usuário.

A grade apresenta número do contrato, nome do cliente e data de envio cadastrada. Não filtra situação atual do contrato, dívida em aberto ou existência de serviço.

## Limites atuais dos controles

O **Período** aparece no formulário, mas não é enviado no filtro da API. Alterar as datas não restringe o resultado. A filial é o único filtro efetivo apresentado nessa tela, além da exigência de data de envio preenchida.

**Atualizar** não força nova leitura. Recarregue a página para confirmar mudanças feitas em outra aba. **Imprimir** usa a saída do navegador. Não há CSV próprio, envio, retirada da carteira ou atualização do prestador por esse relatório.

Uma data antiga não comprova dívida atual. Para selecionar contas abertas elegíveis para cobrança, consulte [Clientes para Cobrança](/relatorios/clientes-para-cobranca). Para explicar uma situação específica, confira as contas e o histórico diretamente no contrato e na integração utilizada.
