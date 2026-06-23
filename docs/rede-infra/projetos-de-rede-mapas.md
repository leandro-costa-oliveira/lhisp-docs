---
title: Projetos de Rede - Mapas
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
5. Clique em **+** para cadastrar um novo projeto.
6. Use as ações da linha para operar o projeto listado.

## Campos importantes

| Campo / ação | Descrição |
|---|---|
| **Filial** | Filtro por filial do projeto. |
| **Descrição** | Filtro textual pelo nome do projeto. |
| Botão de busca | Aplica os filtros informados. |
| **+** | Abre o cadastro de um novo projeto. |
| Coluna **Id** | Identificador do projeto. |
| Coluna **Data/Hora** | Data e hora do cadastro/atualização. |
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
| Ações da linha não respondem | Recarregue a tela e tente novamente. |

## Observações

- A tela verificada no demo mostra a rota `/lgc/redeinfra|projetos`.
- Na listagem do demo, foi observado o projeto **TESTE** na filial **MATRIZ**.
- O bloco superior permite filtrar por **Filial** e **Descrição**.
- A tela usa um iframe legado dentro da navegação do demo.

## Dúvidas para revisão

- Quais ações exatas representam os botões da linha na versão atual do sistema?
- Existem outros filtros além de **Filial** e **Descrição**?
- O projeto listado é apenas um exemplo ou a tela contém regras de aprovação/ciclo de vida?

## Screenshots sugeridos

- `docs/assets/screenshots/rede-infra/projetos-de-rede-mapas.png` — captura limpa da tela de projetos de rede no demo.
