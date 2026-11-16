---
title: Turbomed
published: true
editor: markdown
description: Configure a integração Turbomed, associe planos Onix e confira adesões, dados da pessoa e status provisórios.
---

# Turbomed

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.

A integração permite cadastrar adesões de telemedicina e enviar alterações de status à Turbomed a partir dos recursos OTT do plano contratado. O beneficiário é identificado pelo CPF e pelo código Onix do produto; as alterações de status também utilizam o número do cartão retornado pela plataforma.

## Pré-requisitos

- Credenciamento na Turbomed, com **API Key** e **Company ID** fornecidos pelo parceiro.
- Acesso ao menu **Sistema > Integrações > Turbomed** e permissão para alterar os cadastros envolvidos.
- Integração ativa, plano com recurso Turbomed e serviço contratado vinculado ao cliente.
- Pessoa física com CPF de 11 dígitos. Para uma nova adesão, também são exigidos nome, data de nascimento válida e sexo preenchido.

A instalação deve receber a atualização que inclui a integração e a migração **1561**, que adiciona o campo sexo e o menu. Essa migração deve preceder as aplicações que utilizam o novo campo e pode reconstruir e bloquear temporariamente a tabela de pessoas. Combine a janela com o responsável pela instalação, conforme [Atualização da instalação](/operacao/atualizacao-do-banco).

## Configurar a integração

1. Acesse **Sistema > Integrações > Turbomed**.
2. Preencha **API Key** com a chave fornecida pela Turbomed.
3. Preencha **Company ID** com o identificador da empresa no parceiro.
4. Marque **Ativo ?** para habilitar a integração.
5. Clique em **Salvar** e confira a configuração gravada.

| Campo / ação | Descrição |
|---|---|
| **API Key** | Chave utilizada na autenticação. A entrada fica mascarada na tela. |
| **Company ID** | Identificador da empresa na Turbomed; não é o código da empresa no LHISP. |
| **Ativo ?** | Controla a disponibilidade do gateway para a integração. |
| **Salvar** | Grava a configuração e atualiza o gateway Turbomed. |

Os dois campos de credenciais são obrigatórios para salvar. A API utiliza a base `https://api.turbomed.com.br`. Salvar a configuração não testa o login nem confirma que um beneficiário foi cadastrado. Desativar a integração também não envia cancelamentos para adesões existentes.

## Associar o produto ao plano

1. Acesse **Cadastros > Financeiro > Planos** e abra o plano desejado.
2. Na aba **Serviços e acesso**, habilite **OTT**.
3. Em **Serviços OTT**, clique em **+ Adicionar Recurso**.
4. Selecione **Turbomed** no campo **Gateway OTT**.
5. Escolha o produto em **Recurso** e confira o **Recurso Id**, que corresponde ao código Onix.
6. Clique em **Adicionar** e salve o plano.

| Código Onix | Produto |
|---|---|
| `7426` | Individual Essencial |
| `7499` | Familiar Essencial |
| `7740` | Premium Individual |
| `7741` | Premium Familiar |
| `7500` | Desconto em medicamentos |

Por exemplo, para oferecer **Individual Essencial**, associe o recurso `7426`. O catálogo é mantido manualmente no LHISP; novos produtos e alterações de códigos dependem de atualização desse mapeamento, sem importação automática da API.

Confira o guia de [Planos](/cadastros/financeiro/planos) antes de alterar serviços já comercializados. Associar um recurso ao plano não comprova que uma adesão foi efetivada no parceiro.

## Preencher os dados da pessoa

O campo **Sexo** pode ser preenchido em [Pessoas](/cadastros/pessoas) ou nos dados da pessoa no [Contrato](/contratos/contrato). O valor inicial é **Não informado**; cadastros existentes não recebem um sexo presumido.

| Opção no LHISP | Valor no LHISP | Valor enviado à Turbomed |
|---|---|---|
| Não informado | `null` | Impede uma nova adesão até o preenchimento |
| Feminino | `1` | `0` |
| Masculino | `2` | `1` |
| Indiferente | `9` | `2` |

