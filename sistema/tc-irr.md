---
title: Integração TC IRR
published: true
editor: markdown
description: Configure senha, ASN e AS-SET usados na consulta e na atualização externa da base TC IRR.
---

# Integração TC IRR

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.

A configuração **Sistema > Integrações > TC IRR** fornece os dados usados pela tela [Rede / Infra > TC IRR](/rede-infra/tc-irr). Configurar credenciais e manter membros do AS-SET são etapas diferentes.

## Configurar

1. Abra a integração com uma sessão administrativa.
2. Informe **Senha**, **ASN** e **AS-SET** do objeto que a empresa administra no serviço TC IRR.
3. Marque **Ativo** e clique em **Salvar**.
4. Reabra e confira a configuração persistida.
5. Abra [TC IRR](/rede-infra/tc-irr) na área de rede e use **Refresh** para validar a consulta.

| Campo | Uso |
|---|---|
| **Senha** | Credencial enviada na submissão de atualizações; fica armazenada no campo técnico `token`. |
| **ASN** | Identificação usada para compor o mantenedor esperado `MAINT-<ASN>`. Confira o formato com o mantenedor cadastrado. |
| **AS-SET** | Nome exato do objeto consultado e enviado na atualização. |
| **Ativo** | Necessário para as rotas de consulta e inclusão. |

O primeiro cadastro compartilhado de integrações pode iniciar ativo mesmo quando a opção estava desmarcada. Confirme o estado depois da criação, especialmente se ainda estiver preparando os dados.

## Efeito das operações de rede

Consultar lê o AS-SET externo e devolve os membros e descrições. O caminho de leitura confere o nome do AS-SET, mas a verificação do mantenedor está desativada nessa rotina. O caminho de inclusão tenta conferir tanto o AS-SET quanto o mantenedor esperado; um erro de configuração pode impedir a inclusão mesmo quando **Refresh** funciona.

**Add** na área de rede consulta o objeto atual, incorpora o ASN/descrição e submete o conjunto ao serviço TC IRR, incluindo a senha. Não é apenas uma gravação local. Após uma inclusão bem-sucedida, recarregue para conferir o retorno efetivo do serviço.

O histórico da integração registra as operações emitidas por esse fluxo. Salvar senha/ASN/AS-SET não realiza uma inclusão de membro nem verifica por si só a aceitação da credencial de escrita.

## Limites e diagnóstico

- O botão de exclusão na tela de rede possui função vazia na versão revisada; não há remoção operacional por ele.
- Em **integração não configurada/inativa**, confira o cadastro salvo e a ativação.
- Em divergência de AS-SET ou mantenedor, confira a grafia exata e o objeto administrado antes de reenviar.
- Se a consulta funciona e Add falha, confira senha, autorização de escrita e a resposta do serviço; leitura e escrita usam etapas distintas.
- Desativar no LHISP não desfaz membros já publicados no AS-SET.

Consulte o [guia da tela TC IRR](/rede-infra/tc-irr) para a listagem e inclusão. A remoção externa precisa seguir um procedimento operacional separado, confirmado pelo responsável pela base.
