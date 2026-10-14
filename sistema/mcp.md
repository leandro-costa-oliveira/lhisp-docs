---
title: MCP — Api de Parceiros
published: true
editor: markdown
description: Configure credenciais OAuth, acesso e ferramentas da API de Parceiros para clientes MCP.
---

# MCP — Api de Parceiros

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.

A integração MCP expõe recursos da [API de Parceiros](/sistema/api-parceiros) como ferramentas para clientes compatíveis com **Model Context Protocol**, usando transporte **Streamable HTTP**. O endereço é `https://<DOMINIO_DO_PROVEDOR>/api-parceiros/mcp`.

## Antes de configurar

- Confirme a contratação ativa do módulo **MCP — Api de Parceiros** (`McpApiParceiros`). Sem confirmação da assinatura, a configuração fica bloqueada e o servidor recusa acesso.
- Tenha acesso a **Sistema > Integrações > MCP** e permissão para configurar a integração.
- Defina quais consultas e operações o cliente MCP poderá executar.

As credenciais MCP são geradas pelo servidor e independem do token da API REST. Em produção, base e empresa são definidas pelo proxy da instalação; o cliente envia a autorização OAuth.

## Configurar credenciais e acesso

1. Abra **Sistema > Integrações > MCP**.
2. Na aba **Credenciais e acesso**, clique em **Gerar credenciais**.
3. Copie o **Client ID** e o **Client Secret**. O segredo é exibido uma única vez; guarde-o em local seguro.
4. Para clientes que autorizam pelo navegador, cadastre a **redirect URI exata** fornecida pelo cliente: HTTPS e sem `*`. O callback inicial do Claude já vem cadastrado; confira os demais callbacks na configuração do cliente.
5. Na aba **Tools**, selecione as ferramentas autorizadas.
6. Marque **Integração ativa** e clique em **Salvar**.
7. Copie o endereço exibido em **Endereço do servidor MCP** e configure-o no cliente com as credenciais.

O link **documentação do MCP** abre `/api-parceiros/mcp/docs` na instalação, com os detalhes de conexão. Alterações em redirect URIs, ferramentas e ativação precisam ser salvas. Geração e rotação de credenciais são ações próprias no servidor.

## Selecionar ferramentas

A aba **Tools** agrupa consultas e escritas por domínio. A seleção é aplicada tanto na listagem oferecida ao cliente quanto na execução. Inicialmente, sem restrição configurada, todas ficam habilitadas; uma seleção vazia não permite ferramentas.

Há consultas de clientes, financeiro, contratos, acessos, planos, formas de pagamento, pré-cadastros, atendimentos e ordens de serviço. Algumas ferramentas também executam ações reais:

| Ferramenta | Efeito |
|---|---|
| `atendimento_criar` | Cria um atendimento. |
| `ordem_servico_criar` | Cria ou atualiza uma ordem de serviço. |
| `pre_cadastro_criar` | Cria pré-cadastro; com `confirmar=true`, também efetiva a venda. |
| `pre_cadastro_confirmar` | Cria/reaproveita cliente, cria contrato e contrata o serviço do plano. |
| `acesso_desbloqueio_em_confianca` | Libera temporariamente um acesso conforme as regras do sistema. |
| `cliente_desconectar_acesso` / `acesso_desconectar` | Derruba a conexão ativa do acesso. |

Revise especialmente as ferramentas de escrita. A indicação de leitura/escrita ajuda na escolha, mas a autorização efetiva depende de salvar a seleção. O catálogo técnico completo fica em `/api-parceiros/mcp/tools`; esse catálogo é público e contém metadados, enquanto `tools/list` reflete a seleção da empresa autenticada.

## Formas de autenticação

| Uso | Fluxo |
|---|---|
| Cliente com autorização no navegador | OAuth com `authorization_code`, PKCE S256 e redirect URI cadastrada; permite renovação por `refresh_token`. |
| Aplicação própria de servidor | `client_credentials`, usando Client ID e Client Secret; dispensa redirect URI e não retorna refresh token. |

O access token dura **15 minutos**. No fluxo `client_credentials`, solicite outro quando expirar; `offline_access` é recusado nesse fluxo. As chamadas MCP usam `Authorization: Bearer <ACCESS_TOKEN>`.

As credenciais atuais são compartilhadas pelos consumidores MCP do provedor. Todo token representa a integração, e as operações ficam atribuídas ao usuário de sistema `McpLH` (-2); a autorização no navegador não identifica um operador do LHISP.

## Rotação e desativação

Use **Rotacionar Client Secret** quando precisar substituir o segredo. A confirmação avisa que os consumidores atuais serão desconectados. A rotação revoga os refresh tokens e exige atualizar todos os integradores que usam aquela credencial. O novo segredo também é mostrado uma única vez.

Para suspender o acesso, desmarque **Integração ativa** e salve. Para retirar uma capacidade específica, remova a ferramenta da seleção e salve.

## Logs e diagnóstico

A aba **Logs de operações** permite consultar as chamadas de ferramentas, com resultado e duração. Os argumentos são mascarados; a gravação é assíncrona, e uma falha no log não desfaz a operação.

| Situação | Verificação |
|---|---|
| Configuração bloqueada ou acesso negado pelo módulo | Confira assinatura ativa e comunicação da instalação com a gerência. |
| Segredo não aparece ao reabrir a tela | Comportamento esperado; se ele não foi guardado, rotacione e reconfigure os clientes. |
| Erro de redirect URI | Cadastre exatamente o callback HTTPS usado pelo cliente, sem curinga, e salve. |
| Ferramenta não aparece/é recusada | Confira a seleção salva, ativação da integração e token atual. |
| Token expirado em aplicação própria | Solicite novo access token com `client_credentials`. |
| Erro 413 ao enviar anexos | O corpo MCP tem limite padrão de 1 MB, incluindo base64. A API REST possui limite próprio, padrão de 25 MB nas rotas de escrita. |

Um retorno de erro pode ocorrer depois de algum efeito de negócio, como a venda confirmada com faturamento da instalação pendente. Consulte o resultado e o registro criado antes de repetir uma escrita.
