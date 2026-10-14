---
title: Continuidade documental A003 — 14/10/2026
description: Fechamento dos relatórios genéricos e ampliação dos guias funcionais, de integrações e de operação.
published: false
editor: markdown
---

# Continuidade documental A003 — 14/10/2026

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.

Continuidade solicitada após [A002](auditoria-2026-10-14.md), partindo de `5d67779` em `dev`, sem alterações locais na documentação. A revisão confronta os checkouts locais; não representa inspeção das versões instaladas.

A entrega de conteúdo reúne **96 arquivos Markdown**, incluindo **25 páginas públicas novas** (23 guias e dois índices). O registro de auditoria/evidências fica em quatro arquivos internos separados. Nenhum código de aplicação foi alterado.

Commit de conteúdo: **`a4d7dd1`**. O relatório, o mapa de evidências e as referências históricas são registrados em commit separado.

**Escopo confirmado pelo usuário:** as páginas de privacidade LHSAC e NFibra servem aos links dos aplicativos e ficam preservadas, fora da documentação funcional a completar. Sua ausência de texto institucional deixou de ser pendência desta tarefa. O guia funcional da central do assinante é independente dessas páginas.

## Entregas sobre as lacunas de A002

| Lacuna | Resultado de A003 |
|---|---|
| 47 relatórios com a tabela genérica de filtros | Todos reescritos com critérios próprios, datas, unidades contadas, saídas e limites verificados. Não houve apenas remoção da frase. |
| Relatórios adicionais sem guia | Criados aquisição, retenção, cobrança terceirizada, serviços pendentes e estoque por filial. |
| Navegação dos relatórios | Índice com 59 guias, distinguindo telas atuais, legadas e funcionalidades indisponíveis/não localizadas. |
| Aplicativos técnico e vendedor | Guias distintos de LHTEC web, Expo e vendas, com requisitos e limites offline próprios. |
| Central do assinante | Guia de acesso, recuperação, financeiro, Pix, documentos, aceite e atendimento, sem inventar a interface de um cliente não disponível no workspace. |
| Backup e recuperação | Artefatos, retenção local, envio, conferência e roteiro de restauração isolada. Homologação e metas de recuperação continuam dependentes da implantação. |
| Acesso e permissões | Guia de autenticador/passkeys/sessão; troca de senhas atualizada; usuários distingue menus, permissões, filiais visíveis/atendidas, recursos e cópia de configurações. |
| Dashboards | Inadimplência e pré-cadastros documentados; PowerBI identificado pelo estado efetivo de implementação. |
| Cadastros ausentes | Grupos de atendimento, folha de pagamento e complementos da folha. |
| Integrações ausentes | Intelbras Mibo, PABX Megatelecom, LH-Crypto, LHChat, LH-Zap e configuração TC IRR, com limites reais do executor. |
| Navegação de sistema | Índice de administração, comunicação e integrações, conectado à home. |
| Rede complementar | 20 guias lidos e confrontados em pontos específicos; 16 alterados e quatro preservados após cruzamento focal, sem homologar todos os adaptadores. |

## Critério dos relatórios reescritos

Cada relatório foi confrontado com a implementação encontrada, incluindo legado quando aplicável. A documentação distingue:

- pessoa, contrato, serviço, título, locação e evento;
- data de cadastro, ativação, vencimento, pagamento, criação e competência;
- situação atual e reconstrução histórica;
- limites inclusivos/exclusivos e datas sem expansão do fim do dia;
- totais do resultado inteiro e subtotais das linhas carregadas;
- impressão, CSV e ações em lote, inclusive diferenças entre seus filtros;
- formulário operacional, componente incompleto e rotina não localizada.

Não foi declarado um relatório removido somente porque não havia rota React. As telas legadas permaneceram documentadas com seus próprios critérios. Os avisos de indisponibilidade evitam transformar código incompleto em um passo a passo fictício.

## Limites materiais encontrados e documentados

São observações do código, sem reprodução com dados reais e sem correção de implementação nesta tarefa.

