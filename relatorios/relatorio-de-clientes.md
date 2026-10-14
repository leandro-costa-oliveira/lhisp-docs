---
title: Relatório de Clientes
published: true
editor: markdown
description: Consulte base de contratos, serviços vigentes, valor mensal e distribuição por filial com exportação CSV.
---

# Relatório de Clientes

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.

O relatório em `/relatorios/clientes` reúne base de clientes, serviços contratados e valor mensal. O resumo conta **contratos distintos**, enquanto cada linha detalhada representa um **serviço contratado**. Uma pessoa com dois contratos pode contar duas vezes na base; um contrato com dois serviços pode ocupar duas linhas.

## Filtros

| Campo | Regra |
|---|---|
| **Pesquisar** | Busca parcial por número do contrato, nome, CPF/CNPJ, e-mail e telefones 1 e 2; máximo de 100 caracteres. A pesquisa atualiza a consulta ao mudar o texto. |
| **Filial** | Restringe à filial escolhida; usuários não administradores permanecem limitados às filiais vinculadas ao seu acesso. |
| **Incluir clientes VIP** | Começa desmarcado. Inclui contratos com serviço de valor zero e sem serviço vigente de valor positivo; contratos com serviços pagos e gratuitos já podem aparecer sem essa opção. |
| **Data de referência** | Em **Mais filtros**, limita a data de cadastro do contrato até o dia indicado; começa na data atual. |
| **Tipo de pessoa** | Física ou jurídica. |
| **Categoria** | B2C ou B2B do contrato. |
| **Segmento** | Segmento vinculado ao contrato. |
| **Plano** | Plano do serviço contratado. |
| **Incluir serviços bloqueados/suspensos** | Ambos começam marcados. Serviços ativos sempre integram o recorte de situações. |

Filial, VIP e filtros avançados são aplicados pelo botão de consulta ou por **Exibir** no painel lateral. **Limpar filtros** limpa os campos avançados do formulário; aplique a consulta para obter o novo resultado.

## Data de referência e limites da leitura

O relatório considera contratos **atualmente ativos e não apagados**, cadastrados até a data de referência. A situação, o plano, a quantidade e os valores dos serviços são os dados atuais. Selecionar uma data passada não reconstrói a base como ela era naquele dia.

Por isso, exportações antigas e novas podem divergir mesmo usando a mesma data. Para comparação com o dashboard de inadimplência, mantenha data, filial e opção de VIP iguais, conferindo também os critérios próprios de cada tela.

## Indicadores e grade

- **Base de clientes:** contratos distintos no resumo.
- **Serviços contratados:** contagem dos serviços nas situações incluídas.
- **Faturamento mensal:** soma dos valores mensais calculados para os serviços; não é dinheiro recebido nem total de contas emitidas.
- **Ticket médio:** faturamento mensal dividido pela base de contratos.

No cálculo atual, planos marcados como fracionados multiplicam o valor do serviço pela quantidade; os demais usam o valor do serviço diretamente. Confira esse resultado em planos por faixa ou escalonados antes de utilizá-lo para conciliação financeira.

O painel mostra distribuição por filial e detalhamento com contrato, filial, cliente/documento, contato, plano/quantidade, valor e situação. A tabela pagina os serviços em grupos de 50.

**Diferença possível entre resumo e grade:** a consulta do resumo usa associação opcional de serviços, enquanto a grade exige um serviço elegível. Um contrato ativo sem serviço nas situações escolhidas pode constar na base e não produzir uma linha detalhada. Não interprete a quantidade de linhas como a base de clientes.

## Exportar

**Exportar CSV** baixa todos os serviços devolvidos pela consulta aplicada, incluindo as demais páginas da grade. O arquivo contém contrato, filial, cliente, tipo de pessoa, CPF/CNPJ, telefones, e-mail, endereço, plano, quantidade, valor e situação.

A exportação fica indisponível durante a consulta ou sem linhas. O arquivo contém dados pessoais e deve ser compartilhado apenas com quem participa da análise.

Veja também [Contratos](/contratos/contrato) e [Planos](/cadastros/financeiro/planos).
