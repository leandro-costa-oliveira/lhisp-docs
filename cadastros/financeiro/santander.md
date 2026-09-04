---
title: Santander
published: true
editor: markdown
description: Configuração da carteira Santander para boleto, CNAB, retorno e notificações de pagamento.
---

# Santander

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.

A conta Santander conecta contratos e contas a receber aos meios de cobrança do banco. O LHISP possui geração de boleto/código de barras Santander, remessa CNAB 400, leitura de retorno CNAB 240 e 400 e processamento de notificações de pagamento recebidas pelo endpoint bancário.

Esta página complementa o cadastro geral de [Contas Bancárias](/cadastros/financeiro/contas-bancarias). Use os parâmetros fornecidos no contrato da empresa com o Santander; formatos ou credenciais de outro convênio não são intercambiáveis.

## Pré-requisitos externos

- carteira de cobrança Santander homologada para o CNPJ do titular;
- código do convênio/beneficiário, agência e conta fornecidos pelo banco;
- padrão CNAB contratado;
- credenciais, certificado e chave Pix quando a modalidade usar API;
- endpoint de notificação liberado e cadastrado pelo banco, quando houver webhook.

O LHISP armazena a configuração, mas não realiza sozinho o credenciamento no portal Santander nem a troca de certificados com o banco.

## Configuração

1. Acesse **Cadastros > Financeiro > Contas Bancárias**.
2. Abra ou crie a conta e selecione a carteira Santander.
3. Informe titular, CPF/CNPJ, moeda, agência e conta exatamente como homologados.
4. Preencha o código do convênio e selecione o CNAB contratado.
5. Configure multa, juros, dias para baixa e geração de remessa conforme a política de cobrança.
6. Se a modalidade usar API/Pix, carregue o certificado e informe cliente, segredo, ambiente e chave Pix.
7. Salve e valide remessa e retorno com arquivos de homologação antes de produzir cobranças reais.

## Campos específicos e efeitos

| Campo | Regra |
|---|---|
| **Código do Convênio** | Somente números, com até 9 dígitos na SPA. A remessa Santander CNAB 400 utiliza os oito primeiros. |
| **CNAB** | Deve coincidir com o layout contratado. O sistema lê retornos Santander 240 e 400; a geração de remessa Santander implementada no legado é CNAB 400. |
| **Agência / Conta** | Identificam a conta beneficiária usada em boleto, remessa e retorno. |
| **Variação da Carteira** | Complemento da carteira quando exigido pelo contrato bancário. |
| **Cliente Id / Cliente Secret** | Credenciais OAuth da modalidade de API. |
| **Certificado / Senha** | Material de autenticação mútua da API. Só é substituído quando a interface envia a alteração. |
| **Ambiente** | **Homologação** ou **Produção**. Não misture certificado e credenciais entre ambientes. |
| **Chave Pix** | Chave associada às operações Pix/webhook quando contratadas. |
| **Webhook Ativo** | Registra que o recebimento por notificação está habilitado para a conta; a habilitação também depende do banco. |

## Processamento de pagamentos

O retorno CNAB associa ocorrências bancárias às contas a receber e aplica as regras do parser do layout escolhido. No fluxo de webhook Santander, o backend:

1. aceita notificações de função **PAGAMENTO**;
2. localiza a conta bancária pelo contexto da notificação;
3. usa convênio e número do cliente/documento para identificar a cobrança;
4. converte data e valor pagos;
5. encaminha a baixa e registra o meio de pagamento como retorno bancário.

Notificações de função diferente são registradas como ignoradas. Uma marcação de webhook na tela não substitui o cadastro e a homologação do endpoint junto ao Santander.

## Validação e diagnóstico

| Sintoma | Verificação |
|---|---|
| Remessa rejeitada | Confirme convênio, agência, conta, carteira e se o contrato usa CNAB 400. |
| Retorno não processa | Confira se o arquivo é Santander 240/400 e pertence à conta configurada. |
| Pagamento não baixou | Verifique número do documento, convênio, valor/data e logs do retorno ou webhook. |
| Falha OAuth/certificado | Confirme ambiente, cliente, segredo, arquivo e senha; não exponha esses dados em chamados. |
| Pix/webhook não opera | Confirme contratação e liberação do produto no banco; os campos na tela, isoladamente, não ativam o serviço externo. |

> **Segurança:** certificado, senha e credenciais são segredos. Não use dados de produção no demo e não os inclua em capturas de tela.