| Área | Comportamento que o guia esclarece |
|---|---|
| Mensalidades pagas no período | A contagem não comprova pagamento mês a mês nem ausência de abertas; a filial escolhida não é repassada à consulta legada. |
| Contas a receber | CSV não aplica o intervalo de criação e pode divergir da tela; impressão consulta todas as páginas. Cancelamento em massa atua sobre todo o recorte e pode ter sucesso parcial. |
| Contas a pagar | Resumos por categoria/centro têm critérios e tratamento de datas próprios; nominal não deve ser confundido com saldo a pagar. |
| Adimplência | “Clientes” conta contratos e pagamentos contam títulos; o ticket também considera nominal de títulos sem recebimento. |
| Regime de caixa | Tipo “Todas” envia zero; o valor das notas pagas não é a soma de recebimentos ou base tributária universal. |
| Projeções | Atualizar a consulta não reconsolida automaticamente os valores financeiros persistidos. |
| Movimentações por usuário | SPA incompleta e relatório PHP funcional são caminhos diferentes. |
| Clientes legados | Agrupamento sem ordenação pode escolher serviço representativo; filtros posteriores podem omitir contratos que possuem outro serviço compatível. |
| Inadimplência | Cartões/CSV usam atraso contra a data atual do banco com limites de referência; o gráfico histórico segue outro cálculo. |
| OS/comissões | Filtros de conclusão possuem limitações e comissão deduplica por contrato, sem garantir contagem por OS. |
| Estoque por filial | A consulta da tela pede atributos/vínculos não presentes no BI/modelo correspondente; não foi descrita como relatório funcional homologado. |
| Bilhetagem agregada | O formulário legado chama uma consulta de uso de IP com parâmetros incompatíveis; sessões individuais e uso de banda são alternativas distintas. |
| Aplicativo técnico Expo | O início local não é enviado como horário pela chamada atual; cache não equivale à fila de baixas do LHTEC web. |
| Backup | Um pacote parcial pode chegar ao S3; conferência de presença não valida restauração, todas as tabelas ou arquivo de configuração. |
| PABX Megatelecom | Configuração persiste credenciais, mas provisionar contrato retorna “MegaTelecom Não Implementado”. |
| LH-Crypto | Quantia fixa e ausência de conversão/conciliação completa; não foi documentado como recebimento operacional. |
| LHChat/LH-Zap | Compatibilidade do serviço executor não é demonstrada apenas por URL/token salvos ou evento publicado. |
| Integrações compartilhadas | A criação usa ativo como padrão; reabrir e conferir é necessário mesmo quando o primeiro envio pede desativação. |
| Comandos de rede | Limpar seleção conserva IDs em memória; recolocar um servidor pode manter o destino Todos. O guia explica conferir os destinos e recuperar a seleção. |
| Projetos de rede | Copiar pode duplicar dados/terminar parcialmente; apagar marca o projeto, sem cumprir a exclusão de itens sugerida na confirmação visual. |
| CGNAT Huawei | O gerador usa parâmetro legado diferente do cálculo da inclusão e produz interface placeholder; não foi documentado como configuração pronta para execução. |

Essas constatações devem orientar uma revisão de código separada. O trabalho atual modifica documentação, sem implementar correções financeiras, de autenticação, filas ou equipamentos.

## Evidências e escopo das fontes

O arquivo [evidencias-a003-fluxos.json](evidencias-a003-fluxos.json) registra 27 páginas e 65 referências de fonte da frente de clientes, dashboards e cadastros. Os guias técnicos de relatórios também incluem suas fontes; a tabela abaixo complementa os demais grupos.

