---
title: Configurar emissão de NFCom no LHNFE
published: true
editor: markdown
description: 'Configuração da integração LHNFE para emissão de NFCom'
---

# Configurar emissão de NFCom no LHNFE

## Objetivo

Configurar certificado, ambiente, filiais e códigos cClass usados na emissão de NFCom pelo LHNFE.

## Pré-requisitos

- Acesso a **Sistema > Integrações > LHNFE**.
- Certificado digital A1 no formato PFX e respectiva senha.
- Definição do ambiente de emissão.
- Códigos cClass validados pela contabilidade.

## Passo a passo

1. Abra **Sistema > Integrações > LHNFE**.
2. No primeiro cadastro, envie o **eCNPJ (A1)** e informe a senha.
3. Selecione o **Ambiente NFCom**: desativado, produção ou homologação.
4. Preencha, se necessário, as **Informações complementares** adicionadas às NFCom.
5. Configure certificados das filiais com CNPJ diferente da matriz. Filiais com o mesmo CNPJ usam o token da matriz.
6. Selecione os códigos **cClass SCM** e **cClass SVA** definidos pela contabilidade.
7. Confirme separadamente os dois códigos. Mesmo com SVA vazio, a ciência dessa escolha precisa ser confirmada.
8. Clique em **Salvar**.

## Campos principais

| Campo | Descrição |
|---|---|
| **Token** | Token retornado pelo LHNFE após o salvamento; é somente leitura. |
| **eCNPJ (A1)** | Certificado digital PFX usado pela matriz. |
| **Senha do eCNPJ** | Senha do certificado enviado. |
| **Ambiente NFCom** | Desativado, produção ou homologação. |
| **Informações complementares** | Texto incluído automaticamente em todas as NFCom emitidas. |
| **cClass SCM** | Classificação do valor de Serviço de Comunicação Multimídia. |
| **cClass SVA** | Classificação do valor de Serviço de Valor Agregado. |

## Regras confirmadas

- O salvamento cadastra/atualiza a matriz e as filiais no LHNFE e retorna os tokens.
- Certificado e senha são enviados ao LHNFE e não permanecem disponíveis para leitura na tela.
- Sem cClass SVA, não é possível emitir NFCom para planos que possuam SVA.
- A confirmação dos códigos é obrigatória a cada salvamento.

## Erro 203 — emissor não habilitado

Esse retorno indica que a autorização fiscal do emissor precisa ser verificada. Confira o ambiente selecionado, o CNPJ do certificado e a habilitação do emissor junto à SEFAZ. Alterar cClass não substitui a habilitação fiscal.

## Segurança e responsabilidade fiscal

- Não compartilhe o certificado ou sua senha.
- Use somente códigos cClass definidos pela contabilidade; códigos incorretos podem gerar consequências fiscais.
- Teste em homologação antes de ativar a emissão em produção.

## Referências de implementação

- `lhisp-frontend/src/paginas/sistema/integracoes/lhnfe/LHNfe.tsx`
- `lhisp-frontend/src/paginas/sistema/integracoes/lhnfe/FiliaisLHNfe.tsx`
- `lhisp-frontend/src/paginas/sistema/integracoes/lhnfe/nfcom.t.ts`

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.
