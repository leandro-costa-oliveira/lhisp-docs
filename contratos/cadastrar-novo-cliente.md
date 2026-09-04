---
title: Cadastrar novo cliente
published: true
editor: markdown
description: Cadastre ou reutilize a pessoa, defina a unidade e os endereços e crie o contrato inicial.
---

# Cadastrar novo cliente

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.

No LHISP, **pessoa** e **contrato** são registros diferentes. A pessoa concentra nome, documento e contatos; o contrato define filial, categoria, origem, segmento e endereços operacionais. Uma pessoa pode possuir mais de um contrato.

Criar o contrato não contrata um plano, não cria acesso e não gera mensalidade. Essas etapas são executadas depois nas abas do contrato.

## Iniciar

1. Acesse **Contratos**.
2. Clique em **Novo**.
3. A aba **Dados** abre em modo de inclusão.
4. Se a pessoa já existe, use a pesquisa no início de **Dados da pessoa** e selecione-a. O formulário reaproveita seu cadastro e endereços.
5. Se for uma pessoa nova, preencha os dados diretamente.

O usuário precisa da permissão `contrato_add` e só pode escolher filiais às quais possui acesso.

## Dados do contrato

| Campo | Regra |
|---|---|
| **Filial** | Obrigatória; define a unidade responsável e influencia permissões, cobrança e emissão fiscal. |
| **Provedor de origem** | Identifica migração/aquisição de carteira. Deixe vazio quando não se aplica. |
| **Categoria** | B2C ou B2B. Novo cadastro inicia em B2C; confirme antes de salvar contratos corporativos. |
| **Segmento** | Classificação comercial adicional usada em filtros e relatórios. |

Origem, segmento e profissão podem ser adicionados pelos botões `+`, conforme permissão.

## Dados da pessoa

Preencha ao menos:

- **Nome**;
- **Pessoa física/jurídica**;
- **CPF/CNPJ** válido;
- **Telefone 1**.

Os demais campos enriquecem os processos de contato e faturamento:

- apelido, nascimento e profissão;
- RG para pessoa física ou inscrição estadual para jurídica;
- responsável e CPF do responsável para pessoa jurídica;
- filiação para pessoa física;
- telefones 2 a 4 e autorização individual de SMS;
- e-mail, site e WhatsApp;
- **Possui ISS retido**, somente quando definido pela área fiscal.

Marcar um telefone como habilitado para SMS não corrige número inválido nem substitui consentimento/processo de comunicação da empresa.

## Endereços

O **Endereço da instalação** é obrigatório. Use a pesquisa para escolher um logradouro cadastrado ou `+` para criar um endereço com UF, tipo urbano/rural, cidade, bairro, logradouro, CEP e código municipal quando solicitado. Depois informe número, condomínio, complemento e ponto de referência do contrato.

O **Endereço de cobrança** é opcional e fica em uma seção recolhível. Quando não informado, os fluxos de boleto e outros documentos usam o endereço de instalação como alternativa. Se for diferente, selecione o logradouro e preencha também número e complemento de cobrança; não basta digitar esses campos sem vincular um endereço.

Os três contatos adicionais pertencem ao contrato e servem para responsáveis administrativos, técnicos ou locais. Eles não substituem os telefones da pessoa.

## Salvar e responder às validações

1. Revise filial, categoria, documento, telefone e endereço.
2. Clique em **Salvar**.
3. Responda às confirmações apresentadas pelo backend.
4. Ao concluir, o sistema atribui o número do contrato e abre o registro salvo.

### Documento já possui contrato

O LHISP pesquisa o CPF/CNPJ em todas as filiais. Se já houver contrato, pergunta se deseja criar outro. Cancele e abra o cadastro existente quando se tratar de duplicidade; confirme somente quando a pessoa realmente precisa de outro contrato.

### Documento possui contas vencidas

Se o CPF/CNPJ tiver contas em atraso, o cadastro exige `contrato_add_inadimplente`. Sem essa permissão, a criação é recusada. Com permissão, o operador ainda precisa confirmar conscientemente a exceção.

### Lista negra

Uma pessoa existente marcada na lista negra não pode receber novo contrato. A restrição deve ser tratada no processo autorizado de análise cadastral, não pela criação de outra pessoa com documento alterado.

## Depois de salvar

Siga a ordem:

1. [Adicionar serviço contratado](/contratos/adicionar-servico-contratado).
2. [Adicionar acesso ao cliente](/contratos/adicionar-acesso-cliente), quando o plano possui conectividade.
3. Conferir primeira cobrança, proporcionalidade e conta bancária.
4. Provisionar OTT/telefonia/produtos aplicáveis.
5. Registrar documentos, aceite e atendimento de instalação.

O contrato sem serviço permanece apenas como estrutura cadastral; não entrega nem fatura o plano por si só.

## Diagnóstico

| Situação | Verificação |
|---|---|
| Salvar não prossegue | Confira filial, nome, CPF/CNPJ, telefone 1 e endereço da instalação. |
| CPF/CNPJ inválido | Corrija o número e confirme o tipo de pessoa; não use documento fictício em produção. |
| Endereço aparece inválido | Selecione um registro pela pesquisa ou cadastre-o; texto sozinho não cria o vínculo interno. |
| Confirmação de contrato existente | Pesquise todos os contratos da pessoa antes de autorizar outro. |
| Acesso negado por inadimplência | É necessária a permissão `contrato_add_inadimplente`; valide a política comercial. |
| Cadastro bloqueado por lista negra | Encaminhe à análise responsável; o backend impede o novo contrato. |
| Filial inválida | O usuário não possui acesso à filial ou ela não está disponível. |
| E-mail/telefone não atualizou | Se a pessoa foi reaproveitada, confira o impacto nos demais contratos ligados a ela. |

![Formulário de novo cliente](/assets/screenshots/contratos/novo-cliente-formulario.png)
