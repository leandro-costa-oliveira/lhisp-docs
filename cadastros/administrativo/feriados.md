---
title: Feriados
published: true
editor: markdown
description: Defina dias não úteis usados no cálculo financeiro de atraso, descontos e classificação de pagamentos.
---

# Feriados

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.

O calendário de feriados informa ao financeiro quais datas não são dias úteis. Ele participa do cálculo do primeiro dia útil após o vencimento, junto com sábados e domingos.

O cadastro **não muda automaticamente a data de vencimento gravada na conta**. Ele altera a interpretação do pagamento: até o próximo dia útil, a conta pode continuar sendo tratada como paga em dia e sem perda de desconto por pontualidade ou incidência de multa/juros, conforme a rotina usada.

## Onde a data é usada

- cálculo do valor a pagar e identificação de atraso;
- manutenção de descontos válidos somente até o vencimento/dia útil;
- classificação da baixa como pagamento em dia ou atrasado;
- relatórios financeiros que exibem o vencimento útil;
- cálculo de promoções vinculado ao próximo dia útil.

Exemplo: se a conta vence numa sexta-feira que está cadastrada como feriado, e segunda também é feriado, o próximo dia útil será terça-feira. O algoritmo avança por toda a sequência de feriados e fins de semana.

## Cadastrar e manter

1. Acesse **Cadastros > Administrativo > Feriados**.
2. Filtre o período e pesquise a data antes de criar o registro.
3. Clique em **Cadastrar**.
4. Informe uma descrição clara e a data do feriado.
5. Salve e confirme sua presença na listagem.

Descrição e data válida são obrigatórias. O registro pertence à empresa atual; mantenha feriados locais e estaduais apenas nos ambientes aos quais realmente se aplicam.

A integração **Google Maps** possui a opção **Importar Feriados Nacionais**, que pode alimentar esse calendário. Depois de habilitá-la, confira a listagem e complemente feriados estaduais ou municipais.

## Efeito temporal

Alterar ou excluir um feriado muda cálculos feitos posteriormente. A conta mantém vencimento e dados de baixa já gravados, mas uma nova consulta, simulação ou pagamento pode produzir classificação diferente. Evite modificar datas passadas sem avaliar conciliação, relatórios e atendimento ao cliente.

## Permissões e limitação conhecida

Inclusão e edição verificam `feriado_add` e `feriado_edit`. No backend atual, a exclusão verifica a permissão `filial_del`, embora a operação seja de feriado. Se **Apagar** estiver indisponível ou resultar em acesso negado, revise essa permissão com o administrador; não conceda acesso amplo sem avaliar o efeito sobre filiais.

| Problema | Verificação |
|---|---|
| Multa calculada no feriado | Confirme se a data está cadastrada na mesma empresa e se a rotina consultada usa o calendário do backend. |
| Feriado nacional ausente | Confira a opção de importação e cadastre manualmente quando necessário. |
| Data não aparece | Revise o intervalo da listagem. |
| Exclusão negada | O código atual exige `filial_del`. |
| Cliente espera vencimento alterado | Esclareça que o vencimento original permanece; o calendário ajusta o limite de dia útil. |

![Feriados no demo](/assets/screenshots/cadastros/administrativo/feriados.png)
