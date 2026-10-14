---
title: Clientes com Mensalidades Pagas no Período
published: true
editor: markdown
description: Entenda a seleção legada de contratos por quantidade de títulos pagos e os limites da conferência de mensalidades.
---

# Clientes com Mensalidades Pagas no Período

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.

O relatório legado seleciona contratos a partir de títulos **pagos com vencimento no intervalo de meses**. O caminho interno é `/lgc/relatorios|clientes_mensalidades_pagas_no_periodo`.

**A seleção atual não comprova que todas as mensalidades de cada mês estão pagas.** Apesar do aviso da tela, a consulta conta títulos pagos e compara essa quantidade com o número de meses. Não verifica cada competência, não elimina contratos com outras contas abertas e não restringe o tipo a Mensalidade.

## Usar a consulta

1. Informe **Período Inicial** e **Período Final**, cada um com mês e ano.
2. Se necessário, escolha **Vencimento** e marque **Somente pagamentos em dias**.
3. Clique em **Exibir** e confira os contratos encontrados.
4. Use **Imprimir** ou **Download** somente depois de revisar o recorte.

Os períodos iniciam no mês corrente. O filtro usa o primeiro dia do mês inicial e o último dia do mês final, comparando **vencimento**, não data de pagamento. O campo Vencimento restringe o dia configurado no **serviço contratado**, e não extrai o dia de cada título. As opções vêm dos dias de vencimento configurados na empresa.

**Somente pagamentos em dias** usa a classificação de pagamento já gravada no título. Não recalcula atraso durante a consulta.

## Critério efetivamente aplicado

Para cada contrato, o sistema exige:

- contas na situação paga, com vencimento no intervalo;
- quantidade dessas contas maior ou igual à quantidade de meses, contando início e fim;
- quando informado, dia de vencimento do serviço igual ao escolhido;
- quando marcada, classificação de pagamento em dia.

Exemplo: numa consulta de janeiro a março, três títulos pagos com vencimento em janeiro podem atingir a quantidade exigida, mesmo com fevereiro ou março ainda abertos. Vários serviços no mesmo contrato também aumentam a contagem.

A consulta usa a empresa e o escopo de filiais da sessão. **O seletor Filial do formulário não é repassado à consulta nesta implementação.** Não o use como garantia de restringir o resultado a uma filial específica.

## Resultado e exportação

A listagem mostra **Filial, Contrato, Cliente, Endereço e Telefones** e conta contratos retornados. O endereço vem do contrato; uma pessoa com vários contratos pode aparecer várias vezes. O título interno do painel também usa a expressão “Contas a Pagar”, mas a origem é o contas a receber de clientes.

**Download** gera o CSV legado com esses dados de contato. A saída não possui cabeçalho de colunas nem quebra de linha explícita entre contratos; confira sua estrutura antes de importá-la em outra ferramenta. A impressão utiliza a listagem visual.

Para confirmar quitação, consulte cada contrato no [relatório de contas a receber](/relatorios/contas-a-receber) ou na [aba financeira do contrato](/contratos/gerar-contas-cliente), verificando competências, tipos, contas abertas, pagamentos parciais e negociações. Este relatório isolado não é uma certidão de adimplência.
