---
title: Erro 203 - Rejeição: Emissor não habilitado para emissão da NFCom
published: true
editor: markdown
description: ''
---

# Erro 203 - Rejeição: Emissor não habilitado para emissão da NFCom

> **⚠️ Rascunho gerado por agente**
>
> Esta página foi migrada a partir da wiki do LHISP e da tela equivalente no ambiente de demonstração.

## Objetivo

Documentar a configuração de emissão de NFCom e o erro 203 citado na wiki, incluindo os códigos cClass usados no faturamento.

## Quando usar

Use este fluxo quando for necessário:

- revisar a configuração de emissão da NFCom;
- validar token, eCNPJ e senha;
- ajustar o ambiente NFCom para produção ou homologação;
- conferir os códigos cClass SCM e cClass SVA usados no faturamento.

## Pré-requisitos

- Acesso ao menu de integração/financeiro relacionado à NFCom.
- Certificado digital e credenciais do eCNPJ (A1).
- Orientação da contabilidade sobre os códigos corretos.

## Passo a passo

1. Abra a tela de **NFCom**.
2. Informe o **Token** quando necessário.
3. Selecione o arquivo do **eCNPJ (A1)** e informe a senha.
4. Defina o **Ambiente NFCom** conforme a operação.
5. Clique em **Salvar**.
6. Revise os códigos **cClass SCM** e **cClass SVA**.
7. Clique em **Confirmar** nos códigos escolhidos.
8. Consulte a lista oficial de códigos e valide com a contabilidade.

## Campos importantes

| Campo / ação | Descrição |
|---|---|
| **Token** | Identificador usado para a integração. |
| **eCNPJ (A1)** | Certificado digital utilizado na emissão. |
| **Senha do eCnpj** | Senha do certificado digital. |
| **Ambiente NFCom** | Define se o ambiente está desativado, produção ou homologação. |
| **cClass SCM** | Código de faturamento para serviço de comunicação multimídia. |
| **cClass SVA** | Código de faturamento para serviço de valor agregado. |
| **Salvar** | Persiste a configuração da tela. |
| **Confirmar** | Confirma o cClass selecionado. |

## Resultado esperado

- A configuração da NFCom fica registrada.
- Os códigos cClass são escolhidos de acordo com a regra fiscal.
- A equipe consegue consultar a tela de emissão e o alerta do erro 203.

## Problemas comuns

| Problema | Como tratar |
|---|---|
| Erro 203 persiste | Revisar o ambiente NFCom, os certificados e os códigos cClass. |
| Certificado não carrega | Validar o arquivo eCNPJ e a senha informada. |
| Códigos fiscais incorretos | Confirmar com a contabilidade antes de salvar. |
| Ambiente errado | Ajustar entre desativado, produção ou homologação antes de salvar. |

## Observações

- A wiki apresenta a página como **Erro 203 - Rejeição: Emissor não habilitado para emissão da NFCom**.
- No demo, a tela equivalente aparece como **LHNFE - Emissão de NFCom**.
- A captura usada nesta página veio do ambiente de demonstração, não da wiki.

## Dúvidas para revisão

- O título deve ficar como o erro da wiki ou como a tela do demo?
- Esta página deve ficar em **Financeiro** ou em outro grupo específico de NFCom?
- Há mais campos obrigatórios que não aparecem na tela visível do demo?

## Screenshots sugeridos

- Tela **LHNFE - Emissão de NFCom** no demo: `assets/screenshots/financeiro/nf-com.png`

![NFCom no demo](/assets/screenshots/financeiro/nf-com.png)
