---
title: Projetos de Rede - Mapas
published: true
editor: markdown
description: Cadastro de projetos e operações de abrir, copiar, mover e excluir mapas de rede.
---

# Projetos de Rede - Mapas

## Objetivo

Documentar a tela de listagem e manutenção de **Projetos de Rede - Mapas** em **Rede/ Infra**.

## Quando usar

Use esta tela quando for necessário:

- consultar os projetos de rede cadastrados;
- filtrar por filial ou descrição;
- cadastrar um novo projeto;
- executar ações sobre um projeto existente;
- visualizar a lista de projetos já registrados.

## Pré-requisitos

- Acesso ao menu **Rede/ Infra > Projetos de Rede - Mapas**.
- Permissão para consultar e manter projetos.

## Passo a passo

1. Acesse **Rede/ Infra > Projetos de Rede - Mapas**.
2. Selecione a **Filial** desejada, se necessário.
3. Preencha a **Descrição** para filtrar resultados.
4. Clique no botão de busca para aplicar os filtros.
5. Clique em **+**, selecione a filial e preencha a descrição na janela **Novo Projeto**. Salve para criar o projeto.
6. Use **Abrir Projeto** na linha para editar seu mapa no [Monitor de Redes](/rede-infra/monitor-redes).
7. Confira o efeito de cada ação abaixo antes de confirmar.

## Operações da linha

| Ação | Efeito |
|---|---|
| **Abrir Projeto** | Abre o monitor no contexto do projeto selecionado. |
| **Copiar Projeto para o Mapa Principal** | Cria cópias dos POPs, splitters, cabos e enlaces previstos pela rotina no mapa principal; mantém o projeto original. |
| **Mover Projeto para o Mapa Principal** | Retira o vínculo de projeto dos POPs e cabos e marca o projeto como excluído, dentro de uma transação. |
| **Apagar Projeto** | Marca o projeto como excluído. A confirmação avisa que os itens internos serão apagados, mas essa action não percorre nem exclui os cadastros internos; não a use como limpeza garantida desses itens. |

O cadastro exige `projetos_rede_add`, a exclusão `projetos_rede_del` e as ações de copiar/mover exigem `monitor_add_torre`.

Antes de copiar ou mover, revise o projeto e os itens já existentes no mapa principal. Copiar novamente cria novos registros; não há deduplicação nessa rotina. A cópia também não possui uma transação única para todos os itens: após um erro, confira o que já foi criado antes de repetir.

## Campos importantes

| Campo / ação | Descrição |
|---|---|
| **Filial** | Filtro por filial do projeto. |
| **Descrição** | Filtro textual pelo nome do projeto. |
| Botão de busca | Aplica os filtros informados. |
| **+** | Abre o cadastro de um novo projeto. |
| Coluna **Id** | Identificador do projeto. |
| Coluna **Data/Hora** | Data e hora registradas no projeto. |
| Coluna **Filial** | Filial associada ao projeto. |
| Coluna **Descrição** | Descrição do projeto. |
| Ações da linha | Ações disponíveis para o item listado. |

## Resultado esperado

- A lista de projetos fica visível com os filtros aplicados.
- O usuário consegue abrir ou manter o projeto exibido.
- O usuário consegue iniciar o cadastro de um novo projeto.

## Problemas comuns

| Problema | Como tratar |
|---|---|
| Nenhum projeto aparece | Revise a filial e a descrição filtradas. |
| O botão de cadastro não abre | Verifique as permissões do usuário. |
| Copiar ou mover é recusado | Verifique `monitor_add_torre` e a mensagem retornada. |
| Cópia terminou com erro | Confira os itens já criados no mapa principal antes de repetir. |
| Projeto apagado, mas seus itens ainda existem | A action de exclusão marca apenas o projeto como excluído; revise os vínculos antes de qualquer limpeza. |

## Observações

- A tela verificada no demo mostra a rota `/lgc/redeinfra|projetos`.
- Na listagem do demo, foi observado o projeto **TESTE** na filial **MATRIZ**.
- O bloco superior permite filtrar por **Filial** e **Descrição**.
- A tela é exibida dentro da navegação do demo.


## Screenshots sugeridos

- `assets/screenshots/rede-infra/projetos-de-rede-mapas.png` — captura limpa da tela de projetos de rede no demo.

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.
