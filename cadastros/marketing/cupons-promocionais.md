---
title: Cupons promocionais
published: true
editor: markdown
description: Disponibilize benefícios de parceiros no aplicativo do cliente e controle elegibilidade e resgate individual.
---

# Cupons promocionais

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.

Cupons são benefícios de parceiros exibidos ao cliente no LHSAC. Cada registro contém um código ou link e pode ser limitado por validade, localização, plano e adimplência. O resgate é de uso único: o sistema associa o cupom à pessoa, ao contrato elegível e à data de utilização.

Esta funcionalidade não aplica desconto em mensalidade. Para descontos financeiros do serviço, use [Promoções](/cadastros/administrativo/promocoes).

## Elegibilidade no aplicativo

Um cupom só é oferecido quando:

- ainda não foi usado por outra pessoa;
- a data atual está entre o início e o fim, quando definidos;
- a pessoa possui contrato **Ativo**;
- UF, cidade e bairro do endereço de instalação coincidem com os filtros informados;
- o contrato possui o plano específico, quando configurado, em serviço que não esteja cancelado nem desativado;
- se **Somente adimplente** estiver ativo, a pessoa não tem conta aberta vencida em nenhum de seus contratos.

Na inadimplência, a rotina considera prorrogação: uma conta é vencida quando o vencimento original, sem prorrogação, ou a data prorrogada já passou. A restrição é por pessoa, não apenas pelo contrato que atende ao plano/localização.

## Parceiros e código

O código atual aceita **Uber** e **iFood**. **Cupom (texto ou link)** é o conteúdo entregue ao cliente apenas no resgate; a consulta de disponíveis omite o código para evitar exposição antecipada.

O mesmo texto/link não pode ser repetido para o mesmo parceiro, mas pode existir para parceiros diferentes.

## Cadastrar

1. Acesse **Cadastros > Marketing > Cupons Promocionais**.
2. Pesquise por descrição ou código e filtre situação, validade, local, plano e adimplência.
3. Clique em **Cadastrar**.
4. Informe descrição, parceiro e o código/link.
5. Defina início e fim; o fim não pode ser anterior ao início.
6. Preencha somente os filtros territoriais necessários. Estado condiciona a lista de cidades.
7. Selecione um plano quando o benefício for exclusivo daquela oferta.
8. Marque a exigência de pagamentos em dia quando aplicável e salve.

Inclusão, edição e exclusão usam `cupom_add`, `cupom_edit` e `cupom_del`.

## Resgate e auditoria

O LHSAC revalida todas as condições dentro de uma transação e bloqueia o registro durante o resgate, evitando que duas pessoas consumam o mesmo cupom simultaneamente. Em seguida grava pessoa, primeiro contrato elegível e horário.

Na administração, cupons usados aparecem com situação, pessoa e contrato e a linha recebe destaque. O botão de exclusão fica desabilitado e o backend principal também recusa apagar cupom com `PessoaId` preenchido. Preserve o registro para auditoria.

Editar um cupom disponível muda sua elegibilidade imediatamente. Evite alterar código/link de item já divulgado. Cupons não utilizados podem ser excluídos.

| Problema | Verificação |
|---|---|
| Cupom não aparece no app | Confira validade, contrato ativo, endereço, plano e inadimplência da pessoa. |
| Cliente em dia considerado inadimplente | Procure contas vencidas em todos os contratos da mesma pessoa, considerando prorrogações. |
| Código duplicado | O mesmo parceiro já possui esse texto/link. |
| Não é possível apagar | O cupom já foi resgatado e deve permanecer como histórico. |
| Cupom associado a contrato inesperado | Quando há vários elegíveis, a rotina grava o primeiro retornado. |

![Cupons promocionais](/assets/screenshots/cadastros/marketing/cupons-promocionais.png)
