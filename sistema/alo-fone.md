---
title: Alo Fone
published: true
editor: markdown
description: ''
---

# Alo Fone

> **⚠️ Rascunho gerado por agente**
>
> Esta página foi produzida a partir da tela observada no ambiente de demonstração do LHISP. A captura usada aqui foi validada visualmente e mostra a configuração da API do Alo Fone.

## Objetivo

Registrar a integração **Alo Fone**, usada para configurar CNPJ, senha, produto, forma de pagamento, valor e ativação da conta.

## Quando usar

Use esta tela para:

- revisar os dados cadastrais da integração;
- definir o produto que representa o chip;
- escolher a forma de pagamento;
- ajustar o valor configurado;
- ativar a integração quando necessário.

## Pré-requisitos

- Acesso ao menu **Sistema > Integrações > Alo Fone**.
- Credenciais e parâmetros fornecidos pelo parceiro.
- Permissão para consultar ou alterar a configuração da API.

## Passo a passo

1. Acesse **Sistema > Integrações > Alo Fone**.
2. Revise o campo **Cnpj**.
3. Verifique o campo **Senha**.
4. Selecione o **Produto que Representa o Chip**.
5. Escolha a **Forma de Pagamento**.
6. Confira o **Valor** e a opção **Ativo**.
7. Clique em **Salvar** para persistir as alterações.
8. Use o **Painel do Parceiro** quando precisar consultar o portal externo.

## Campos importantes

| Campo / elemento | Observação |
|---|---|
| **Cnpj** | Identificador da empresa no parceiro. |
| **Senha** | Credencial de autenticação da integração. |
| **Ativo** | Habilita ou desabilita a integração. |
| **Controle Patrimonial ?** | Opção adicional de controle de estoque/patrimônio. |
| **Produto que Representa o Chip** | Produto vinculado ao chip no processo. |
| **Forma de Pagamento** | Define a forma financeira usada. |
| **Valor** | Valor configurado para a integração. |
| **Salvar** | Persiste a configuração. |
| **Painel do Parceiro** | Link auxiliar para o portal externo. |

## Resultado esperado

- A integração Alo Fone fica autenticada e parametrizada.
- O produto e a forma de pagamento ficam definidos corretamente.
- A conta pode ser habilitada ou desabilitada pelo campo de ativação.

## Problemas comuns

| Problema | Como tratar |
|---|---|
| CNPJ inválido | Confirme o cadastro com o parceiro. |
| Senha incorreta | Verifique a credencial de acesso. |
| Produto não encontrado | Use a busca do seletor ou revise o cadastro do produto. |
| Não consigo salvar | Confira permissões e validade dos campos. |

## Observações

- A captura do demo estava limpa e sem marcações visuais.
- O screenshot mostra CNPJ, senha, produto, forma de pagamento e valor configurados no tenant de teste.
- Os valores sensíveis exibidos no demo não foram reproduzidos nesta documentação.
- A tela inclui um link para o **Painel do Parceiro** abaixo do formulário principal.

## Dúvidas para revisão

- O campo **Controle Patrimonial ?** é obrigatório em algum cenário?
- O seletor de produto abre uma busca em catálogo próprio ou lista fixa?
- O valor configurado é mensal, por chip ou por ativação?

## Screenshots sugeridos

- Tela principal de **Alo Fone** no demo: `assets/screenshots/sistema/alo-fone.png`

![Alo Fone no demo](/assets/screenshots/sistema/alo-fone.png)
