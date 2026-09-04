---
title: Produtos
published: true
editor: markdown
description: Defina os itens movimentados no estoque e as regras de rastreabilidade patrimonial e devolução.
---

# Produtos

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.

Produto é o cadastro mestre do material movimentado pelo LHISP. Entradas de compra, saldos de almoxarifado, remessas, estoque de técnicos, solicitações, ordens de separação, locações e patrimônios apontam para esse registro.

O cadastro define **o que** é o item e como deve ser controlado; a quantidade e a localização pertencem aos registros de estoque. Criar um produto não gera saldo.

## Identificação e unicidade

- **Categoria**, **Produto** e **Unidade** são obrigatórios.
- A unidade tem no máximo dois caracteres; padronize abreviações como `UN`, `MT` ou `KG`.
- A combinação categoria + nome + unidade deve ser única entre produtos ativos.
- **Preço** é o valor de referência do cadastro; custos efetivos também podem vir dos documentos e movimentações de entrada.

Pesquise antes de criar. Duplicar o mesmo item fragmenta saldo, conciliação de NF-e e histórico entre IDs diferentes.

## Controle patrimonial

**Habilitar Controle Patrimonial** transforma cada unidade relevante em um patrimônio individual. Esse modo permite rastrear localização, contrato/locação, técnico, nota de compra e histórico do equipamento.

As opções **Exigir Número de Série**, **Exigir Número de Patrimônio** e **Exigir Endereço MAC** definem identificadores obrigatórios no patrimônio. Ao salvar, qualquer uma dessas exigências habilita automaticamente o controle patrimonial, mesmo que a opção geral esteja desmarcada.

Use controle patrimonial para ONUs, roteadores, switches e outros equipamentos individualizáveis. Materiais consumíveis ou medidos por quantidade normalmente permanecem sem esse controle.

## Produto retornável

**Produto Retornável de Locação do Contrato** indica equipamento cedido ao cliente que deve retornar ao estoque no encerramento ou troca da locação. A marcação se relaciona com a aba de produtos/locações do contrato e com o histórico patrimonial; não significa que qualquer saída para técnico será revertida automaticamente.

## Fluxo recomendado

1. Cadastre primeiro a [Categoria](/cadastros/estoque/categorias).
2. Em **Cadastros > Estoque > Produtos**, pesquise nome e unidade.
3. Informe nome padronizado, categoria, unidade e preço de referência.
4. Defina se é retornável e se exige rastreabilidade individual.
5. Salve.
6. Para item patrimonial, teste uma entrada com série/patrimônio/MAC conforme as exigências.
7. Faça o saldo entrar por NF-e de compra ou [Entrada de Material](/estoque/entrada-de-material).

## Relação com NF-e e movimentações

Na importação de nota fiscal de compra, a conciliação relaciona o código/descrição/unidade do fornecedor ao produto interno e pode aplicar multiplicador. Depois, o item é lançado no estoque e, quando patrimonial, cada unidade precisa de patrimônio compatível.

Remessas e ordens de separação validam se produto, estoque e patrimônio correspondem. Um patrimônio sempre tem quantidade unitária e não pode ser movimentado como várias unidades numa única identificação.

## Alteração e exclusão

Renomear, trocar categoria/unidade ou mudar o controle patrimonial afeta operações futuras e a leitura do histórico. Não desative rastreabilidade de produto que já possui patrimônios sem antes avaliar os vínculos.

A exclusão da SPA é lógica. O produto some das consultas usuais, mas estoques, notas, patrimônios e movimentos podem continuar referenciando seu ID. Faça inventário e encerre saldos/vínculos antes de apagar. O fluxo legado possui comportamento diferente e remove também conciliações; prefira o procedimento atual da SPA.

| Problema | Verificação |
|---|---|
| Produto duplicado | Confira categoria, nome e unidade; os três formam a validação. |
| Categoria não aparece | Ela pode estar excluída ou pertencer a outro contexto da empresa. |
| Entrada exige série/patrimônio/MAC | O produto está sob controle patrimonial com exigências específicas. |
| Patrimônio rejeitado | Confirme produto, nota de compra, estoque e quantidade igual a um. |
| Produto removido ainda aparece no histórico | A exclusão é lógica e preserva referências anteriores. |

![Lista de produtos](/assets/screenshots/cadastros/estoque/produtos.png)

![Cadastro de produto](/assets/screenshots/cadastros/estoque/produtos-formulario.png)
