---
title: Caixas
published: true
editor: markdown
description: Pontos de movimentação usados para registrar entradas e saídas financeiras.
---

# Caixas

Um caixa representa o destino contábil-operacional em que o LHISP registra movimentações financeiras. Pode corresponder a um caixa físico, a uma conta bancária ou a outro controle de disponibilidade. Recebimentos, pagamentos, sangrias e lançamentos manuais alteram o saldo do caixa escolhido e ficam disponíveis na Gerência Financeira e nos relatórios de movimentação.

O cadastro também restringe as espécies aceitas pelo caixa: **dinheiro**, **cartão**, **cheque** e **outros**. Na baixa manual de uma conta a receber, o backend valida se a espécie escolhida é permitida pelo caixa e rejeita a operação quando ela não for compatível.

## Relações no financeiro

- **Contas a receber:** a baixa pode gerar uma entrada e associá-la à conta recebida.
- **Contas a pagar:** o pagamento gera uma saída ou associa uma movimentação já existente; estornos reabrem saldo conforme o valor desassociado.
- **Conta bancária:** pode ser vinculada a um caixa. Esse vínculo permite localizar a configuração bancária correspondente ao processar operações financeiras.
- **Conciliação:** movimentações importadas ou lançadas podem ser associadas a contas a pagar e receber.
- **Relatórios:** as movimentações alimentam fluxo de caixa e relatórios por usuário, data, espécie e caixa.

## Cadastro

1. Acesse **Cadastros > Financeiro > Caixas**.
2. Clique em **Cadastrar** ou abra um caixa existente.
3. Informe um nome único e reconhecível.
4. Marque somente as espécies que realmente podem transitar nesse caixa.
5. Salve.

| Campo | Efeito |
|---|---|
| **Caixa** | Nome exibido na seleção de caixa, movimentações e filtros. É obrigatório e não pode se repetir na empresa. |
| **Dinheiro** | Permite movimentações em espécie. |
| **Cartão** | Permite recebimentos ou lançamentos identificados como cartão. |
| **Cheque** | Permite operações com cheque. |
| **Outros** | Permite espécies que não pertençam às três anteriores. |

Em um cadastro novo, a SPA inicia as quatro espécies marcadas. Ajuste-as antes de salvar conforme a finalidade do caixa.

## Cuidados operacionais

- A aceitação da espécie é validada durante a baixa. Uma configuração restritiva pode impedir o recebimento mesmo que o usuário tenha permissão financeira.
- Alterar as espécies afeta novas operações; não modifica a espécie das movimentações já registradas.
- Antes de excluir um caixa, verifique movimentações, contas bancárias vinculadas e contas a pagar que o usem como referência.
- A exclusão é lógica. Ela não apaga o histórico financeiro já relacionado ao caixa.
- O acesso aos caixas também pode ser limitado pelas permissões e pelos caixas atribuídos ao usuário.

## Diagnóstico

| Situação | Verificação |
|---|---|
| Espécie não aparece ou baixa é recusada | Confirme se a espécie está habilitada no caixa selecionado. |
| Saldo inesperado | Consulte entradas, saídas, pagamentos, recebimentos e estornos no período. |
| Conta bancária não é localizada pelo caixa | Confirme o vínculo **Caixa** no cadastro da conta bancária. |
| Caixa não aparece para o usuário | Revise permissões e a relação de caixas liberados ao usuário. |

## Captura da tela

![Listagem de caixas](/assets/screenshots/cadastros/financeiro/caixas.png)
