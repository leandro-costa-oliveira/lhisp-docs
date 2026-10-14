---
title: Acessos com Velocidade Alterada
published: true
editor: markdown
description: Comparação das velocidades cadastradas no acesso com as do plano, por filial.
---

# Acessos com Velocidade Alterada

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.

Este relatório legado identifica acessos cuja velocidade de **upload ou download cadastrada** difere do plano vinculado ao serviço. Compara registros do banco; não mede tráfego, testa velocidade nem consulta a configuração efetivamente aplicada no concentrador.

## Gerar e interpretar

1. Abra **Relatórios → Acessos com Velocidade Alterada** no menu legado.
2. Selecione uma **Filial**, ou deixe vazia para consultar o conjunto permitido pelo cadastro.
3. Clique no botão de pesquisa.
4. Compare **Velocidade do Plano** e **Velocidade Atual** em cada linha.

A saída mostra filial, contrato, cliente, usuário do acesso, MAC, IP e os dois pares de velocidade. A ordem é **upload / download**; os valores são os usados em Kbps pelo gerador Mikrotik. Não há seleção de período: a lista representa a diferença atual dos cadastros, não o histórico de alterações.

O critério é `ACESSO.DOWNLOAD != SERVICO.DOWNLOAD` **ou** `ACESSO.UPLOAD != SERVICO.UPLOAD`. Não exige que ambas as direções tenham mudado nem limita a consulta a reduções. Velocidades aumentadas, personalizações e reduções podem aparecer juntas. Valores nulos exigem conferência, pois comparação SQL com nulo não equivale a diferença numérica.

Antes de corrigir um acesso, confira plano, eventual exceção comercial e estado do serviço. Gerar a lista não restaura velocidades nem desconecta clientes. A mudança deve passar pela ação própria do acesso, seguida de validação no equipamento. A página de resultado não oferece exportador CSV específico.

## Se o resultado não corresponder ao esperado

- Acesso ausente: confira filial, vínculo ao serviço/plano e se existe diferença gravada em pelo menos uma direção.
- Banco igual ao plano, mas teste do cliente diverge: investigue aplicação no concentrador e conectividade; este relatório não detecta essa situação.
- Diferença legítima: mantenha evidência da exceção antes de uma atualização em lote.

## Fontes conferidas

Comportamento confrontado com os checkouts locais em 14/10/2026. Não comprova a versão instalada nem execução com dados reais.

- `lhisp-php/web/form/relatorios/rel_alteracao_de_velocidade.php:17`
- `lhisp-php/web/form/relatorios/rel_alteracao_de_velocidade_list.php:45`
- `lhisp-php/web/inc/classes/AcessoDAO.php:1533`
- `lhisp-php/web/inc/classes/Mikrotik.php:233`