| Grupo | Fontes principais |
|---|---|
| Financeiro | Frontend `RelContasReceber.tsx:54`, `AdimplenciaPorVencimento.tsx:37`, `RelContasPagar.tsx:28`; PHP `web/inc/actions/Financeiro.php:3104`, `:3451`, `:3690`, `web/inc/classes/ContaReceberDAO.php:1466`. |
| Projeções/fiscal | Backend `src/lhisp-business/src/business/relatorios/ProjecoesRecebimentoBI.js`; frontend `src/paginas/relatorios/projecoes_recebimentos/RelProjecoesRecebimentos.tsx:98` e componentes de `fiscal_regime_caixa/`. |
| Relatórios rede/OS/estoque | PHP `web/form/relatorios/rel_bilhetagem_listagem.php:36`, `rel_clientes_rede_listagem.php:132`, `web/inc/classes/AlmoxarifadoDAO.php:238`; frontend `RelComissaoTecnicoPorOs.tsx:156`, `RelatorioOrdensServico.tsx:53`, `RelEstoquePorFilial.tsx:44`. |
| LHTEC web | `lhisp-tecnico/src/pages/OrdemServicoBaixar.tsx:98`, `src/api/baixarOsRequest.ts:48`, `src/api/queryClient.ts:7`, `src/main.tsx:10`; PHP `web/inc/Os/Action/BaixarOS.php:6` e `EfetuarLogin.php:6`. |
| Expo | `app-tecnico/src/app/_layout.tsx`, `src/query/useOrdemDeServico.ts:51`, `src/query/useIniciarOrdemDeServico.ts:7`, `src/schema/forms/BaixaOSForm.ts`. |
| Vendas | `lhisp-vendas/src/CardTipoPessoa.js`, `CardAnexos.js`, `Dashboard.js`; backend `src/rotas/rotas-vendas.js:8`, `:147`. |
| Central | `lhsac-backend/src/rotas.1.0.0.js:177`, `:436`, `:983`, `:1250` e `src/services/pix.js`. |
| Segurança/senhas | Frontend `src/paginas/conta/Seguranca.tsx`, `Passkeys.tsx`, `Senhas.tsx`; backend `src/rotas/rotas-auth.js:173`, `:321`, `src/services/session-auth.js:16`, `AuthBI.js:860`; PHP `web/inc/actions/Usuario.php:304`. |
| Backup | Backend `src/services/backup.js:250`, `:574`, `:674`; manager `crontab:13`, `src/tasks/VerificarBackups.task.ts`, `src/misc/casarBackups.ts`, `src/services/S3.service.ts`. |
| Mibo | Daemon OTT `src/consumer/IntelbrasMibo.consumer.ts`; backend `PatrimonioBI.js:244`, callback `IntelbrasMiboConsumer.js:12`; PHP `IntelbrasMiboLocacaoPolicy.php:8`, `AgendaTecnica.php:842`. |
| PABX/Crypto | Backend `ContratoVoipBI.js:108` e configurator PABX; PHP `ContaReceberDAO.php:3374`, `dialogQRCodeCrypto.php:65`. |
| LHChat/LH-Zap/TCIRR | PHP `LHChatBot.php:19`; frontend `LHZap.tsx:59`; backend `LHZapConfigurator.js:20`, `rotas-base.js:95`, `rotas-misc.js:1026`; bot e serviço WhatsApp locais. |
| Rede complementar | PHP `web/inc/classes/Mikrotik.php:1194`, `ProjetoRedeDAO.php:49`, `IpPrefixDAO.php:81`, `HuaweiConfigurator.php:29`, `VsolGponConfiguratorV1.php:554`; frontend `src/paginas/redeinfra/redes/Redes.tsx:31`; PHP `web/form/redeinfra/ferramentas/enviar_comandos.js:21`. |

As referências abreviadas identificam arquivos na área correspondente do repositório-fonte. Elas não são links para recursos de produção.

## Validação

- Validador de páginas/links: **198 páginas, 485 links locais, zero erros**. `git diff --check` aprovado; frontmatter YAML e aviso de IA conferidos nos 99 Markdown alterados, incluindo os registros internos.
- Conferência de inexistência da frase genérica nos relatórios, com leitura semântica dos novos critérios.
- Referências do JSON de evidências conferidas quanto à existência e número de linha.
- Revisão independente de aplicativos, central, backup, usuários e segurança; revisão de inadimplência por outro agente; revisão cruzada das integrações e da folha.
- Sem build de aplicação, UI autenticada, PSP, banco, cron, firmware ou servidor remoto. Não foram criadas capturas que simulem telas não visitadas.

