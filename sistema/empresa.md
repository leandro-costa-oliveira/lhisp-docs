---
title: Empresa
published: true
editor: markdown
description: Mantenha dados fiscais, preferências, regras de ordens de serviço e notificações; consulte as cobranças da assinatura do LHISP.
---

# Empresa

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.

## Objetivo

Consultar e manter os dados cadastrais e fiscais da empresa no LHISP, incluindo identificação, contato, logomarca, preferências, regras de ordens de serviço e notificações. A tela possui cinco abas e um link **Minha assinatura** no cabeçalho.

## Quando usar

Use esta tela quando for necessário:

- revisar os dados cadastrais da empresa;
- atualizar nome, razão social, CNPJ e contatos;
- ajustar parâmetros fiscais;
- conferir informações de endereço e observações fiscais;
- trocar a logomarca exibida no sistema.

## Pré-requisitos

- Acesso ao menu **Sistema > Empresa**.
- Permissão para alterar dados cadastrais da empresa.

## Passo a passo

1. Acesse **Sistema > Empresa**.
2. Abra a aba **Dados** para consultar os campos cadastrais.
3. Revise as informações de identificação, contato e endereço.
4. Verifique a seção **Informações Fiscais** para conferir os parâmetros tributários.
5. Use **Selecionar Logomarca** quando for necessário trocar a imagem da empresa.
6. Se necessário, navegue para as demais abas para revisar configurações complementares da empresa.
7. Clique em **Salvar** e aguarde a conclusão. Confira os valores depois do retorno da operação.

## Abas e salvamento

| Aba | Conteúdo |
|---|---|
| **Dados** | Identificação, endereço, logomarca e informações fiscais. |
| **Preferências** | Parâmetros operacionais e de cobrança, gateways de envio, Telegram, WhatsApp, e-mail e dados do contador. |
| **Ordens de Serviço** | LHTEC, exigência de POP, retirada automática, valores cobrados e anexos requeridos por tipo de OS. |
| **Notificações** | Mensagem, canais SMS/App/WhatsApp/e-mail e template de e-mail por evento, incluindo tipos de OS cadastrados. |
| **Financeiro** | Cobranças da assinatura do LHISP, com filtros **Em Aberto**, **Pagas** e **Todas**, totais e impressão do boleto quando há link. |

Ao editar, o cabeçalho passa a mostrar **Salvar** e **Cancelar**. **Salvar** processa os formulários alterados; **Cancelar** restaura os dados carregados nos formulários pendentes.

**Dados** e **Preferências** compartilham um formulário. **Ordens de Serviço** e **Notificações** possuem salvamento próprio. O botão do cabeçalho salva os formulários pendentes em sequência; se ocorrer falha, revise cada aba, pois uma anterior pode já ter sido salva.

A aba **Financeiro** consulta as cobranças da própria empresa junto ao LHISP. Para operar contas de clientes e fornecedores, use [Gerência Financeira](/financeiro/gerencia-financeira).

## Ordens de serviço e notificações

Na aba **Ordens de Serviço**, a opção de retirada automática considera serviços cancelados com material locado e sem OS de retirada em aberto. Informe uma quantidade inteira de dias maior que zero. Confira também a conta bancária e os valores de OS improdutiva, retirada improdutiva e serviços diversos.

Em **Anexos requeridos por tipo de OS**, adicione o tipo de ordem, marque os tipos de anexo exigidos na baixa e salve. Remover o tipo dessa configuração retira suas exigências de anexos.

Na aba **Notificações**, revise evento, mensagem, canais e template antes de salvar. A mensagem aceita até 160 caracteres. Marcar o canal depende da configuração do respectivo gateway em **Preferências** e das integrações de envio.

## Campos importantes

### Aba Dados

| Campo / ação | Descrição |
|---|---|
| **Nome** | Nome de exibição da empresa no sistema. |
| **Razão Social** | Razão social cadastrada. |
| **Slogan** | Texto institucional exibido na empresa. |
| **CNPJ** | Documento fiscal da empresa. |
| **Inscrição Estadual** | Inscrição estadual informada no cadastro. |
| **Inscrição Municipal** | Inscrição municipal da empresa. |
| **Email** | Endereço eletrônico principal. |
| **Site** | Site institucional. |
| **SpeedTest** | Endereço usado para o teste de velocidade. |
| **Telefone 1 / Telefone 2 / Whatsapp** | Canais de contato da empresa. |
| **Selecionar Logomarca** | Abre a seleção da imagem da marca. |
| **Regime Fiscal** | Regime tributário da empresa. |
| **Alíquota ICMS / PIS / COFINS / FUST / FUNTTEL / ISS** | Parâmetros fiscais exibidos na tela. |
| **Cnae ISS** | CNAE vinculado ao ISS. |
| **Código NBS** | Código fiscal complementar. |
| **Código INDOP** | Código fiscal complementar. |
| **Abatimento B. Cálc. ICMS (%)** | Percentual de abatimento da base de cálculo do ICMS. |
| **CFOPs com Abatimento na B. Cálc. ICMS** | Lista de CFOPs vinculados ao abatimento. |
| **Observações das Notas Fiscais** | Campo com observações fiscais em múltiplas linhas. |
| **Logradouro / Número / Ponto de Referência** | Dados de endereço exibidos no cadastro. |

## Resultado esperado

- Os dados da empresa ficam disponíveis para consulta e manutenção.
- A logomarca e os parâmetros fiscais podem ser revisados em um único local.
- O cadastro central da empresa permanece alinhado ao uso pelo restante do sistema.

## Problemas comuns

| Problema | Como tratar |
|---|---|
| Os campos não refletem a realidade da empresa | Verifique se o ambiente está apontando para o tenant correto. |
| A logomarca não carrega | Refaça o upload e confirme o formato da imagem. |
| Os dados fiscais parecem inconsistentes | Confirme com o time fiscal antes de salvar qualquer alteração. |
| A aba desejada não abre | Recarregue a página e teste novamente com outra sessão. |
| Cabeçalho não mostra Salvar/Cancelar | Os botões aparecem quando algum formulário possui alterações pendentes. |
| Falha ao salvar várias abas | Confira o resultado de cada formulário; o salvamento do cabeçalho é sequencial. |
| Imprimir indisponível em Financeiro | A cobrança não retornou link do boleto. |

![Empresa no demo](/assets/screenshots/sistema/empresa.png)
