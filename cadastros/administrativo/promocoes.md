---
title: Promoções
published: true
editor: markdown
description: Configure descontos vinculados aos serviços contratados, com vigência, filiais e prazo por adesão.
---

# Promoções

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.

Uma promoção é uma regra de desconto associada ao **serviço contratado**. Ela não reduz o preço-base do plano: durante a geração da mensalidade, o LHISP grava na conta a promoção, o tipo e o desconto aplicáveis. O valor efetivo pago depende também da pontualidade quando essa opção estiver habilitada.

## Elegibilidade e duração

Para selecionar uma promoção na contratação ou edição do serviço, ela precisa:

- estar associada à filial do contrato;
- já ter alcançado **Disponível a partir de**;
- não ter ultrapassado **Disponível até**, quando informado.

Essas datas controlam quando a promoção pode ser contratada. **Validade (meses)** controla por quantas competências o desconto vale para cada cliente, contando a partir da data de adesão gravada no serviço.

No cálculo do limite mensal, o backend alinha a primeira competência ao dia de vencimento do cliente e limita o dia a 28. Por isso, valide casos de adesão no fim do mês e vencimentos anteriores/posteriores ao dia da contratação.

## Tipos de desconto

- **Percentual:** maior que zero e no máximo 100%.
- **Fixo:** maior que zero e, no backend atual, menor que R$ 100,00.
- **Somente se pagamento em dias:** conserva o desconto até o próximo dia útil após o vencimento, considerando fins de semana e os [Feriados](/cadastros/administrativo/feriados) cadastrados. Depois disso, o desconto deixa de compor o valor a pagar.

Sem a opção de pontualidade, o desconto permanece na conta mesmo após o vencimento; multa e juros podem ser calculados separadamente.

## Cadastrar

1. Acesse **Cadastros > Administrativo > Promoções** e pesquise o nome.
2. Informe nome único e a observação que será exibida no boleto.
3. Defina o intervalo em que novas adesões serão permitidas.
4. Se o benefício for temporário por cliente, informe a validade em meses.
5. Escolha desconto percentual ou fixo e preencha o valor.
6. Defina se depende de pagamento em dia.
7. Selecione todas as filiais elegíveis e salve.
8. Faça uma contratação de teste e simule mensalidades dentro e fora do período promocional.

Inclusão, edição e exclusão exigem `promocao_add`, `promocao_edit` e `promocao_del`.

## Efeitos de mudanças

Editar a promoção altera a regra consultada em gerações e cálculos posteriores. Contas já criadas guardam a promoção e os dados de desconto aplicados no momento da geração; não presuma que a edição recalculará todo o contas a receber.

Ao trocar a promoção de um serviço contratado, o LHISP atualiza a data de adesão usada para contar os meses. Remover a promoção do serviço impede aplicação nas próximas mensalidades, sem cancelar contas existentes.

A exclusão é lógica e retira a promoção das seleções usuais. Antes de apagar, localize serviços e contas ainda associados para preservar rastreabilidade.

| Problema | Verificação |
|---|---|
| Promoção não aparece no contrato | Confira filial e datas de disponibilidade. |
| Desconto terminou antes/depois do esperado | Revise data de adesão, validade em meses, dia do vencimento e limite no dia 28. |
| Desconto perdido após vencimento | A opção de pagamento em dia está ativa; confira o próximo dia útil e os feriados. |
| Valor fixo rejeitado | O código atual exige valor menor que R$ 100,00. |
| Boleto sem observação | Confira o texto da promoção e se a conta foi gerada com ela. |

![Promoções no demo](/assets/screenshots/cadastros/administrativo/promocoes.png)
