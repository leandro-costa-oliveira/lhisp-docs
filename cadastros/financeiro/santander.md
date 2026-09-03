---
title: Santander
published: true
editor: markdown
description: ''
---

# Santander

## Objetivo

Configurar uma conta bancária Santander para cobrança, Pix e comunicação por certificado no LHISP.

## Pré-requisitos

- Acesso a **Cadastros > Financeiro > Contas Bancárias**.
- Carteira de cobrança do Santander cadastrada.
- Dados da conta, credenciais fornecidas pelo banco e certificado no formato aceito pela integração.
- Permissão para alterar contas bancárias. Somente usuários administradores veem a ação de baixar o certificado salvo.

## Passo a passo

1. Acesse **Cadastros > Financeiro > Contas Bancárias**.
2. Abra a conta Santander ou cadastre uma conta.
3. Selecione a **Carteira de Cobrança** correspondente ao Santander.
4. Preencha os dados gerais: moeda, titular e CPF/CNPJ.
5. Preencha **Convênio/Cedente**, **Agência**, **Conta**, **CNAB** e **Variação da Carteira** conforme o contrato bancário.
6. Na seção **Dados de Integração com a API - Pix**, informe as credenciais, ambiente e chave Pix exigidos pela modalidade configurada.
7. No campo **Certificado**, use a lupa para selecionar o arquivo. O navegador lê o arquivo e o envia codificado ao salvar.
8. Informe a **Senha do Certificado**. A senha só é enviada novamente quando o campo é alterado.
9. Selecione **Produção** ou **Homologação** em **Ambiente**.
10. Salve a conta bancária.

## Campos importantes

| Campo | Comportamento |
|---|---|
| **Carteira de Cobrança** | Obrigatória. Também determina quais campos específicos de banco aparecem. |
| **Convênio/Cedente** | Para Santander, aceita até nove dígitos; na remessa CNAB 400 são usados os oito primeiros. |
| **CNAB** | Permite selecionar 240, 400 ou 750. A escolha deve coincidir com a modalidade contratada. |
| **Certificado** | Permite selecionar, remover e, para administrador, baixar o arquivo já armazenado. O download usa o nome `Certificado-<id>.pfx`. |
| **Senha do Certificado** | É persistida quando alterada no formulário. |
| **Ambiente** | Campo obrigatório com as opções **Produção** (`p`) e **Homologação** (`h`). |
| **Chave Pix** | Chave associada à conta para operações Pix. |
| **Webhook Ativo?** | Registra se o webhook da conta está habilitado. |
| **Datas e horários de consulta** | Controlam as referências salvas para consultas de pagamentos Pix e boleto. |

## Resultado esperado

Ao salvar, a interface envia os dados para `POST /api/ContaBancaria.salvar`, mostra **Conta Bancária salva com Sucesso !** e retorna à tela anterior.

## Limites desta configuração

- O LHISP permite carregar e armazenar o certificado, mas a interface não extrai nem exibe a chave pública.
- O cadastro não automatiza etapas externas no portal Santander. Credenciamento, envio de chave pública e liberação de API devem seguir as instruções fornecidas pelo banco.
- Não use credenciais ou certificados de produção em ambientes de demonstração.

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.
