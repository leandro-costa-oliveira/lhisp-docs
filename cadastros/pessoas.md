---
title: Pessoas
published: true
editor: markdown
description: Mantenha a identidade compartilhada por clientes, fornecedores, funcionários, técnicos e vendedores.
---

# Pessoas

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.

Pessoa é o cadastro central de identidade do LHISP. Nome, CPF/CNPJ, contatos e endereço são reutilizados por contratos de clientes e também por papéis operacionais como fornecedor, funcionário, técnico e vendedor.

**Pessoa não é contrato.** Uma mesma pessoa pode possuir vários contratos; situação, filial, plano, acesso e cobrança pertencem a cada contrato. Antes de cadastrar um cliente, pesquise a pessoa pelo documento para não fragmentar seu histórico.

## Identificação e validações

- Nome, CPF/CNPJ, telefone principal e endereço são obrigatórios.
- O tipo aceito é **Física** ou **Jurídica**. Quando omitido pela integração, o backend infere pelo número de dígitos do documento.
- CPF/CNPJ é único dentro da empresa; duplicidade impede novo cadastro.
- A API possui uma rotina para apresentar documentos com 11 ou 14 dígitos no padrão de CPF/CNPJ.
- Vários e-mails podem ser informados separados por vírgula, mas cada item precisa ser um endereço válido e sem espaços indevidos.
- Nome igual é permitido; documento igual não.

Data de nascimento, RG/inscrição, nome conhecido, filiação e contato responsável complementam identificação e processos específicos. Para pessoa jurídica, mantenha razão/nome e documentos coerentes com o cadastro fiscal.

## Endereços e contatos

O endereço selecionado é um logradouro compartilhado; número, complemento e ponto de referência ficam na pessoa. Também pode existir endereço de cobrança separado.

Esses dados podem alimentar contratos, notas, fornecedores e comunicações. Contudo, o contrato mantém seus próprios endereços de instalação e cobrança: alterar a pessoa não substitui automaticamente os dados já gravados em cada contrato.

Telefones e e-mail são usados por atendimento, portal/app, notificações, aceite e assinatura digital. O envio de documento à D4Sign, por exemplo, exige pelo menos um e-mail válido.

## Papéis operacionais

As marcações **Funcionário**, **Fornecedor**, **Técnico** e **Vendedor** permitem que a mesma identidade participe de módulos diferentes:

- fornecedor em despesas, contas a pagar e notas de compra;
- técnico em agenda, ordens de serviço, estoque individual e comissões;
- vendedor em contratações e relatórios comerciais;
- funcionário em vínculos de filial e rotinas administrativas.

Marcar um papel não significa, por si só, criar usuário de acesso ao LHISP. Senhas técnicas/comerciais e vínculos de filiais possuem ações próprias.

## Cadastrar ou alterar

1. Acesse **Cadastros > Pessoas** e pesquise primeiro CPF/CNPJ, nome, e-mail ou telefone.
2. Reutilize o registro quando for a mesma identidade.
3. Em novo cadastro, defina tipo, nome e documento.
4. Informe telefone principal, demais contatos e e-mails.
5. Selecione o endereço correto e complete número, complemento e referência.
6. Preencha endereço de cobrança apenas quando diferente.
7. Marque somente os papéis efetivamente exercidos e salve.
8. Se a pessoa será cliente, crie ou associe o contrato no fluxo de **Contratos**.

Inclusão, edição e exclusão usam `pessoa_add`, `pessoa_edit` e `pessoa_del`.

## Impacto de alterações e exclusão

Corrigir documento ou contato afeta os módulos que consultam a pessoa posteriormente, mas registros históricos — como notas já emitidas — conservam seus próprios dados. Antes de alterar CPF/CNPJ, confirme que se trata de correção da mesma entidade, não de troca de titular.

A exclusão é lógica na API atual. Contratos, financeiro, estoque, SPC, documentos e atendimentos podem depender da pessoa; encerre ou transfira esses vínculos antes de apagar. Nunca exclua para resolver duplicidade sem definir qual cadastro preservará o histórico.

| Problema | Verificação |
|---|---|
| Documento já cadastrado | Abra a pessoa indicada e associe o novo contrato/papel a ela. |
| E-mail inválido | Valide cada endereço separado por vírgula e remova espaços. |
| Pessoa não aparece como técnico/fornecedor | Confira a marcação do papel e os vínculos de filial exigidos pelo módulo. |
| Alteração não mudou o contrato | Pessoa e contrato guardam dados próprios; edite o endereço/contato no contexto correto. |
| Exclusão falha | Existem referências operacionais ou o usuário não possui `pessoa_del`. |

![Cadastro de pessoas](/assets/screenshots/cadastros/pessoas.png)
