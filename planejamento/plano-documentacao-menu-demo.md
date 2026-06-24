---
title: Plano de documentação do menu do demo LHISP
published: true
editor: markdown
description: ''
---

# Plano de documentação do menu do demo LHISP

> **📝 Plano revisado**
>
> Este documento foi criado após a análise direta do menu do demo em `https://demo.lhprovedor.com.br/` com a conta `demo`.
> A migração incremental está concluída para quase todo o menu, mas a árvore **Relatórios** ainda precisa ser documentada em páginas individuais.

## Objetivo

Documentar *todos* os itens de menu visíveis no demo do LHISP, mantendo a navegação do `lhisp-docs` alinhada com o que foi confirmado na interface.

## Escopo confirmado no demo

A análise do menu revelou estas entradas de primeiro nível:

- **Atalhos principais**: Contratos, Almoxarifados, Agenda Técnica, Monitor de Redes, Gerência Financeira
- **Seções expansíveis**: Dashboards, Cadastros, Relatórios, Financeiro, Estoque, Rede/ Infra e Sistema

Dentro dessas seções, o demo expõe dezenas de páginas e subpáginas operacionais. O inventário do menu deve ser tratado como a fonte de verdade para a fila de documentação.

## Diretriz de documentação

Para cada item do menu:

1. criar ou atualizar uma página `.md` em `docs/{modulo}/{slug}.md`;
2. registrar o título no padrão exibido pelo LHISP;
3. capturar screenshot limpa do demo quando a tela existir;
4. anotar em **Dúvidas para revisão** qualquer regra que não tenha sido validada;
5. manter `mkdocs.yml` atualizado com a nova página;
6. manter este plano atualizado enquanto a migração estiver em andamento, marcando o item como concluído quando a documentação for publicada.

## Itens já documentados no repositório

Os seguintes blocos já possuem páginas no `lhisp-docs` e servem como base para o restante da migração:

- **Contratos**: contrato, cadastrar novo cliente, adicionar serviço contratado, adicionar acesso ao cliente, gerar contas do cliente
- **Financeiro**: remessa bancária, NFCom
- **Cadastros**: documentos, Condomínios, Endereços, Filiais, Feriados, Promoções, Santander, Pessoas, Pre Cadastros
- **Rede/Infra**: servidores, IPv6, CGNAT, prefixos de IP, monitor de redes, BRAS Huawei, OLT Huawei, OLT V-Solutions, Switchs Huawei, bloqueio judicial com o Bind, Mikrotik
- **Sistema**: API Parceiros, Google Maps, Campsoft, Bit Health, Cobrança Terceirizada, Megazap, Seventh - Dguard, Telegram, Watch Tv, notificações por SMS
- **Páginas institucionais**: LHSAC Privacy Policy, NFibra Privacy Policy
- **Misc**: Exportar Boletos do Gerencianet

## Backlog de documentação por milestone

### Milestone 1 — Atalhos principais do menu

Criar páginas para os atalhos diretos do topo do menu:

- [x] Contratos
- [x] Almoxarifados
- [x] Agenda Técnica
- [x] Monitor de Redes
- [x] Gerência Financeira

### Milestone 2 — Dashboards

- [x] Dashboard Comercial

### Milestone 3 — Cadastros

#### Administrativo

- [x] Endereços
- [x] Filiais
- [x] Condomínios
- [x] Feriados
- [x] Promoções
- [x] Documentos *(já documentado; revisar apenas se houver ajuste de navegação)*

#### Financeiro

- [x] Caixas
- [x] Planos
- [x] Centros de Custo
- [x] Contas Bancárias
- [x] Despesas
- [x] Formas de Pagamento
- [x] Categorias
- [x] Santander *(já documentado; manter referência histórica se necessário)*

#### Estoque

- [x] Almoxarifados
- [x] Categorias *(não documentado; tela vazia no demo)*
- [x] Produtos
- [x] Kits *(não documentado; tela vazia no demo)*

#### Outros cadastros visíveis

- [x] Pessoas
- [x] Pre Cadastros
- [x] Cupons Promocionais

### Milestone 4 — Relatórios

A árvore de relatórios do demo foi comparada com a documentação do repositório e agora está coberta em páginas individuais.

#### Lote 4.1 — Relatórios operacionais

- [x] Fluxo de Caixa
- [x] Acessos por Rede
- [x] Ativações / Cancelamentos
- [x] Contas a Receber
- [x] Contratos Sem Serviço
- [x] Contratos Sem Acesso
- [x] Acessos Desconectando
- [x] Equipamentos Locados
- [x] Contratos Sem Mensalidade
- [x] Bilhetagem dos Acessos
- [x] Movimentações Financeiras por Usuário

#### Lote 4.2 — Relatórios de clientes

- [x] Clientes por Filial
- [x] Clientes para Cobrança
- [x] Clientes Cancelados
- [x] Clientes Bloqueados
- [x] Clientes por Endereço
- [x] Relatório de Endereços
- [x] Clientes VIP
- [x] Clientes por Fidelidade
- [x] Lista de Clientes por Plano
- [x] Clientes por Aceite
- [x] Clientes Negativados - SPC
- [x] Clientes Suspensos
- [x] Clientes Sem Email
- [x] Relatório de OTT / SVA
- [x] Contas a Receber por Cliente
- [x] Clientes por Plano
- [x] Clientes com Mensalidades Pagas no Período
- [x] Top N Clientes com mais Ordens de Serviço
- [x] Top N Clientes com Mais Atendimentos

