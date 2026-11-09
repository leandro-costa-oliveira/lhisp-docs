---
title: Comportamento de Pagamento dos Clientes
description: Analise a recorrência de atrasos, os meses sem atraso, o histórico de pagamentos e os valores em aberto da carteira, com filtros e exportação Excel.
published: true
editor: markdown
---

# Comportamento de Pagamento dos Clientes

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.

O dashboard permite identificar quais contratos costumam pagar no prazo e quais apresentam atrasos repetidos. Reúne a distribuição da carteira por comportamento, os valores mensais representados por cada perfil, o saldo atual em aberto e o histórico de títulos de cada contrato.

Acesse **Relatórios → Comportamento de Pagamento**. A tela também está disponível em `/dashboard/comportamento-pagamento` e `/relatorios/comportamento-pagamento`. Se o menu não estiver disponível, solicite ao administrador a conferência da atualização do sistema e do acesso ao menu no cadastro do usuário. Os dados respeitam as filiais permitidas ao seu acesso.

A unidade de análise é o **contrato**, embora a tela utilize o termo “clientes”. Um titular com vários contratos pode aparecer mais de uma vez. Não há consolidação por CPF ou CNPJ.

## Consultar a carteira

1. Escolha o período e os demais filtros.
2. Clique em **Aplicar**.
3. Confira os indicadores gerais e a distribuição por comportamento.
4. Clique em uma classificação para consultar os contratos desse perfil.
5. Clique no código ou nome do cliente para abrir seu histórico.

A consulta começa com **12 meses** e situação contratual **ATIVO**. Alterar os campos não atualiza os resultados até clicar em **Aplicar**. Os indicadores e as exportações utilizam os filtros já aplicados.

## Filtros e período analisado

| Campo | Como funciona |
|---|---|
| **Período** | Últimos 3, 6 ou 12 meses, incluindo o mês atual até a data da consulta. |
| **UF e cidade** | Selecione a UF para buscar a cidade. O filtro considera o endereço do contrato. |
| **Plano** | Seleciona os contratos que possuem o plano informado. A análise continua abrangendo os serviços e títulos do contrato inteiro. |
| **Tipo de cliente** | Pessoa física ou jurídica. Sem seleção, inclui ambos os tipos. |
| **Situação contratual** | Permite consultar contratos ativos, pendentes, cancelados, suspensos ou desativados, ou todas as situações. |

O período utiliza o **mês de vencimento** dos títulos, e não o mês em que o pagamento foi registrado. A janela inclui o mês atual parcial e os meses anteriores até completar a quantidade escolhida.

Exemplo: uma consulta de 3 meses feita em 8 de novembro considera vencimentos de **1º de setembro a 8 de novembro**. Uma mensalidade vencida em outubro e paga em novembro pertence ao mês de outubro. Títulos com vencimento futuro não entram no comportamento, mesmo que tenham sido pagos antecipadamente.

## Indicadores gerais

| Indicador | Interpretação |
|---|---|
| **Clientes analisados** | Quantidade de contratos encontrados com os filtros aplicados, incluindo os que estão sem histórico de pagamentos elegíveis. |
| **Mensalidade da carteira** | Soma dos valores cadastrados dos serviços vigentes: ativos, bloqueados ou suspensos. Não representa dinheiro recebido no período. |
| **Com títulos vencidos** | Contratos com saldo positivo em títulos atualmente abertos e vencimento anterior à data atual. |
| **Valor em aberto** | Saldo dos títulos atualmente abertos, incluindo vencidos, a vencer e acordos. Não se limita ao período do histórico. |

A mensalidade considera a quantidade nos planos marcados como fracionados. Serviços encerrados não compõem esse valor. Em contratos com vários serviços, o valor representa o conjunto dos serviços vigentes.

O saldo em aberto deduz pagamentos parciais e descontos cadastrados, limitado ao mínimo zero. Não acrescenta projeção de juros ou multa. Por isso, pode diferir do valor atualizado de uma cobrança para pagamento.

## Classificações por comportamento

A classificação conta **meses distintos com mensalidades pagas em atraso**. Um mês com vários títulos atrasados conta apenas uma vez.

| Perfil | Meses com atraso no período |
|---|---|
| **Pontual** | 0 ou 1 mês |
| **Ocasional** | 2 meses |
| **Recorrente** | 3 a 5 meses |
| **Muito recorrente** | 6 a 8 meses |
| **Crítico** | 9 a 12 meses |
| **Sem histórico** | Nenhuma mensalidade paga elegível para calcular o comportamento |

Para cada perfil, a tela apresenta quantidade de contratos, percentual em relação à carteira analisada e valor mensal representado pelos contratos do grupo. **Sem histórico** participa do total da carteira e dos percentuais, mas não representa um sexto nível de atraso.

As faixas são **absolutas** e permanecem iguais ao selecionar 3, 6 ou 12 meses. Não há projeção para um ano. Em uma janela de 3 meses, por exemplo, um contrato com atraso nos três meses fica em **Recorrente**. Os perfis superiores só aparecem quando há meses suficientes para alcançá-los.

### Como interpretar “Crítico”

O perfil indica **frequência de atraso**, sem ponderar a quantidade de dias, o valor devido ou a existência de dívida atual. Um contrato que pagou com apenas um dia de atraso em nove meses pode ser classificado como **Crítico**, mesmo que todas essas mensalidades estejam quitadas.

Confira a classificação junto com a **média de dias de atraso**, o histórico e os **valores atualmente vencidos**. O perfil, isoladamente, não comprova inadimplência atual nem constitui uma avaliação de risco de crédito.

