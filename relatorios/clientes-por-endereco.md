---
title: Clientes por Endereço
published: true
editor: markdown
description: Localize contratos pelo endereço de instalação e confira o serviço representado na listagem legada.
---

# Clientes por Endereço

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.

O formulário legado `relatorios/clientes_enderecos` seleciona contratos pelo **endereço de instalação cadastrado no contrato**. Usa UF, cidade, bairro e identificador do logradouro/endereço; o endereço de cobrança não determina a seleção.

## Consultar

1. Abra o relatório com sessão autenticada e acesso ao formulário.
2. Use as buscas de **UF**, **Cidade**, **Bairro** ou **Endereço** para montar o recorte.
3. Para ampliar as situações, marque **Exibir cancelados**.
4. Clique em **Exibir** e confira contrato e endereço antes de **Imprimir**.

Escolher um nível mais amplo limpa seleções dependentes no formulário. Os filtros textuais enviados são de igualdade, não uma busca parcial digitada sobre a rua. A consulta não possui período nem exportação CSV própria.

## Situações e unidade

Sem **Exibir cancelados**, entram contratos com serviço ativo, bloqueado ou suspenso. Ao marcar a opção, o código retira essa restrição de situação; outras situações também podem aparecer, não somente cancelados. Serviços de valor zero são incluídos pela consulta deste relatório.

A listagem agrupa por **contrato** e mostra contrato, filial, cliente, endereço/referência, telefones, descrição do serviço, valor e situação. O total é de contratos retornados, não pessoas nem acessos físicos.

Em contratos com vários serviços, o agrupamento seleciona um serviço sem ordem definida. A descrição, o valor e a situação exibidos representam esse serviço, não necessariamente todos os serviços do endereço. Um contrato com plano gratuito e outro pago continua contando uma única vez.

## Conferência

Se um cliente esperado não aparecer, confira o endereço de instalação no contrato e as situações de seus serviços. Evite comparar o valor exibido com o faturamento total do contrato; abra a aba **Serviços** para esse levantamento.

Veja também [Endereços](/cadastros/administrativo/enderecos) e [Relatório de Clientes](/relatorios/relatorio-de-clientes).
