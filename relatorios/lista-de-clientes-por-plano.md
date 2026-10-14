---
title: Lista de Clientes por Plano
published: true
editor: markdown
description: Consulte serviços e contatos por plano e situação na listagem legada, com impressão e CSV.
---

# Lista de Clientes por Plano

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.

A lista nominal por plano permanece no formulário legado `relatorios/clientes_por_plano`. Ela é diferente do [gráfico Clientes por Plano](/relatorios/clientes-por-plano): retorna **uma linha por serviço contratado** com identificação e contato do titular.

## Consultar

1. Abra a lista com sessão e acesso ao formulário.
2. Localize o **Plano** pelo botão de busca; limpe a seleção para consultar todos os planos permitidos.
3. Escolha **Ativos e Bloqueados** (padrão), **Ativos**, **Bloqueados**, **Cancelados** ou **Todos**.
4. Clique em **Exibir**.
5. Use **Imprimir** ou **Baixar em CSV**.

Não há filtro de data de ativação, período, filial ou inclusão de VIP no formulário. Valores gratuitos entram se satisfizerem os outros critérios. As restrições de empresa/filial do usuário continuam aplicadas à consulta.

## Saída

A tabela mostra contrato, cliente, CPF/CNPJ, RG/inscrição estadual, telefones, e-mail, endereço, descrição do plano/serviço, dia de vencimento, valor do serviço e situação atual. O rodapé “Clientes” conta serviços; o mesmo titular ou contrato pode ocupar várias linhas.

O CSV contém contrato, nome, documentos, quatro telefones, e-mail, endereço, plano, vencimento, valor e situação. Ele exporta o resultado da seleção, não somente uma página.

## Limites conhecidos

O ramo que gera CSV não carrega as variáveis necessárias para montar corretamente o endereço. A tabela HTML também usa uma variável de contrato não definida para o número do endereço. Portanto, confirme endereço e número diretamente no cadastro ou utilize o CSV do [Relatório de Clientes](/relatorios/relatorio-de-clientes) quando esses campos forem necessários.

Após baixar CSV, clique em **Exibir** antes de tentar imprimir novamente: o botão de download altera o campo de formato do formulário. A seleção consulta o estado atual, sem histórico de planos anteriores.
