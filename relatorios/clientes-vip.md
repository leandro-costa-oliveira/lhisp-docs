---
title: Clientes VIP
published: true
editor: markdown
description: Liste serviços de valor zero por filial, tipo de pessoa e situação, com os limites da tela legada.
---

# Clientes VIP

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.

No relatório legado `relatorios/clientes_vip`, **VIP significa serviço contratado com valor exatamente zero**. Não é uma classificação de pessoa e não exige que todos os serviços do contrato sejam gratuitos.

## Consultar

1. Abra o relatório com sessão autenticada e acesso ao formulário.
2. Selecione **Filial** e **Tipo de Pessoa**, se necessário.
3. Marque as situações dos serviços: **Ativo**, **Bloqueado**, **Cancelado** e/ou **Suspenso**.
4. Clique em **Exibir** e confira os serviços de valor zero.
5. Use **Imprimir** para imprimir a listagem.

Ativos e bloqueados começam selecionados. Desmarcar todas as situações elimina a restrição de situação no DAO; isso não representa resultado vazio. Não existe filtro de período nem CSV próprio nessa tela.

## Resultado e unidade

A consulta retorna serviços de valor zero com dados de contrato, filial, pessoa e acesso quando disponível. A grade mostra contrato, filial, cliente, telefones, identificação/descrição do serviço, usuário/IP de acesso e situação.

O rodapé separa **Contratos** e **Serviços**. O mesmo contrato pode ter várias linhas; a identificação do contrato e da pessoa aparece apenas na primeira linha consecutiva desse contrato.

## Limitações da implementação

Trechos da listagem fazem referência a uma variável incorreta ao obter dados auxiliares e calcular o destaque visual. Podem ocorrer avisos PHP, células auxiliares ausentes ou cores inconsistentes. Confira o serviço diretamente no contrato antes de usar o resultado para alteração cadastral.

A opção **Incluir clientes VIP** do [Relatório de Clientes](/relatorios/relatorio-de-clientes) tem outro critério: inclui contratos sem serviço vigente de valor positivo. Portanto, os totais dessas duas consultas não são equivalentes em contratos com serviços gratuitos e pagos.
