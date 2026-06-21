---
title: Plano de exploração da Wiki LHISP
---

# Plano de exploração da Wiki LHISP

!!! info "Fase atual"
    Este arquivo contém apenas o plano de exploração gradual da wiki. Nesta etapa, **não** serão produzidas documentações de fluxo nem screenshots finais.

## Objetivo

Mapear a estrutura da wiki do LHISP de forma progressiva, começando pela navegação principal e avançando pelos módulos mais relevantes, para depois transformar cada descoberta em documentação operacional confiável.

## Status atual

| Etapa | Status | Evidência |
|---|---|---|
| Mapeamento da navegação principal | Concluído | grupos principais identificados na wiki |
| Abertura da página **Servidores** | Concluído | conteúdo lido e screenshot capturado no demo |
| Primeira página migrada para o repositório | Concluído | `docs/rede-infra/servidores.md` |
| Exploração da página **IPv6** | Concluído | conteúdo lido e screenshot capturado no demo |
| Página **IPv6** migrada para o repositório | Concluído | `docs/rede-infra/ipv6.md` |
| Exploração da aba **CGNAT** no demo | Concluído | screenshot capturado no demo |
| Screenshot de **CGNAT** migrada para o repositório | Concluído | `docs/rede-infra/cgnat.md` |
| Exploração de **Prefixos de IP** | Concluído | conteúdo lido e screenshot capturado no demo |
| Exploração de **Monitor de Redes** | Concluído | conteúdo lido e screenshot capturado no demo |
| Página **Monitor de Redes** migrada para o repositório | Concluído | `docs/rede-infra/monitor-redes.md` |
| Exploração de **BRAS Huawei** | Concluído | conteúdo lido e screenshot capturado no demo |
| Página **BRAS Huawei** migrada para o repositório | Concluído | `docs/rede-infra/bras-huawei.md` |
| Exploração de **OLT Huawei** | Concluído | conteúdo lido e screenshot capturado no demo |
| Página **OLT Huawei** migrada para o repositório | Concluído | `docs/rede-infra/olt-huawei.md` |
| Exploração de **OLT V-Solutions** | Concluído | conteúdo lido e screenshot capturado no demo |
| Página **OLT V-Solutions** migrada para o repositório | Concluído | `docs/rede-infra/olt-v-solutions.md` |
| Exploração de **Switchs Huawei** | Concluído | conteúdo lido e screenshot capturado no demo |
| Página **Switchs Huawei** migrada para o repositório | Concluído | `docs/rede-infra/switchs-huawei.md` |
| Exploração de **dns-bloqueio-judicial** | Concluído | conteúdo lido e screenshot capturado no demo |
| Página **Bloqueio Judicial com o Bind** migrada para o repositório | Concluído | `docs/rede-infra/dns-bloqueio-judicial.md` |
| Exploração de **Mikrotik** | Concluído | conteúdo lido na wiki; demo sem tela 1:1 |
| Página **Mikrotik: Criando Usuário** migrada para o repositório | Concluído | `docs/rede-infra/mikrotik-usuario.md` |
| Página **Mikrotik: Services** migrada para o repositório | Concluído | `docs/rede-infra/mikrotik-services.md` |
| Exploração de **Documentos** em cadastros > administrativo | Concluído | conteúdo lido na wiki e tela equivalente aberta no demo |
| Página **Documentos** migrada para o repositório | Concluído | `docs/cadastros/administrativo/documentos.md` |
| Exploração de **Remessa Bancária** em financeiro | Concluído | conteúdo lido na wiki e tela equivalente aberta no demo |
| Página **Remessa Bancária** migrada para o repositório | Concluído | `docs/financeiro/remessa-bancaria.md` |
| Exploração de **API de Integração para Parceiros** em sistema > integrações | Concluído | conteúdo lido na wiki e tela equivalente aberta no demo |
| Página **API de Integração para Parceiros** migrada para o repositório | Concluído | `docs/sistema/api-parceiros.md` |
| Demais grupos da wiki | Pendente | a iniciar |

## Escopo inicial observado

Na navegação principal da wiki, já foram identificados os seguintes grupos:

| Grupo | Observação inicial |
|---|---|
| `cadastros` | contém, ao menos, os diretórios **administrativo** e **financeiro** |
| `financeiro` | contém, ao menos, **notas-fiscais** e **remessa bancária** |
| `integracoes` | ainda pendente de exploração detalhada |
| `lhsac` | ainda pendente de exploração detalhada |
| `misc` | ainda pendente de exploração detalhada |
| `rede-infra` | contém páginas operacionais já visíveis na navegação |
| `sistema` | ainda pendente de exploração detalhada |
| `suporte` | ainda pendente de exploração detalhada |

No grupo **rede-infra**, foram vistos itens como:

- `dns-bloqueio-judicial`
- `mikrotik`
- `BRAS Huawei`
- `IPv6`
- `Monitor de Redes`
- `OLT Huawei`
- `OLT V-Solutions`
- `Servidores`
- `Switchs Huawei`

No grupo **financeiro**, foram vistos:

- `notas-fiscais`
- `remessa bancária`

