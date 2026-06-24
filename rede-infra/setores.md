---
title: Setores
published: true
editor: markdown
description: ''
---

# Setores

> **⚠️ Rascunho gerado por agente**
>
> Esta página foi documentada a partir da tela equivalente no ambiente de demonstração do LHISP. A captura usada veio do demo e foi mantida sem marcações visuais.

## Objetivo

Administrar os setores de rede usados para organizar redes e filiais no módulo de **Rede/Infra**.

## Quando usar

Use esta tela quando precisar:

- consultar um setor;
- cadastrar ou editar um setor;
- associar filiais ao setor;
- manter a estrutura organizacional da rede.

## Pré-requisitos

- Estar autenticado no LHISP.
- Ter permissão para acessar o fluxo **Setores**.
- Saber qual setor será consultado ou alterado.

## Passo a passo

1. Acesse **Rede/ Infra > Setores**.
2. Verifique o setor exibido na tela.
3. Use **Anterior** e **Próximo** para navegar entre registros.
4. Use **Novo**, **Editar** ou **Apagar** para manutenção.
5. Revise as filiais marcadas na seção inferior.

## Campos importantes

| Campo / ação | Descrição |
|---|---|
| **Setor** | Nome do setor de rede. |
| **Filiais** | Lista de filiais vinculadas ao setor. |
| **MATRIZ** | Checkbox indicando a filial matriz. |
| **TESTE** | Checkbox de outra filial disponível no cadastro. |
| **Anterior** | Vai para o registro anterior. |
| **Próximo** | Vai para o próximo registro. |
| **Novo** | Cria um novo setor. |
| **Editar** | Edita o setor atual. |
| **Apagar** | Remove o setor atual. |
| **Procurar** | Localiza setores já cadastrados. |

## Resultado esperado

- O setor selecionado aparece carregado.
- As filiais vinculadas ficam visíveis na seção **Filiais**.
- As ações de navegação e manutenção ficam disponíveis conforme permissão.

## Problemas comuns

| Problema | Como tratar |
|---|---|
| Setor vazio ou incorreto | Use **Procurar** para localizar o registro desejado. |
| Filiais não marcadas | Verifique a configuração do setor e as permissões do usuário. |

## Observações

- A rota observada no demo foi `/lgc/redeinfra%7Csetores`.
- A tela é exibida no demo.
- O setor exibido na captura era **GERAL**.
- As filiais mostradas eram **MATRIZ** marcada e **TESTE** desmarcada.
- A captura limpa mostra a tela sem anotações visuais.

## Dúvidas para revisão

- A lista de filiais é editável diretamente nessa tela ou depende de outra rotina?
- Existe relação entre este fluxo e a divisão de acessos por rede?
- O botão **Procurar** abre uma busca simples ou um cadastro mais avançado?

## Screenshots sugeridos

- Tela **Setores** no demo: `assets/screenshots/rede-infra/setores.png`

![Setores no demo](/assets/screenshots/rede-infra/setores.png)