Também é possível ter perfil **Pontual** e possuir títulos atualmente vencidos: títulos ainda não pagos aparecem nos saldos, mas não são tratados como pagamentos realizados em atraso.

## Detalhamento dos clientes

Clique em um perfil para filtrar a carteira. Clique novamente no perfil selecionado ou em **Todos os perfis** para voltar à lista completa.

A lista apresenta código e nome, telefone, planos vigentes, mensalidade, perfil, meses com atraso, pontualidade, média de dias de atraso, saldo em aberto e sua parcela vencida. A busca restringe por nome ou código dentro do perfil selecionado. A paginação exibe 25 contratos por página.

O campo **Meses com atraso** usa como referência os **meses com pagamentos elegíveis**, e não necessariamente todos os meses do período selecionado. Por exemplo, “2 de 4” significa dois meses atrasados entre quatro meses que tiveram pagamentos elegíveis.

### O que significa “Pontualidade”

Na versão atual, o percentual corresponde aos **meses sem nenhum pagamento atrasado**, entre os meses que tiveram mensalidades pagas elegíveis:

```text
Pontualidade = (meses com pagamentos elegíveis − meses com atraso)
               ÷ meses com pagamentos elegíveis × 100
```

Não é o percentual de títulos pagos em dia. Meses sem pagamentos elegíveis não aumentam nem reduzem esse percentual. Sem pagamentos elegíveis, a tela mostra **—**, em vez de zero.

Exemplo: em outubro, um título vence no dia 5 e é pago no dia 3, enquanto outro vence no dia 20 e é pago no dia 27. O primeiro é pontual, mas outubro conta como **mês com atraso** por causa do segundo. Se todos os meses analisados tiverem ao menos uma mensalidade paga em atraso, a pontualidade será **0%**, mesmo existindo títulos pagos antecipadamente.

A **média de dias de atraso** considera somente os pagamentos atrasados elegíveis. Pagamentos pontuais não entram como zero nessa média. A média é calculada por título atrasado, enquanto a classificação conta meses distintos.

## Histórico individual

Clique no código ou nome do cliente. O histórico mostra a ativação considerada, os meses com pagamentos elegíveis, o perfil, a pontualidade e os títulos do período, organizados pelo vencimento mais recente.

Para cada título, confira mês, identificação, vencimento, data efetiva do pagamento, dias de atraso e tratamento aplicado. Atrasos são medidos em **dias corridos**, comparando o vencimento original com a data efetiva do pagamento. O cálculo não ajusta automaticamente finais de semana, feriados ou prorrogações.

Pagamentos antecipados ou feitos no vencimento têm zero dias de atraso. Títulos fora do comportamento apresentam **—** nos dias de atraso, evitando atribuir atraso de pagamento a uma conta que ainda está aberta ou não é elegível.

## Regras de inclusão e exclusão

O comportamento considera **mensalidades regulares pagas**, com recebimento positivo e data efetiva de pagamento até a data atual. Outros tipos de cobrança não definem o perfil.

| Caso | Tratamento |
|---|---|
| **Título ainda aberto** | Não conta como pagamento atrasado. Compõe os saldos atuais e aparece separadamente no histórico do período. |
| **Pagamento parcial em título aberto** | Não transforma a conta em mensalidade paga elegível. O saldo considera a parcela ainda aberta. |
| **Título cancelado** | Fica fora do comportamento. Pode aparecer no histórico do período com indicação de cancelamento. |
| **Título negociado e parcelas de acordo ou negociação** | Ficam fora do comportamento para evitar distorções. Acordos ainda abertos podem compor os saldos atuais. |
| **Baixa sem valor recebido** | Não é considerada pagamento elegível para o comportamento. |
| **Contrato recente** | Considera a primeira ativação dos serviços. Na ausência dessa informação, utiliza o cadastro do contrato. Vencimentos anteriores ficam fora do comportamento. |
| **Serviço cancelado** | Preserva os pagamentos elegíveis de títulos com vencimento até o cancelamento. Vencimentos posteriores ficam fora do comportamento. |

O histórico pode, portanto, exibir mais títulos do que os utilizados no cálculo. A classificação depende do tratamento de cada título, e não apenas da presença de uma data de pagamento.

## Exportar para Excel

**Exportar Excel** gera um arquivo `.xlsx` com três abas:

- **Resumo:** filtros aplicados, indicadores gerais, grupos da carteira e identificação do perfil e da pesquisa usados na exportação.
- **Clientes:** todos os contratos que atendem aos filtros, ao perfil selecionado e à busca, incluindo as outras páginas da lista.
- **Regras:** critérios utilizados para interpretar os dados.

O resumo mantém os indicadores da carteira filtrada; a aba de clientes respeita também o perfil e a pesquisa. Por isso, a quantidade exportada pode ser menor que o total de clientes analisados.

No histórico individual, **Exportar histórico Excel** gera outro arquivo, com os títulos daquele contrato no período e uma aba de regras. Os arquivos não incluem imagens da tela e preservam os valores numéricos para análise em planilha.

## Usar o resultado na gestão

Para identificar atrasos recorrentes, escolha o período e compare frequência, dias de atraso e saldo vencido. Use os filtros e a exportação para organizar o acompanhamento da carteira e planejar ações de relacionamento e cobrança. A consulta não executa baixas, bloqueios, renegociações nem envio de mensagens.

Para analisar a dívida atual por filial e faixa de atraso, consulte o [Dashboard de Inadimplência](/dashboards/dashboard-inadimplencia). Para conferir contratos, serviços vigentes e valor mensal da base, veja o [Relatório de Clientes](/relatorios/relatorio-de-clientes).