**Não informado** e **Indiferente** são opções distintas. O LHISP não converte automaticamente a ausência de informação em Indiferente.

Mantenha nome, CPF e data de nascimento corretos. Datas inválidas ou futuras impedem uma nova adesão. E-mail e telefone da pessoa e o endereço do contrato complementam o envio quando disponíveis.

## Operação do OTT no contrato

Após contratar o serviço com o plano configurado, utilize o fluxo de **OTT** do contrato e confira o retorno do processamento e o resultado na plataforma Turbomed.

| Operação | Comportamento implementado |
|---|---|
| Cadastro sem adesão correspondente | Envia uma nova adesão para o CPF e código Onix configurados. |
| Cadastro com adesão correspondente | Reutiliza o cartão encontrado e envia ativação com status `0`, sem criar uma nova adesão. |
| Desbloqueio / reativação | Envia status `0` para o cartão e código Onix correspondentes. |
| Bloqueio | Envia status `2`, o mesmo código utilizado no cancelamento. |
| Cancelamento ou remoção do OTT | Envia status `2`; não solicita exclusão do beneficiário na plataforma. |

> **Status provisórios:** o dicionário oficial ainda aguarda confirmação do suporte da Turbomed. Por definição provisória desta integração, **`0` significa ativo** e **`2` significa cancelado**. O bloqueio também usa `2`. Essa convenção está registrada em comentário no código e deverá ser revista após a resposta do parceiro. Não a trate como dicionário oficial confirmado.

Antes de alterar o status, o LHISP consulta os contratos do CPF e seleciona o código Onix configurado. Se houver mais de um cartão para o mesmo código, a operação é interrompida para conferência. Bloqueio, desbloqueio e cancelamento também são interrompidos quando não existe a adesão correspondente ou falta o número do cartão.

## Limites atuais

- **Edição cadastral:** alterações posteriores dos dados da pessoa não são enviadas por esta integração. A operação retorna erro indicando que a atualização deve ser realizada na plataforma.
- **Troca de plano Onix:** a atualização automática do OTT retorna erro. É necessário coordenar o cancelamento do Onix anterior e o cadastro do novo, conferindo ambos no parceiro. Não considere a troca concluída apenas por alterar o plano no LHISP.
- **Vários contratos da mesma pessoa:** a identificação externa usa CPF e Onix, sem distinguir contratos LHISP com essa mesma combinação. Confira outros vínculos antes de bloquear ou cancelar uma adesão compartilhada.
- **Confirmação externa:** os testes locais da implementação não substituem a homologação com credenciais e beneficiários autorizados pelo parceiro, especialmente enquanto o dicionário de status estiver pendente.

## Problemas comuns

| Problema / mensagem | Como tratar |
|---|---|
| Informe apiKey e companyId | Preencha os dois campos com os dados fornecidos pela Turbomed. |
| Falha na comunicação com a API | Confira credenciais, disponibilidade da API e o status HTTP retornado. |
| Informe o sexo da pessoa | Selecione Feminino, Masculino ou Indiferente conforme a informação do cadastro. |
| Informe uma data de nascimento válida | Corrija a data da pessoa antes de solicitar nova adesão. |
| Configure o código Onix nos recursos OTT do plano | Revise o gateway e o produto associados ao plano. |
| Contrato não encontrado para o código Onix configurado | Confira o CPF e o produto contratado na Turbomed. |
| Mais de um cartão para o mesmo código Onix / contrato sem número do cartão | Solicite conferência na plataforma antes de repetir a operação. |
| Operação recusada pela API | Verifique os dados e o resultado na plataforma; um HTTP 200 pode conter recusa da operação. |

Para solicitar atendimento, registre horário, identificação interna do contrato, produto Onix e mensagem retornada, sem divulgar credenciais ou dados pessoais desnecessários. Consulte [Contato com o suporte](/suporte/contato-suporte).

Referência do parceiro: [Documentação da API Turbomed](https://docs.turbomed.com.br/).
