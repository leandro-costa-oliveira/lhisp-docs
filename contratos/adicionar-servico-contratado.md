---
title: Adicionar serviço contratado
published: true
editor: markdown
description: Vincule um plano ao contrato e defina cobrança, instalação, fiscal, fidelidade e automações do serviço.
---

# Adicionar serviço contratado

O serviço contratado é a cópia operacional de um plano dentro do contrato. Ele guarda preço, vencimento, quantidade, bancos, fidelidade, parâmetros técnicos e fiscais próprios. Alterações futuras no cadastro do plano não substituem automaticamente esses dados.

A inclusão pode ativar o serviço, abrir ordem de viabilidade, faturar instalação e reorganizar mensalidades futuras. Faça a revisão financeira antes de salvar.

## Incluir

1. Abra o contrato e acesse **Serviços**.
2. Clique em **Novo Serviço**.
3. Selecione o plano. A lista respeita a filial e a categoria B2C/B2B do contrato e normalmente mostra apenas planos ativos.
4. Revise os valores e opções copiados do plano.
5. Preencha vencimento e demais campos aplicáveis.
6. Salve e confira a situação, o histórico e os efeitos financeiros.

É necessária a permissão `contrato_add_servico`.

## Cobrança mensal

| Campo | Comportamento |
|---|---|
| **Plano** | Define recursos, preço-base, bancos, instalação, fiscal e ativação automática. Não pode ser trocado no mesmo modal após a contratação. |
| **Quantidade** | Mínimo 1. Nos planos fracionados multiplica o valor unitário; faixas/escalonamento podem recalcular o preço pelo intervalo da quantidade. |
| **Conta bancária [Boleto]** | Recebe as mensalidades e determina boleto, gateway, juros, multa e remessa. Sem seleção, usa a conta do plano. |
| **Conta bancária [Pix]** | Conta alternativa para geração/cobrança Pix; a lista contém somente contas habilitadas. |
| **Valor** | Valor próprio do serviço. Usuário sem administração de filial não pode reduzir abaixo do preço do plano; edição depende de `contrato_edit_valor_servi`. |
| **Desconto** | Usa o tipo de desconto do plano. Sem administração, não pode ultrapassar o máximo cadastrado. |
| **Vencimento** | Dia permitido pela configuração da empresa, entre 1 e 31. Orienta as mensalidades do serviço. |
| **Promoção** | Só é aceita quando o contrato cumpre as regras de elegibilidade; registra adesão e histórico. |
| **Fidelidade** | Prazo de 0 a 36 meses associado ao serviço. |

O cadastro cria o serviço como pós-pago e mensal no fluxo atual. A primeira mensalidade e eventual proporcionalidade dependem da data de ativação e das regras financeiras.

## Instalação

Quando o plano possui valor de instalação, informe conta bancária, valor, desconto, entrada, forma de pagamento e, quando disponível, limite de parcelas no cartão.

- Reduzir o valor de instalação exige `contrato_alt_inst`.
- O desconto respeita o máximo do plano e permissões do usuário.
- Sem parcelas na forma de pagamento, a entrada precisa cobrir o valor líquido da instalação.
- Se a empresa usa **Faturar instalação no serviço**, as contas são criadas já na contratação; caso contrário, use **Faturar Instalação** depois.
- Entrada e parcelas são registradas no gateway da conta de instalação quando a cobrança é integrada.

## Parâmetros técnicos

- **Tipo de IP** e **Tipo de equipamento** são copiados do plano; somente administração de filial pode alterá-los na contratação.
- Para B2B, **Tem infraestrutura já existente** registra a condição comercial/técnica usada pelo processo.
- Planos sem contratação automática ficam **PENDENTES** até ativação. Planos com contratação automática recebem contratação/ativação imediata e ficam **ATIVOS**.
- Se a empresa gera OS de viabilidade, a inclusão cria atendimento e ordem de serviço de viabilidade.

O serviço não cria sozinho um login PPPoE ou IP. Para isso, adicione o [acesso](/contratos/adicionar-acesso-cliente).

## Automações de cobrança

