---
title: Plano de documentação do menu do demo LHISP
---

# Plano de documentação do menu do demo LHISP

!!! note "Plano vivo"
    Este documento foi criado após a análise direta do menu do demo em `https://demo.lhprovedor.com.br/` com a conta `demo`.
    O objetivo é guiar a documentação incremental: uma página Markdown por item do menu, com screenshot limpa do demo sempre que houver tela equivalente.

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
6. manter este plano vivo, marcando o item como concluído quando a documentação for publicada.

## Itens já documentados no repositório

Os seguintes blocos já possuem páginas no `lhisp-docs` e servem como base para o restante da migração:

- **Contratos**: contrato, cadastrar novo cliente, adicionar serviço contratado, adicionar acesso ao cliente, gerar contas do cliente
- **Financeiro**: remessa bancária, NFCom
- **Cadastros**: documentos, Condomínios, Endereços, Filiais, Feriados, Promoções, Santander, Pessoas, Pre Cadastros
- **Rede/Infra**: servidores, IPv6, CGNAT, prefixos de IP, monitor de redes, BRAS Huawei, OLT Huawei, OLT V-Solutions, Switchs Huawei, bloqueio judicial com o Bind, Mikrotik
- **Sistema**: API Parceiros, Google Maps, Campsoft, Bit Health, Cobrança Terceirizada, Megazap, Seventh - Dguard, Telegram, Watch Tv, notificações por SMS
- **Páginas institucionais**: LHSAC Privacy Policy, NFibra Privacy Policy
- **Misc**: Exportar Boletos do Gerencianet

## Backlog de documentação por área

### 1) Atalhos principais do menu

Criar páginas para os atalhos diretos do topo do menu:

- [x] Contratos
- [x] Almoxarifados
- [x] Agenda Técnica
- [x] Monitor de Redes
- [x] Gerência Financeira

### 2) Dashboards

- [x] Dashboard Comercial

### 3) Cadastros

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
- [ ] Categorias *(não documentado; tela vazia no demo)*
- [x] Produtos
- [ ] Kits *(não documentado; tela vazia no demo)*

#### Outros cadastros visíveis

- [x] Pessoas
- [x] Pre Cadastros
- [x] Cupons Promocionais

### 4) Relatórios

Documentar a árvore de relatórios como páginas independentes, mantendo o nome da interface do demo como referência principal.

Prioridade sugerida:

1. Fluxo de Caixa
2. Contas a Receber
3. Clientes por Filial
4. Clientes para Cobrança
5. Utilização de IPs
6. Clientes Cancelados / Bloqueados / Suspensos
7. Relatórios de Redes
8. Relatórios de Agenda Técnica
9. Relatórios Financeiros
10. Relatórios de Estoque
11. Demais relatórios operacionais e analíticos

### 5) Financeiro

- [x] Gerência Financeira
- [x] Impressão de Carnês
- [x] Remessa Bancária *(já documentado)*
- [x] Retorno Bancário
- [x] Gerar Carnês
- [x] Notas Fiscais
- [x] Bloqueios por Atraso
- [x] Reajuste Serviços Contratados

### 6) Estoque

- [x] Ordens de Separação
- [x] Notas Fiscais de Compra
- [x] Estoque por Funcionário
- [x] Remessa de Material

### 7) Rede/ Infra

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

### 8) Sistema

- [x] Trocar a Senha
- [x] Empresa
- [x] Usuários
- [x] Notificações em Massa
- [x] Banners Mobile
- [x] Ferramentas *(não documentado; rota /null no demo)*
- [ ] Integrações
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
- [ ] Leveduca
- [ ] Watch Brasil
- [ ] Xtream-UI
- [ ] Megazap
- [ ] ITTV
- [ ] TC IRR
- [ ] Cobranças Terceirizadas
- [ ] Serasa Limpa Nome
- [ ] Api Parceiros
- [ ] A2Billing
- [ ] Next Billing
- [ ] Seventh - Dguad
- [ ] D4Sign
- [ ] Urbis
- [ ] Bit Health
- [ ] CelitHub
- [ ] Serasa Pefin
- [ ] LHNFE - NFCom
- [ ] Configurações Notas Fiscais
- [ ] Templates de Email
- [ ] Ações em Massa
- [ ] Apagar Ott em Massa

## Ordem sugerida de execução

1. fechar os itens de alto uso operacional já visíveis no demo;
2. concluir as páginas com screenshot limpa disponível;
3. tratar as páginas sem equivalência 1:1 com o demo por último, registrando a limitação em **Observações**;
4. manter commits pequenos, preferencialmente um por página;
5. atualizar este plano a cada lote concluído.

## Critérios de pronto

Um item do menu só pode ser marcado como concluído quando:

- a página Markdown existir em `docs/`;
- a navegação do `mkdocs.yml` apontar para ela;
- a screenshot do demo estiver salva no caminho correto, quando aplicável;
- a documentação estiver revisada contra a tela real;
- o git estiver commitado na branch `dev`.

## Observações

- Alguns rótulos do demo divergem do nome antigo da wiki; o demo é a referência final para captura e navegação.
- Itens como **Integrações** e **Relatórios** possuem muitas páginas filhas; por isso, o plano deve ser atualizado em lotes.
- O menu do demo tem uma árvore extensa; a documentação deve seguir a mesma granularidade, sem agrupar páginas distintas em um único texto.
