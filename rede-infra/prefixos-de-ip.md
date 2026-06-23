---
title: Prefixos de IP
published: true
editor: markdown
description: ''
---

# Prefixos de IP

> **⚠️ Rascunho gerado por agente**
>
> Esta página foi documentada a partir da tela equivalente no ambiente de demonstração do LHISP. A captura usada veio do demo e foi mantida sem marcações visuais.

## Objetivo

Consultar e administrar prefixos de IP no módulo de Rede/Infra, incluindo a visualização da árvore de sub-redes e o estado de ocupação de cada faixa.

## Quando usar

Use esta tela quando precisar:

- localizar um prefixo específico;
- navegar pela árvore de sub-redes;
- identificar faixas livres ou ocupadas;
- criar, editar ou remover prefixos;
- ajustar a quantidade de sub-redes exibidas.

## Pré-requisitos

- Estar autenticado no LHISP.
- Ter permissão para acessar o fluxo **Prefixos de IP**.
- Saber qual prefixo ou faixa será consultada.

## Passo a passo

1. Acesse **Rede/ Infra > Prefixos de IP**.
2. Confira os campos do prefixo carregado na tela.
3. Use **Anterior** e **Próximo** para navegar entre registros.
4. Use **Novo**, **Editar** ou **Apagar** conforme a operação desejada.
5. Ajuste **Exibir Até** para controlar a profundidade exibida na árvore.
6. Use **Procurar** quando precisar localizar uma faixa específica.
7. Observe a árvore de sub-redes para verificar faixas marcadas como **LIVRE** ou **EM USO**.

## Campos importantes

| Campo / ação | Descrição |
|---|---|
| **Id** | Identificador do prefixo exibido. |
| **Descrição** | Nome/descrição do prefixo. |
| **Prefixo** | Endereço base da faixa IP. |
| **Bitmask** | Máscara do prefixo. |
| **Exibir Até** | Profundidade máxima de sub-redes exibida. |
| **Anterior** | Navega para o registro anterior. |
| **Próximo** | Navega para o próximo registro. |
| **Novo** | Inicia o cadastro de um prefixo. |
| **Editar** | Coloca o registro atual em edição. |
| **Apagar** | Remove o prefixo atual. |
| **Salvar** | Salva alterações quando habilitado. |
| **Cancelar** | Cancela a edição quando habilitado. |
| **Procurar** | Abre a busca de prefixos. |
| **Ação principal** | Botão com ícone na área de ações do formulário. |

## Resultado esperado

- O prefixo selecionado aparece com seus campos principais preenchidos.
- A árvore mostra as sub-redes derivadas do bloco principal.
- Faixas ocupadas e livres ficam visíveis com seus respectivos status.

## Problemas comuns

| Problema | Como tratar |
|---|---|
| Não encontro o prefixo desejado | Use a busca ou navegue com **Anterior** / **Próximo**. |
| A árvore parece muito profunda | Reduza ou ajuste **Exibir Até**. |
| Os botões de salvar/cancelar ficam desabilitados | A tela provavelmente está em modo somente leitura. |

## Observações

- A rota observada no demo foi `/lgc/redeinfra%7Cipprefix`.
- A tela é renderizada dentro de um **iframe legado**.
- O prefixo exibido na captura era **CGNAT - TESTE**, com **Id 32**, **Prefixo 100.64.18.0** e **Bitmask 20**.
- A árvore mostrava várias sub-redes com estados **LIVRE** e alguns trechos marcados como **EM USO**.
- A captura limpa mostra o conteúdo do iframe sem anotações visuais.

## Dúvidas para revisão

- O botão com ícone na área de ações representa qual operação exata?
- A árvore principal é apenas leitura ou também permite edição direta?
- O campo **Exibir Até** influencia apenas a visualização ou também a consulta?

## Screenshots sugeridos

- Tela **Prefixos de IP** no demo: `assets/screenshots/rede-infra/prefixos-de-ip.png`

![Prefixos de IP no demo](/assets/screenshots/rede-infra/prefixos-de-ip.png)