| Opção | Efeito |
|---|---|
| **Não enviar mensagens de cobrança** | Exclui o serviço das mensagens automáticas de cobrança. |
| **Não efetuar bloqueio automático** | Exclui o serviço do bloqueio por atraso; somente administração de filial pode definir. |
| **Não efetuar cancelamento automático** | Exclui da regra automática de cancelamento por inadimplência; em novos B2B inicia marcada. |
| **Enviar boletos por e-mail/WhatsApp** | Habilita os canais automáticos para as cobranças do serviço. |
| **Aceitar pagamentos por cartão** | Disponível quando a empresa possui integração Cielo/Getnet e aplicado na nova contratação. |
| **Cancelar contas automaticamente** | Controla cancelamento de títulos futuros quando o serviço for encerrado; em novos B2C inicia marcada e em B2B, desmarcada. |

Essas opções não enviam mensagens ou cancelam contas no momento do salvamento; elas orientam rotinas posteriores.

## Configuração fiscal

**Gerar Nota Fiscal** inclui o serviço nos fluxos fiscais. Confira manualmente o CFOP sugerido, sobretudo em operação interestadual, e a composição entre:

- SCM;
- SVA;
- provimento;
- ISS;
- locação em valor fixo.

Sobre o valor restante depois da locação, a soma dos percentuais SCM + SVA + provimento + ISS deve ser exatamente 100. Uma composição inválida impede a contratação. As opções **Exigir OTT para gerar SVA/ISS** condicionam essas parcelas à existência do OTT correspondente.

Não defina composição fiscal sem validação da contabilidade.

Na inclusão atual, **Enviar Notas Fiscais por Email** aparece no formulário, mas não é persistido pelo endpoint de contratação. Depois de criar o serviço, reabra **Editar**, marque a opção e salve os detalhes; é nesse fluxo que o campo é gravado.

## Efeitos financeiros ao contratar serviço ativo

Quando a contratação é automática e já existem mensalidades futuras de serviços com o mesmo vencimento, o backend recalcula o carnê até o último vencimento encontrado. Títulos futuros já associados a remessa podem ser cancelados e substituídos durante essa recomposição.

Depois de salvar:

1. abra a aba **Financeiro**;
2. confira contas canceladas e novas mensalidades;
3. valide valor agregado, desconto, vencimento, `NRDOC` e bancos;
4. verifique remessa/gateway antes de enviar qualquer cobrança ao cliente.

Esse efeito não ocorre como simples alteração visual do plano; envolve registros financeiros reais.

## Situações e ações posteriores

- **PENDENTE**: ativar, faturar instalação ou desativar por inviabilidade/outro motivo.
- **ATIVO**: alterar plano, bloquear, suspender, cancelar, gerar carnê ou faturar instalação.
- **BLOQUEADO**: desbloquear após tratar o motivo.
- **SUSPENSO**: reativar pelo fluxo específico.
- **CANCELADO**: pode ser reativado somente se a empresa permitir e o usuário tiver permissão.

Use **Histórico do Serviço** para auditar cadastro, promoção e mudanças. **Apagar** é administrativo e não substitui cancelamento; serviços com contas associadas podem ter restrições.

## Diagnóstico

| Situação | Verificação |
|---|---|
| Plano não aparece | Confira atividade, filial e categoria B2C/B2B do plano e contrato. |
| Valor foi recalculado | Plano com faixa/escalonamento usa a quantidade para resolver o preço. |
| Desconto/valor recusado | Confira máximos do plano e permissões do usuário. |
| Instalação não salva | Valide forma de pagamento, entrada, desconto e conta de instalação. |
| Composição fiscal inválida | A soma percentual sobre a parcela não locação precisa ser 100. |
| Envio de NF por e-mail ficou desmarcado | Reabra o serviço, marque a opção em **Editar** e salve os detalhes. |
| Serviço ficou pendente | O plano não usa contratação automática; siga o fluxo de viabilidade/ativação. |
| Mensalidades futuras mudaram | Revise a recomposição automática executada para serviço ativo com o mesmo vencimento. |

![Aba Serviços](/assets/screenshots/contratos/servicos-aba.png)

![Modal Contratação de serviço](/assets/screenshots/contratos/contratacao-servico-modal.png)
