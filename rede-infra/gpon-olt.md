---
title: GPON OLT
published: true
editor: markdown
description: ''
---

# GPON OLT

> **⚠️ Rascunho gerado por agente**
>
> Este documento foi produzido a partir da tela observada no ambiente de demonstração do LHISP. A captura usada nesta página foi validada visualmente e mostra o formulário principal da OLT GPON.

## Objetivo

Registrar a tela de **GPON OLT** do módulo **Rede/ Infra**, que concentra o cadastro do equipamento, os parâmetros de acesso e as abas complementares de chassi e ONUs.

## Quando usar

Use este fluxo para:

- cadastrar ou revisar uma OLT GPON;
- informar fabricante, versão e endereço IP;
- definir porta e credenciais de acesso;
- controlar a gravação das configurações;
- navegar entre abas de dados, chassi e ONUs.

## Pré-requisitos

- Acesso ao módulo **Rede/ Infra**.
- Permissão para consultar ou manter cadastros de OLT GPON.
- Dados do equipamento, endereço IP e credenciais de acesso.
- Tela carregada no demo com o formulário acessível.

## Passo a passo

1. Acesse **Rede/ Infra > GPON OLT**.
2. Use **Anterior** e **Próximo** para navegar entre registros.
3. Clique em **Novo**, **Editar** ou **Apagar** conforme a necessidade do cadastro.
4. Preencha os campos do formulário principal.
5. Use as abas **Chassi**, **ONUs Autorizadas**, **ONUs Não Autorizadas** e **Executar Comandos** quando necessário.
6. Use **Salvar** ou **Cancelar** para concluir a operação.
7. Se precisar localizar um registro, utilize **Procurar**.

## Campos importantes

| Campo / elemento | Observação |
|---|---|
| **Id** | Identificador do cadastro. |
| **Fabricante** | Seletor do fabricante da OLT; a tela exibiu opções como **DATACOM**, **FIBERHOME**, **HUAWEI**, **INTELBRAS 8820i**, **INTELBRAS G8**, **NOKIA**, **ZTE** e **VSOL**. |
| **Versao** | Seletor da versão do equipamento. |
| **Gravar Configurações ?** | Opção para persistir a configuração. |
| **Descrição** | Nome/descrição do cadastro. |
| **IP** | Endereço de gerenciamento. |
| **Porta** | Porta de acesso do equipamento. |
| **Usuário** | Usuário de autenticação. |
| **Senha** | Senha de autenticação. |
| **Senha Enable** | Senha de modo privilegiado. |
| **Chassi** | Aba para dados estruturais do equipamento. |
| **ONUs Autorizadas** | Aba para consulta das ONUs autorizadas. |
| **ONUs Não Autorizadas** | Aba para consulta das ONUs não autorizadas. |
| **Executar Comandos** | Aba para comandos operacionais. |

## Resultado esperado

- A OLT GPON fica associada ao cadastro correto.
- Os dados de fabricante, IP e credenciais ficam visíveis para operação.
- As abas complementares permitem consultar chassi e ONUs.
- O cadastro pode ser consultado e mantido a partir da barra de ações.

## Problemas comuns

| Problema | Como tratar |
|---|---|
| O fabricante correto não aparece | Confirme se o perfil do equipamento está disponível na lista. |
| Não consigo acessar a OLT | Revise IP, porta, usuário e senha. |
| As ONUs não aparecem | Verifique a aba correspondente e a sincronização do equipamento. |
| Não consigo salvar | Confirme se os campos obrigatórios foram preenchidos. |

## Observações

- A tela é um **iframe legado** com abas de navegação próprias.
- A captura validada estava limpa, sem marcações ou anotações visuais.
- A presença das abas indica que o fluxo mistura cadastro e operação do equipamento.
- A rota observada no demo é `https://demo.lhprovedor.com.br/lgc/redeinfra%7Cgponolt`.

## Dúvidas para revisão

- A aba **Executar Comandos** executa comandos ao vivo ou apenas os registra para auditoria?
- A opção **Gravar Configurações ?** é obrigatória em todos os cenários?
- O cadastro de GPON OLT compartilha perfil com **GePON OLT** ou são fluxos independentes?
- A lista de fabricantes cobre todos os modelos suportados em produção?

## Screenshots sugeridos

- Tela principal de **GPON OLT** no demo: `assets/screenshots/rede-infra/gpon-olt.png`

![GPON OLT no demo](/assets/screenshots/rede-infra/gpon-olt.png)