## Estratégia de exploração

A exploração será feita em camadas:

1. **Mapeamento da árvore de menus**
   - descobrir o que existe em cada grupo;
   - registrar nomes exatos mostrados na interface;
   - identificar se há páginas raiz, subpastas ou páginas finais.

2. **Classificação por prioridade**
   - priorizar fluxos com maior impacto operacional;
   - separar o que é cadastro, consulta, manutenção e suporte.

3. **Documentação progressiva**
   - só transformar em documento definitivo aquilo que tiver sido observado e validado na wiki;
   - registrar dúvidas para revisão quando a regra não estiver clara.

4. **Validação visual**
   - sempre que um fluxo for explorado, registrar screenshot da tela principal e de eventuais modais ou abas importantes;
   - manter os caminhos das imagens organizados por módulo.

## Fases de exploração

### Fase 1 — Reconhecimento da navegação

**Objetivo:** entender a organização geral da wiki.

**Atividades:**

- abrir a página inicial;
- listar todos os grupos do menu principal;
- identificar quais itens são páginas e quais são diretórios;
- anotar as primeiras páginas úteis para cada grupo.

**Saída esperada:**

- mapa simples da navegação;
- lista dos grupos principais;
- lista dos primeiros nós filhos encontrados.

---

### Fase 2 — Exploração do grupo `rede-infra`

**Objetivo:** cobrir os fluxos mais operacionais primeiro.

**Ordem sugerida:**

1. **Servidores**
2. **Prefixos de IP**
3. **CGNAT**
4. **Cadastrar rede**
5. **IPv6**
6. **Monitor de Redes**
7. **Mikrotik**
8. **BRAS Huawei**
9. **OLT Huawei**
10. **OLT V-Solutions**
11. **Switchs Huawei**
12. **dns-bloqueio-judicial**

**Critérios de coleta:**

- tela inicial do fluxo;
- campos editáveis;
- botões de ação;
- mensagens de validação;
- abas e tabelas relacionadas;
- comportamento de gravação ou atualização.

**Saída esperada:**

- lista de páginas realmente úteis para documentação;
- priorização dos fluxos por relevância;
- identificação de possíveis dependências entre páginas.

---

### Fase 3 — Exploração do grupo `cadastros`

**Objetivo:** entender os cadastros de apoio ao restante do sistema.

**Subáreas já vistas:**

- `administrativo`
- `financeiro`

**Perguntas de exploração:**

- quais cadastros existem em cada subárea;
- quais formulários são usados com mais frequência;
- se existem tabelas de apoio reutilizadas por outros módulos.

**Saída esperada:**

- inventário das páginas de cadastro;
- identificação dos fluxos mais importantes para documentação futura.

---

### Fase 4 — Exploração do grupo `financeiro`

**Objetivo:** verificar os fluxos financeiros expostos na wiki.

**Subáreas já vistas:**

- `notas-fiscais`
- `remessa bancária`

**Foco da exploração:**

- ações permitidas;
- vínculos com contratos ou clientes;
- telas de geração, consulta e exportação;
- regras de validação e mensagens exibidas.

**Saída esperada:**

- descrição dos fluxos financeiros realmente documentáveis;
- decisão sobre quais páginas merecem documentação detalhada.

---

### Fase 5 — Exploração dos demais grupos

**Grupos pendentes:**

- `integracoes`
- `lhsac`
- `misc`
- `sistema`
- `suporte`

**Objetivo:** descobrir o que esses grupos contém e avaliar se há fluxos relevantes para documentação.

**Saída esperada:**

- lista de páginas encontradas;
- indicação do que é material de apoio, suporte ou operação;
- definição do que entra na próxima rodada de documentação.

## Critério para transformar exploração em documentação

Um fluxo só deve virar documento final quando tiver:

- nome exato da página ou modal;
- sequência de passos observada na interface;
- campos e botões conferidos visualmente;
- ao menos um screenshot de apoio;
- dúvidas registradas separadamente, se existirem.

## Registro de cada etapa

Para cada página explorada, registrar:

| Item | O que anotar |
|---|---|
| Caminho do menu | ex.: `rede-infra > Servidores` |
| Tipo de tela | lista, formulário, aba, modal, consulta, etc. |
| Ações principais | salvar, adicionar, filtrar, editar, excluir, exportar, etc. |
| Campos visíveis | nomes exatos da UI |
| Evidências | screenshots e observações |
| Dúvidas | qualquer regra não confirmada |

## Riscos e cuidados

- A wiki pode conter páginas com nomes parecidos; por isso, os nomes devem ser copiados exatamente como aparecem.
- Alguns itens podem ser apenas diretórios e não páginas finais.
- A exploração deve ser gradual para evitar misturar observações de páginas diferentes.
- Não assumir regra de negócio sem validação visual.

## Entregáveis desta fase

- este plano de exploração;
- lista priorizada de páginas a explorar nas próximas rodadas;
- base para os documentos finais de cada fluxo.

## Próximo passo sugerido

Começar pela **Fase 1** e, em seguida, seguir para **Rede/Infra** como primeira frente de documentação.