#### Lote 4.3 — Relatórios financeiros, técnicos e analíticos

- [x] Alteração de Plano
- [x] Acessos com Velocidade Alterada
- [x] Movimentações de Produtos
- [x] Projeções e Recebimentos
- [x] Registro.BR
- [x] Relatório Fiscal de Regime de Caixa
- [x] Vendas por Vendedor
- [x] Contas a Pagar
- [x] Notificações dos Contratos
- [x] Anatel - Trimestral
- [x] Relatório de Uso de Banda
- [x] Relatório de Usuários Voip
- [x] Relatório de Estoque
- [x] Relatório de Consultas Spc Brasil
- [x] Relatório de Fornecedores
- [x] Relatório de Atendimentos por Canal
- [x] Relatório de Ordens de Serviço
- [x] Comissão de Técnicos por Ordem de Serviço
- [x] Tempo Médio de Execução de Ordens de Serviço
- [x] Relatório de Atendimentos
- [x] Upgrades / Downgrades de Plano
- [x] Adimplência por vencimento

### Milestone 5 — Financeiro

- [x] Gerência Financeira
- [x] Impressão de Carnês
- [x] Remessa Bancária *(já documentado)*
- [x] Retorno Bancário
- [x] Gerar Carnês
- [x] Notas Fiscais
- [x] Bloqueios por Atraso
- [x] Reajuste Serviços Contratados

### Milestone 6 — Estoque

- [x] Ordens de Separação
- [x] Notas Fiscais de Compra
- [x] Estoque por Funcionário
- [x] Remessa de Material

### Milestone 7 — Rede/Infra

- [x] Prefixos de IP
- [x] Servidores
- [x] Redes
- [x] Ferramentas *(não documentado; rota /null no demo)*
- [x] Importar Arq. Dude *(não documentado; tela quebrada no demo)*
- [x] Enviar Comandos
- [x] TC IRR
- [x] Setores
- [x] Monitor de Gráficos
- [x] GePON OLT
- [x] GePON PACSWITCH
- [x] Configurações Globais
- [x] GPON OLT
- [x] Projetos de Rede - Mapas
- [x] Central de Alertas
- [x] DNS Bloqueio Judicial

### Milestone 8 — Sistema

- [x] Trocar a Senha
- [x] Empresa
- [x] Usuários
- [x] Notificações em Massa
- [x] Banners Mobile
- [x] Ferramentas *(não documentado; rota /null no demo)*
- [x] Integrações
- [x] Cruzamento Arv. Csv com Contratos *(não documentado; tela em branco no demo)*
- [x] CampSoft
- [x] Fidelimax
- [x] Cobli
- [x] Google Maps
- [x] PlayHub
- [x] Owen Brasil
- [x] Alo Fone
- [x] Portabilidade de Celular
- [x] EiTV
- [x] Spc Brasil
- [x] Traccar
- [x] Leveduca
- [x] Watch Brasil
- [x] Xtream-UI
- [x] Megazap
- [x] ITTV
- [x] Serasa Limpa Nome
- [x] TC IRR
- [x] Cobranças Terceirizadas
- [x] Api Parceiros
- [x] A2Billing
- [x] Next Billing
- [x] D4Sign
- [x] Serasa Pefin
- [x] Urbis
- [x] Bit Health
- [x] LHNFE - NFCom
- [x] Configurações Notas Fiscais
- [x] CeliteHub
- [x] Templates de Email
- [x] Ações em Massa
- [x] Apagar Ott em Massa

## Ordem sugerida de execução por milestone

1. fechar os itens de alto uso operacional já visíveis no demo, agrupados nos primeiros milestones;
2. concluir as páginas com screenshot limpa disponível;
3. tratar as páginas sem equivalência 1:1 com o demo por último, registrando a limitação em **Observações**;
4. manter commits pequenos, preferencialmente um por página;
5. atualizar este plano a cada milestone concluído.

## Critérios de pronto

Um item do menu só pode ser marcado como concluído quando:

- a página Markdown existir em `docs/`;
- a navegação do `mkdocs.yml` apontar para ela;
- a screenshot do demo estiver salva no caminho correto, quando aplicável;
- a documentação estiver revisada contra a tela real;
- o git estiver commitado na branch `dev`.

## Observações

- Alguns rótulos do demo divergem do nome antigo da wiki; o demo é a referência final para captura e navegação.
- Itens como **Integrações** e **Relatórios** possuem muitas páginas filhas; por isso, o plano foi atualizado em lotes durante a migração.
- O menu do demo tem uma árvore extensa; a documentação seguiu a mesma granularidade, sem agrupar páginas distintas em um único texto.

## Encerramento

- O plano de documentação do menu do demo foi revisado após a validação direta do menu.
- A árvore **Relatórios** foi concluída e sincronizada com o `mkdocs.yml`.
- Este arquivo permanece como registro histórico do processo de migração.
