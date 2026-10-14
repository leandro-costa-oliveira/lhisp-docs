---
title: TC IRR
published: true
editor: markdown
description: Consulta do AS-SET e inclusão de ASNs pela integração TC IRR.
---

# TC IRR


## Objetivo

Gerenciar a base de **TC IRR** para consulta e manutenção de registros de ASN e descrição vinculados ao fluxo de redes.

## Quando usar

Use esta tela quando precisar:

- consultar registros de ASN;
- revisar a descrição associada ao ASN;
- adicionar um novo registro;
- atualizar a lista carregada;
- identificar os ASNs retornados pela integração.

## Pré-requisitos

- Estar autenticado no LHISP.
- Ter permissão para acessar o fluxo **TC IRR**.
- Saber o ASN ou a descrição que será consultada.
- Integração **TC IRR** configurada e ativa em [Sistema → Integrações → TC IRR](/sistema/tc-irr).

## Passo a passo

1. Acesse **Rede/ Infra > TC IRR**.
2. Aguarde o carregamento do ASN/AS-SET e da tabela.
3. Para incluir uma entrada, preencha **ASN** com o número, sem o prefixo `AS`, informe a **Descrição** e clique em **Add**. Ambos são obrigatórios; a tela acrescenta `AS` ao número enviado.
4. Clique em **Refresh** para recarregar a lista.
5. Confira a tabela após a atualização. O botão de exclusão está desenhado, mas não executa remoção no frontend atual.

**Refresh** consulta o AS-SET e confere se o nome retornado corresponde ao configurado; nessa consulta, a validação de `mnt-by` está desativada. Portanto, carregar a tabela não confirma o mantenedor nem a autorização de escrita.

**Add** usa outro caminho: lê o AS-SET atual, tenta conferir nome e mantenedor, inclui/substitui a linha do ASN informado e envia o objeto ao serviço externo com a credencial da integração. Confirme a resposta e recarregue a lista; esse envio altera o AS-SET externo, além da exibição no LHISP.

## Campos importantes

| Campo / ação | Descrição |
|---|---|
| **ASN** | Número do ASN que será incluído. Não é um filtro da tabela. |
| **Descrição** | Descrição da nova entrada. Não é um filtro da tabela. |
| **Add** | Cria um novo registro de TC IRR. |
| **Refresh** | Recarrega a lista exibida. |
| **Ações** | Exibe botão de exclusão sem implementação operacional nesta tela. |

## Resultado esperado

- A identificação do ASN/AS-SET configurado e a lista de entradas aparecem carregadas quando a consulta ao serviço retorna dados.
- Após uma inclusão bem-sucedida, a tela consulta novamente a lista.
- As ações de inclusão e atualização ficam disponíveis após a carga da consulta.

## Problemas comuns

| Problema | Como tratar |
|---|---|
| Título mostra `undefined - undefined` ou a lista fica vazia | Aguarde a consulta assíncrona. Se o estado permanecer, verifique a configuração em **Sistema > Integrações > TC IRR** e a disponibilidade do serviço. |
| Não consigo adicionar | Informe ASN numérico e descrição; confira a configuração da integração e a mensagem retornada. |
| Excluir não produz efeito | A remoção não está implementada nessa tela. |

## Observações

- A rota observada no demo foi `/redeinfra/tcirr`.
- O título do navegador é **TC IRR - bgp.net.br**.
- O ASN, o AS-SET e as linhas dependem da resposta da consulta assíncrona ao serviço integrado.
- Os campos ficam desabilitados durante a consulta ou uma inclusão.
- O botão de exclusão é renderizado, mas sua função está vazia no frontend atual; a remoção não é operacional nessa tela.


## Screenshots sugeridos

- Tela **TC IRR** no demo: `assets/screenshots/rede-infra/tc-irr.png`

![TC IRR no demo](/assets/screenshots/rede-infra/tc-irr.png)

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.
