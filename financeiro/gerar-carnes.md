---
title: Gerar carnês
published: true
editor: markdown
description: Gere mensalidades de contratos em um período e registre as cobranças no meio de pagamento configurado.
---

# Gerar carnês

Esta rotina antecipa ou refaz o processamento que normalmente gera as mensalidades dos serviços contratados. Cada resultado é uma **conta a receber**; “carnê” não significa apenas um documento para impressão. Conforme a conta bancária do serviço, a cobrança também pode ser registrada em um gateway.

Use a tela para gerar mensalidades de um período específico, conferir antecipadamente quais títulos faltam ou processar contratos que não entraram na geração automática.

## Antes de gerar

- Confira no contrato se o serviço está ativo, tem valor maior que zero, período de faturamento válido e conta bancária definida.
- Revise a forma de cobrança do serviço: pós-paga ou pré-paga, dia de vencimento, desconto, quantidade e período mensal, anual, semanal ou quinzenal.
- Em contas integradas, valide as credenciais do gateway. Falha no registro externo elimina as contas criadas para aquele contrato e apresenta o erro na listagem.
- Prefira **Visualizar** antes de **Gerar**. A geração produz títulos financeiros reais.

## Filtros

| Campo | Efeito |
|---|---|
| **Filial** | Restringe os contratos à filial. Em branco, considera todas as filiais permitidas. |
| **Conta bancária** | Processa somente serviços contratados vinculados à conta escolhida. Em branco, cada serviço usa sua própria conta. |
| **Faturamento inicial/final** | Janela dos vencimentos a avaliar. As duas datas são obrigatórias e a inicial não pode ser posterior à final. |
| **Gerar contas de contratos bloqueados?** | Inclui contratos e serviços bloqueados. Sem a opção, somente contratos e serviços ativos entram no processamento. |
| **Gerar somente serviços com fidelidade?** | Oculta da resposta os serviços cuja fidelidade seja zero. Consulte a limitação abaixo antes de usar **Gerar**. |

## Visualizar e gerar

1. Informe o período e, se necessário, restrinja filial e conta bancária.
2. Clique em **Visualizar**. O sistema simula os títulos ausentes e mostra filial, contrato, cliente, serviço, vencimento, valor e total.
3. Revise o resultado, especialmente contratos bloqueados, valores proporcionais e conta bancária.
4. Clique em **Gerar** e confirme.
5. Verifique as linhas de erro e depois confira os títulos em **Financeiro > Gerência Financeira > Contas a receber**.

Na visualização, nenhum título é gravado nem enviado a gateway.

## Regras aplicadas

- O sistema percorre os serviços contratados elegíveis e não duplica mensalidade já existente para o mesmo serviço, ano e mês.
- O valor do plano fracionado é multiplicado pela quantidade. Nos planos fixo e escalonado, o valor do serviço contratado já representa a mensalidade total.
- A primeira cobrança pós-paga pode ser proporcional. O cálculo usa mês comercial de 30 dias e o limite de dias proporcionais configurado na empresa; períodos muito curtos podem ser acumulados na cobrança seguinte.
- Desconto do serviço contratado e retenção de ISS do cliente são transferidos para a conta gerada quando aplicáveis.
- As contas são agrupadas pela conta bancária antes do registro no gateway. Assim, contratos com serviços em bancos diferentes usam a integração correta.
- Uma falha é tratada por contrato: a linha fica destacada com a mensagem retornada e as contas daquele contrato criadas durante a tentativa são removidas.

## Limitação do filtro de fidelidade

Na implementação atual, **Gerar somente serviços com fidelidade?** é verificado depois que o sistema chama a geração do contrato. Portanto:

- em **Visualizar**, a opção restringe o que aparece;
- em **Gerar**, contas de serviços sem fidelidade também podem ser criadas, embora não apareçam na tabela final.
- o total apresentado é somado antes desse filtro e pode incluir valores de linhas ocultas.

Não use essa opção como garantia de exclusão financeira. Para uma geração realmente limitada, processe o serviço pela aba financeira do contrato ou revise os títulos gerados imediatamente depois.

## Diagnóstico

| Situação | Verificação |
|---|---|
| Nenhuma linha é exibida | Confirme o período, a situação do contrato e do serviço, o valor e se a mensalidade do mês já existe. |
| Serviço esperado não aparece | Confira a conta bancária selecionada, a situação do serviço e o filtro de contratos bloqueados. |
| Valor proporcional inesperado | Revise data de ativação, modalidade pré/pós-paga, primeiro vencimento e dias proporcionais da empresa. |
| Erro de conta bancária ou gateway | Corrija o vínculo/credenciais antes de repetir. A tentativa com erro não mantém as novas contas do contrato. |
| Título foi criado, mas não apareceu com filtro de fidelidade | É a limitação descrita acima; localize-o nas contas a receber. |

## Geração automática

A geração automática é executada por rotina do backend legado. Ela respeita a habilitação da empresa, pode ignorar contas bancárias marcadas para não gerar carnês automaticamente e calcula a antecedência pela conta bancária ou, na ausência dela, pelos dias configurados na empresa. A tela manual usa exatamente o período informado pelo operador.

![Tela Gerar carnês](/assets/screenshots/financeiro/gerar-carnes.png)
