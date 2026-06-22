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
- [ ] Documentos *(já documentado; revisar apenas se houver ajuste de navegação)*

#### Financeiro

- [ ] Caixas
- [ ] Planos
- [ ] Centros de Custo
- [ ] Contas Bancárias
- [ ] Despesas
- [ ] Formas de Pagamento
- [ ] Categorias
- [ ] Santander *(já documentado; manter referência histórica se necessário)*

#### Estoque

- [x] Almoxarifados
- [ ] Categorias
- [ ] Produtos
- [ ] Kits

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
- [ ] Remessa Bancária *(já documentado)*
- [ ] Retorno Bancário
- [ ] Gerar Carnês
- [ ] Notas Fiscais
- [ ] Bloqueios por Atraso
- [ ] Reajuste Serviços Contratados

### 6) Estoque

- [ ] Ordens de Separação
- [ ] Notas Fiscais de Compra
- [ ] Estoque por Funcionário
- [ ] Remessa de Material

### 7) Rede/ Infra

- [ ] Prefixos de IP *(já documentado em parte; revisar a navegação real do demo)*
- [ ] Servidores *(já documentado)*
- [ ] Redes
- [ ] Ferramentas
- [ ] Importar Arq. Dude
- [ ] Enviar Comandos
- [ ] TC IRR
- [ ] Setores
- [ ] Monitor de Gráficos
- [ ] GePON OLT
- [ ] GePON PACSWITCH
- [ ] Configurações Globais
- [ ] GPON OLT
- [ ] Projetos de Rede - Mapas
- [ ] Central de Alertas
- [ ] Dns Bloqueio Judicial

### 8) Sistema

- [ ] Trocar a Senha
- [ ] Empresa
- [ ] Usuários
- [ ] Notificações em Massa
- [ ] Banners Mobile
- [ ] Ferramentas
- [ ] Integrações
- [ ] Cruzamento Arv. Csv com Contratos
- [ ] CampSoft
- [ ] Fidelimax
- [ ] Cobli
- [ ] Google Maps
- [ ] PlayHub
- [ ] Owen Brasil
- [ ] Alo Fone
- [ ] Portabilidade de Celular
- [ ] EiTV
- [ ] Spc Brasil
- [ ] Traccar
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
