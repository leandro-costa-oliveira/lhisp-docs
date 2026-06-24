---
title: Pessoas
published: true
editor: markdown
description: ''
---

# Pessoas

> **⚠️ Rascunho gerado por agente**
>
> Esta página foi documentada a partir da tela equivalente no ambiente de demonstração do LHISP. A captura utilizada veio do demo e foi mantida sem marcações visuais.

## Objetivo

Consultar e manter o cadastro de pessoas no LHISP, incluindo dados básicos, contato, tipo de pessoa, endereço e vínculos operacionais do registro.

## Quando usar

Use esta tela quando precisar:

- consultar um cadastro existente;
- cadastrar ou editar pessoas;
- revisar dados de identificação e contato;
- vincular a pessoa a perfis operacionais, como técnico ou vendedor;
- acessar ações relacionadas a filiais e senhas técnicas/comerciais.

## Pré-requisitos

- Estar autenticado no LHISP.
- Ter permissão para acessar o menu **Cadastros > Pessoas**.
- Possuir os dados da pessoa a ser cadastrada ou revisada.

## Passo a passo

1. Acesse o menu **Cadastros > Pessoas**.
2. Use **Procurar** para localizar um cadastro existente, se necessário.
3. Clique em **Novo** para criar um registro ou em **Editar** para alterar o cadastro atual.
4. Preencha os dados de identificação, contato e endereço.
5. Selecione o tipo de pessoa e os perfis operacionais aplicáveis.
6. Clique em **Salvar** para gravar as alterações.

## Campos importantes

| Campo / ação | Descrição |
|---|---|
| **Id** | Identificador interno do cadastro. |
| **Data de Cadastro** | Data e hora em que o registro foi criado. |
| **Técnico / Fornecedor / Vendedor** | Marcadores de perfil operacional associados à pessoa. |
| **Filiais** | Vincula a pessoa às filiais permitidas. |
| **Senha Tec. / Senha Vend.** | Ações relacionadas a credenciais técnicas e comerciais. |
| **Veículo** | Campo de associação com veículo, quando aplicável. |
| **Nome** | Nome principal da pessoa. |
| **Apelido** | Nome curto ou de uso operacional. |
| **Tipo** | Define se a pessoa é física ou jurídica. |
| **Data Nasc.** | Data de nascimento. |
| **Cpf / Rg** | Documentos de identificação. |
| **Telefone / Celular / Email** | Dados de contato. |
| **Pai / Mãe** | Campos cadastrais adicionais exibidos no demo. |
| **Logradouro / Número / Ponto de Referência** | Dados de endereço. |
| **Banco** | Dados bancários associados ao cadastro. |
| **Novo** | Cria um novo cadastro. |
| **Editar** | Altera o registro atual. |
| **Apagar** | Remove o cadastro selecionado. |
| **Salvar** | Persiste as alterações. |
| **Cancelar** | Desfaz a edição em andamento. |
| **Procurar** | Localiza registros existentes. |

## Resultado esperado

- O cadastro da pessoa fica acessível para consulta e edição.
- O operador consegue revisar os principais dados de identificação e endereço.
- As marcações operacionais, como técnico e vendedor, ficam disponíveis no mesmo formulário.

## Problemas comuns

| Problema | Como tratar |
|---|---|
| O cadastro não salva | Verifique se os campos obrigatórios foram preenchidos. |
| O registro não é localizado | Use **Procurar** e revise o critério de busca. |
| Os botões ficam desabilitados | Confirme se a tela está em modo de edição ou se o perfil tem permissão. |
| O veículo aparece como carregando | Aguarde a listagem ou revise a integração do cadastro. |

## Observações

- O demo exibe a tela **Pessoas** no fluxo principal do sistema.
- A captura usada nesta página mostra um cadastro já preenchido com dados fictícios do ambiente de demonstração.
- A área superior reúne ações rápidas como navegação, criação, edição, exclusão e pesquisa.
- A captura usada nesta página veio do ambiente de demonstração.

## Dúvidas para revisão

- A pessoa cadastrada pode ser vinculada simultaneamente como técnico e vendedor?
- O campo **Veículo** é obrigatório em algum cenário específico?
- O botão **Filiais** altera a visibilidade do cadastro ou apenas o acesso operacional?
- A integração com **Senha Tec.** e **Senha Vend.** deve ser descrita em páginas separadas?

## Screenshots sugeridos

- Tela **Pessoas** no demo: `assets/screenshots/cadastros/pessoas.png`

![Pessoas no demo](/assets/screenshots/cadastros/pessoas.png)
