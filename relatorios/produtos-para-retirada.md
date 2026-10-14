---
title: Produtos para Retirada
published: true
editor: markdown
description: Localize equipamentos retornáveis de serviços cancelados e gere ordens de retirada para as pendências filtradas.
---

# Produtos para Retirada

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.

O relatório em `/relatorios/produtos_para_retirada` identifica produtos que continuam locados ao cliente depois do cancelamento do serviço. Considera somente produtos marcados como **Retornável de Locação do Contrato**, locações ainda na situação **Locada** e serviços **Cancelados** no período escolhido.

## Consultar

1. Informe o **Período do cancelamento** do serviço, incluindo o dia inicial e o final.
2. Restrinja por filial e produto, se necessário.
3. Use **OS de retirada** para mostrar todos, somente com OS aberta ou somente sem OS aberta.
4. Pesquise pelo nome do cliente ou número do contrato.
5. Confira os indicadores e a grade antes de gerar ordens.

O período inicial cobre do primeiro dia de dois meses atrás ao último dia do mês atual. Ele se refere ao cancelamento, não à data de locação ou de agendamento da OS.

O relatório identifica como OS aberta os tipos **Retirada** e **Fast Loggi Retirada** ainda não concluídos. A existência de uma OS concluída não impede que uma locação ainda pendente apareça como sem OS aberta.

## Contagens

**Produtos para retirada** soma as quantidades das locações filtradas; o detalhe informa quantas locações compõem essa soma. **Contratos** conta contratos distintos. **Com OS de retirada aberta** e **Sem OS de retirada** contam serviços contratados, sem duplicar um serviço que tenha vários produtos.

A grade mostra contrato, cliente, filial, serviço/plano, produto, quantidade, locação, cancelamento, dias desde o cancelamento e OS. A paginação usa 50 locações. Os indicadores, gráficos e a impressão consideram todo o resultado filtrado, incluindo as outras páginas.

## Gerar OS faltando

O botão **Gerar OS faltando (N)** atua sobre **todos os serviços sem OS aberta do resultado filtrado**, e não apenas a página visível. Antes de executar, restrinja o recorte à carteira que deve receber a ação.

Após a confirmação, a tela atualiza a consulta e, para cada serviço ainda pendente, abre um atendimento e uma OS do tipo **Retirada**, sem técnico nem agendamento. Várias locações do mesmo serviço geram uma única OS. Conforme a configuração da empresa, o cliente pode ser notificado da abertura.

O processamento é sequencial por serviço, com indicação de progresso e resumo de falhas. **Sucessos anteriores permanecem se outro serviço falhar.** A abertura do atendimento e o salvamento da OS também são chamadas separadas: uma falha na segunda etapa pode deixar o atendimento aberto sem a OS. Confira a agenda e o contrato antes de repetir uma tentativa com erro.

Gerar a OS não dá baixa na locação nem devolve o equipamento ao estoque. A retirada física e o registro dos materiais devem seguir a execução da [Agenda técnica](/agenda-tecnica/agenda-tecnica).

## Retirada automática

Existe também uma rotina de servidor para serviços cancelados há uma quantidade configurada de dias e com material retornável ainda locado. Ela depende das preferências de OS da empresa e da execução operacional da rotina; este relatório não habilita nem agenda essa automação.

Consulte [Agenda técnica](/agenda-tecnica/agenda-tecnica) para as condições e os limites dessa rotina. Confirme com o suporte se ela está agendada na instalação.

| Situação | Verificação |
|---|---|
| Produto não aparece | Confira marcação retornável, locação ainda locada, vínculo ao serviço e cancelamento dentro do período. |
| Serviço aparece sem OS apesar de retirada antiga | Confira se a OS antiga foi concluída; o relatório procura somente ordens abertas. |
| Quantidade de OS menor que a de produtos | A geração agrupa por serviço contratado. |
| Lote terminou com erro | Confira as OS já criadas e eventuais atendimentos sem OS antes de repetir. |

Veja também [Produtos](/cadastros/estoque/produtos) e [Controle patrimonial](/estoque/controle-patrimonial).
