---
title: Prefixos de IP
published: true
editor: markdown
description: Inventário IPv4 legado, árvore de CIDRs, associações e observações de reserva.
---

# Prefixos de IP


## Objetivo

Consultar e administrar prefixos de IP no módulo de Rede/Infra, incluindo a visualização da árvore de sub-redes e o estado de ocupação de cada faixa.

Esta é a tela legada de inventário **IPv4**. Os prefixos usados para atribuição automática aos acessos são administrados nas abas IPv4 e [IPv6](/rede-infra/ipv6) dos [servidores](/rede-infra/servidores). Cadastrar um bloco aqui não cria, por si só, um pool no concentrador.

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

## Regras e ocupação

- No cadastro, informe descrição, IPv4 e máscara entre `/20` e `/31`. O sistema grava a descrição em maiúsculas e calcula rede, máscara e broadcast.
- **Adicionar CIDR** cadastra uma subdivisão; a divisão exige máscara maior que a do bloco selecionado e limitada a `/31`.
- A ocupação considera vínculos com redes, acessos, observações de reserva e subprefixos em uso. Uma observação pode reservar uma faixa mesmo sem contrato associado.
- **Exibir Até** limita a profundidade visual; não reduz nem libera o bloco.

As permissões principais são `ipprefix_add`, `ipprefix_edit` e `ipprefix_del`; incluir e apagar um CIDR usam também permissões específicas (`ipprefix_add_cidr` e `ipprefix_del_cidr`).

Revise associações antes de apagar um prefixo/CIDR ou remover subdivisões. As rotinas de exclusão de prefixo e de CIDR não verificam o estado **EM USO** antes de tentar excluir os registros; esse estado visual não é uma proteção automática contra exclusão.

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
| **Adicionar CIDR** | Abre o cadastro de uma subdivisão IPv4. |

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
| `Tamanho do Prefixo Inválido` | No cadastro, use uma máscara entre `/20` e `/31`. |
| Faixa aparece ocupada sem cliente | Confira redes vinculadas, observações e subprefixos abaixo dela. |

## Observações

- A rota observada no demo foi `/lgc/redeinfra%7Cipprefix`.
- A tela é exibida no demo.
- O cadastro não valida de modo abrangente todas as sobreposições; confira rede base e máscara no planejamento antes de salvar.


## Screenshots sugeridos

- Tela **Prefixos de IP** no demo: `assets/screenshots/rede-infra/prefixos-de-ip.png`

![Prefixos de IP no demo](/assets/screenshots/rede-infra/prefixos-de-ip.png)

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.
