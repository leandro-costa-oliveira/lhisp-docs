---
title: Equipamentos Locados
published: true
editor: markdown
description: Consulta legada das locações em aberto por produto ou contrato, com filtros e limitações.
---

# Equipamentos Locados

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.

O relatório legado consulta locações de equipamentos cuja situação da locação é **LOCADA**. Não é saldo de almoxarifado nem histórico completo de todos os itens já devolvidos. O total representa quantidade locada, não número de contratos.

## Gerar a consulta

1. Abra **Relatórios → Equipamentos Locados** no menu legado.
2. Escolha **Filial**, **Categoria**, **Plano**, texto do **Produto** e situações do serviço.
3. Opcionalmente informe **Data Inicial** e **Data Final**, relativas à data de criação da locação.
4. Marque **Detalhado** para individualizar as linhas; desmarcado, a saída agrupa por produto.
5. Clique em **Exibir**. A listagem possui **Imprimir**.

Todas as situações de serviço começam marcadas. Situação do serviço e situação da locação são filtros diferentes: pode haver material ainda locado em serviço bloqueado ou cancelado.

| Modo | Colunas |
|---|---|
| Agrupado | Categoria, produto e soma das quantidades. |
| Detalhado | Contrato, cliente, serviço, categoria, produto, data da locação e quantidade. |

O texto de produto é procurado em qualquer posição do nome. A consulta não lista individualmente número de série, patrimônio ou MAC; use o controle patrimonial quando precisar identificar uma unidade física.

## Limites conferidos

Os arquivos de saída resolvem o **Plano** usando `CategoriaDAO`, embora o filtro SQL depois compare o ID com `SERVICO.ID`. Essa inconsistência pode ignorar o filtro ou usar um ID indevido. Confira o serviço na saída detalhada; não considere esse filtro homologado sem validação da versão instalada.

O DAO compara a data final diretamente com o valor recebido, sem acrescentar `23:59:59`. Uma data sem hora pode excluir locações feitas depois da meia-noite do último dia. Confira os registros dessa data ao fechar uma apuração.

Se um equipamento devolvido ainda aparece, confira a situação e o encerramento da locação no contrato. O relatório apenas lê registros; não confirma recolhimento nem altera estoque.

## Fontes conferidas

Comportamento confrontado com os checkouts locais em 14/10/2026. Não comprova a versão instalada nem execução com dados reais.

- `lhisp-php/web/form/relatorios/equipamentos_locados.php:23`
- `lhisp-php/web/form/relatorios/equipamentos_locados_listagem_agrupado.php:20`
- `lhisp-php/web/form/relatorios/equipamentos_locados_listagem_detalhado.php:20`
- `lhisp-php/web/inc/classes/LocacaoDAO.php:116`
