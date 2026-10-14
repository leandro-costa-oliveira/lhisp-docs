---
title: Central do assinante — acesso e serviços
description: Autenticação, financeiro, Pix, documentos, solicitações e diagnóstico do atendimento pela central do assinante.
published: true
editor: markdown
---

# Central do assinante — acesso e serviços

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.

Referência para suporte e operação do LHSAC. A disposição dos botões e os recursos disponíveis dependem do aplicativo publicado e da configuração do provedor.

## Acesso e recuperação de senha

O login usa CPF/CNPJ e a senha da central. A pessoa precisa ter a central ativa e serviços que atendam aos critérios de acesso. Por padrão, serviços cancelados são excluídos da verificação; a empresa pode habilitar o acesso de cancelados. A sessão usa duração padrão de 24 horas, alterável pela configuração do serviço.

Na recuperação, informe o documento e escolha um dos meios oferecidos para o cadastro. Os destinos aparecem parcialmente ocultos. Se não houver método disponível, confira os contatos do titular no painel e os gateways da empresa; não prometa envio para um número que não consta no cadastro.

Para trocar a senha com sessão ativa, o serviço confere a senha atual. A senha da central é diferente das credenciais do vendedor, técnico e operador administrativo.

## Financeiro e segunda via

O financeiro consulta os contratos da pessoa autenticada. A situação padrão é **em aberto**; pagos são ordenados por vencimento decrescente, abertos por vencimento crescente.

**A lista não é um extrato completo:** para cada contrato e situação, o código devolve apenas as contas do primeiro mês encontrado na ordenação. Além disso, a empresa pode configurar a exibição exclusiva de boletos já registrados. Uma conta ausente na central não comprova ausência de débito no painel.

Títulos podem ser agrupados por contrato, conta bancária e número do documento. O retorno apresenta valor nominal, valor a pagar na data da consulta, desconto, vencimento e indicação de Pix. Confira o número do documento e o contrato ao comparar o valor com a gerência financeira.

A segunda via usa o link do PSP, quando presente, ou um link de PDF com token de 24 horas. Links com token dão acesso ao documento e precisam ser tratados como credenciais. Determinadas carteiras, como a carteira identificada no sistema como 3, não devolvem boleto/linha digitável nesse fluxo.

## Pix e cartão

A disponibilidade de Pix depende da conta bancária Pix ou do código associado ao título. O serviço pode utilizar o processamento legado ou o fluxo novo de cobranças conforme a empresa. Gerar ou exibir QR Code não confirma recebimento; confira a baixa no financeiro. Veja [Cobranças e QR Code Pix](/financeiro/pix).

Os métodos de cartão e cofre dependem das integrações habilitadas. Consulte os métodos efetivamente retornados para a instalação, sem prometer um gateway ou parcelamento apenas por existir código de integração no servidor.

## Contratos, documentos e notas

| Serviço | Regra operacional |
|---|---|
| Contratos e acessos | Consultam vínculos da pessoa autenticada; confira o contrato quando o titular possui vários endereços. |
| Documentos do contrato | Diferencia não aceito, pré-aceito e aceito conforme datas de aceite e validação. |
| Aceite | Exige documento, localização e imagem; verifica vínculo ao titular e recusa documento já aceito. |
| Notas fiscais | A consulta retorna notas na situação emitida para a pessoa, com link temporário de PDF. |
| Atendimento e OS | Consultas são separadas; a existência de protocolo não significa visita técnica já agendada. |

Preencher o aceite não equivale a validação jurídica automática do documento. Para conferir seu estado no sistema, acompanhe o registro do contrato e a validação exigida pelo fluxo administrativo.

## Solicitar atendimento

A solicitação exige telefone, mensagem com ao menos dez caracteres e identificador de contrato. O serviço pode anexar a mensagem a um atendimento já aberto pelo sistema para aquele contrato; caso contrário, cria um protocolo pelo canal aplicativo/LHSAC.

Leia o retorno: **Observação Anexada ao Atendimento** mantém o protocolo existente; **Atendimento Solicitado com Sucesso** informa o novo protocolo. Não prometa um novo número a cada mensagem nem agendamento automático da OS.

O diagnóstico enviado pode ser registrado junto ao atendimento. Antes de repetir uma solicitação com resposta incerta, confira o protocolo no painel para evitar acompanhamento duplicado.

## Desbloqueio em confiança

A solicitação se aplica ao serviço contratado indicado. Permissão e elegibilidade seguem as regras de desbloqueio da instalação. Não representa quitação, perdão de dívida ou garantia de liberação imediata: confira retorno, prazo e estado do acesso.

## Diagnóstico de suporte

| Sintoma | Conferência |
|---|---|
| Login recusado | Documento, senha da central, central ativa e situação dos serviços/configuração de cancelados. |
| Recuperação sem destinos | Contatos do titular e gateways; não trocar titularidade para contornar a ausência. |
| Conta não aparece | Contrato, situação, mês retornado e preferência de somente boletos registrados. |
| Valor diverge do boleto antigo | Data de apuração, agrupamento, desconto e atualização de juros/multa. |
| PDF expirado | Consulte novamente para obter um link atual. |
| Atendimento não criou novo protocolo | Verifique se a mensagem foi anexada ao atendimento já aberto. |
| Aceite recusado | Documento correto, vínculo, coordenadas/imagem e aceite já registrado. |

Para diagnóstico, registre versão, horário, contrato/título/protocolo e mensagem sanitizada. Não compartilhe senha, token de sessão, imagem do titular ou link temporário em canais públicos. Não houve teste autenticado do aplicativo nesta revisão.
