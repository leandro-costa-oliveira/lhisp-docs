---
title: Clientes sem E-mail
published: true
editor: markdown
description: Identifique contratos cujo titular tem e-mail vazio ou nulo, por filial, cadastro e situação.
---

# Clientes sem E-mail

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.

A tela `/relatorios/clientes_sem_email` consulta **contratos** cujo titular possui e-mail **nulo ou exatamente vazio**. Não valida sintaxe, existência da caixa postal, devoluções ou entrega de mensagens. Um endereço preenchido apenas com espaços também não é procurado por esses dois critérios.

## Consulta

- **Filial:** permite selecionar várias filiais; sem seleção adicional, mantém o escopo autorizado do usuário.
- **Data Inicial/Final:** referem-se ao cadastro do **contrato**, não ao cadastro da pessoa ou à ativação do serviço. O padrão é o ano atual.
- **Situação:** situação do contrato, não dos serviços individuais; vazio não restringe.

Abra o relatório com sessão e acesso ao menu/Contratos. Alterar os filtros muda a consulta. Confira filial, data de cadastro, número do contrato e nome do cliente na tabela. A mesma pessoa com dois contratos pode aparecer duas vezes.

## Saída e atualização

**Imprimir** usa a impressão do navegador. Não há exportação CSV, edição em lote ou envio de notificações nessa tela.

O botão **Atualizar** da implementação atual altera somente um contador local que não participa da consulta; ele não força nova leitura do servidor. Se houve correção em outra aba, recarregue a página para conferir o resultado com segurança.

Os limites de data são enviados sem expansão explícita do último dia para 23:59:59. Cadastros com horário no dia final podem exigir um limite posterior para conferência.

Para corrigir, abra a pessoa/contrato e atualize o e-mail após confirmar o contato com o titular. Essa mudança pode afetar todos os contratos da mesma pessoa. Veja também [Pessoas](/cadastros/pessoas) e [Notificações dos Contratos](/relatorios/notificacoes-dos-contratos).