## Limites que dependem da implantação

O texto funcional foi ampliado com as evidências disponíveis. Permanecem necessários para homologação: teste de restauração com artefatos reais e metas de recuperação; confirmação dos agendamentos; visualização e capturas atualizadas; compatibilidade dos executores e fabricantes instalados; revisão de bugs identificados no código. Esses pontos não foram mascarados como validação concluída.

Não foi promovido um baseline global nem calculado percentual de completude. A002 e B001 são históricos; futuras revisões devem comparar os hashes e somente o escopo efetivamente revisado. A presença de guias de funcionalidades indisponíveis não afirma que a implementação foi concluída.

## Checkouts observados

| Repositório | HEAD de referência observado | Condição da observação |
|---|---|---|
| `lhisp-frontend` | `69e4b49eee7c8c0e638adb73378993d337133532` | Limpo nas conferências; sem alteração feita por esta tarefa. |
| `lhisp-backend` | `262fb86c111db952d233174ac5baba7416a96bb5` | Limpo nas conferências; sem alteração feita por esta tarefa. |
| `lhisp-php` | `e1407a6618639f67edddc79bd0af0f1a0815daec` | Limpo nas conferências; sem alteração feita por esta tarefa. |
| `lhisp-manager` | `b06c299fcf2a8202f8d701983b32b92a9796c195` | Limpo no início; avançou depois para `c14d5a5e386806121d8542ca1a72b6277de3494e` e recebeu alterações locais concorrentes. WIP excluído da revisão. |
| `lhisp-tecnico` | `5ec0dc7f5ae5e9e7f45ffa222bde9aac45e422be` | Limpo nas conferências; sem alteração feita por esta tarefa. |
| `app-tecnico` | `113a47a393d9bf54b8953ff78cb0a7fa50c1a562` | Limpo nas conferências; sem alteração feita por esta tarefa. |
| `lhisp-vendas` | `80895a277de6cbeea6484027bb70cf0196289262` | Limpo nas conferências; sem alteração feita por esta tarefa. |
| `lhsac-backend` | `06268033ee7fc2ea7a4cfde13750c736d8b85701` | Limpo nas conferências; sem alteração feita por esta tarefa. |
| `lhisp-api-parceiros` | `05ad02e921b489b6e6944841774613e6167af4ae` | Limpo nas conferências; sem alteração feita por esta tarefa. |
| `lhisp-cobrancas` | `9056b7d5038026f5b82c302ef881832d1a5b1781` | 3 alterações locais preexistentes; não constitui baseline limpo. |
| `lhisp-pix` | `da44466894b5bebd33706ff112fa138a3173dc0c` | Limpo nas conferências; sem alteração feita por esta tarefa. |
| `lhisp-daemon-ott` | `f22b2eb9a364cb3e431da46c17ecbaa5c64d7bd2` | Limpo nas conferências; sem alteração feita por esta tarefa. |
| `lhisp-daemon-voip` | `fc25a88aa111eb5d525acedc1c88c5f1d076c7b8` | Limpo nas conferências; sem alteração feita por esta tarefa. |
| `lhisp-daemon-notificacoes` | `bd999c461533cb78bb3012eff744dc9b10b76d9c` | Limpo nas conferências; sem alteração feita por esta tarefa. |
| `lh-chat-bot` | `cf8d4260e719073cf07f4546fea342b7e209723d` | Limpo nas conferências; sem alteração feita por esta tarefa. |
| `lh-zap-api` | `2b214653bc642ea34f7167e5f87d8ab79a248a85` | Limpo nas conferências; sem alteração feita por esta tarefa. |

Os sete arquivos da gerência usados nas referências de backup, identificação e composição foram comparados com o HEAD inicial e continuavam iguais: `crontab`, `docker-compose.yaml`, `Empresa.controller.ts`, `Backup.controller.ts`, `VerificarBackups.task.ts`, `casarBackups.ts` e `S3.service.ts`. Mudanças concorrentes no módulo judicial não foram tomadas como entrega homologada.
