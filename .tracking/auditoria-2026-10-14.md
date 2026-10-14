---
title: Auditoria documental A002 — 14/10/2026
description: Resultado da comparação da documentação com repositórios locais, correções e lacunas priorizadas.
published: false
editor: markdown
---

# Auditoria documental A002 — 14/10/2026

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.

Documento interno de manutenção. **A documentação não está completa.** Existem guias operacionais úteis e detalhados, mas o número de páginas não representa cobertura das funcionalidades nem atualização em relação ao código.

## Escopo e método

- Ponto inicial de `lhisp-docs`: `41fcd97a6e8e3e66502bc6b7bbb143b67db4bd42`, branch `dev`, sem alterações locais.
- Inventário Git de **44 repositórios locais**, incluindo a documentação; portanto, 43 repositórios irmãos. Não houve fetch das fontes: os hashes abaixo representam os checkouts disponíveis, não as versões mais recentes dos remotos ou as versões implantadas.
- Verificação estrutural das páginas e referências locais; leitura dirigida de conteúdo, rotas, telas, ações, BIs/DAOs, serviços e diffs posteriores a B001 nos módulos examinados.
- Fontes principais: frontend, backend, PHP, gerência, API de parceiros, cobranças/Pix, updater e serviços de rede. Repositórios periféricos foram inventariados sem auditoria funcional integral.
- Sem executar aplicações, migrations, rotinas de produção, bancos, PSPs, equipamentos ou comandos em servidores remotos. Capturas existentes não foram renovadas nem homologadas em UI autenticada.

O resultado é uma **auditoria parcial por funcionalidade**, acompanhada de correções confirmadas. Não certifica todas as páginas e não promove a cobertura de diretórios inteiros. O histórico B001 permanece em `referencias-de-codigo.md`; A002 registra observações e o escopo efetivamente revisado.

As correções de conteúdo estão no commit **`64777c2`**, com 38 arquivos alterados, incluindo 11 novos guias. Consulte `git show --stat 64777c2` para o conjunto exato; o relatório e o tracking são registrados separadamente.

Na conferência final, houve alterações concorrentes em duas fontes: `lhisp-manager` manteve o HEAD, mas passou a ter mudanças locais no parser Anatel e seu teste; `lhisp-site` avançou para `bca8c9a`. Essas mudanças não foram incorporadas à revisão e não afetaram os arquivos usados para os guias de arquitetura/migrations. A tabela final registra o **estado inicial observado**, sem afirmar snapshot imutável do workspace inteiro. As demais fontes mantiveram hashes e estados locais na conferência.

## Diagnóstico inicial mensurável

| Item | Resultado antes das alterações |
|---|---|
| Arquivos Markdown versionados | 166, incluindo README, instruções e tracking. |
| Páginas públicas candidatas | 162, excluindo README, diretórios ocultos e `tasks/`. Todas tinham delimitadores de frontmatter. |
| Relatórios | 52 páginas; **47** repetiam literalmente a linha genérica de filtros “Variam conforme o relatório e o recorte operacional”. Isso sinaliza falta de detalhe, sem comprovar que todo o restante de cada página esteja errado. |
| Capturas versionadas | 105. Quatro referências apontavam para imagens inexistentes. |
| Tracking | Snapshot B001 de 04/09/2026, com fila posterior pendente e cobertura parcial. Algumas páginas já continham correções posteriores sem promoção de baseline. |
| Políticas de privacidade | As duas páginas de `lhsac/` descreviam como revisar uma política, mas não continham o texto integral. |
| Referências técnicas | Não havia área própria para arquitetura e canais de migrations. |

Não foi calculado percentual de completude: não existe uma matriz aprovada de funcionalidades e públicos que permita medi-lo de forma confiável.

## Correções e guias entregues

| Área | Entrega e escopo |
|---|---|
| Agenda | Fila por filiais atendidas/grupo atual, diagnóstico de exclusões da fila, impressão de OS e limites da rotina de retirada automática. |
| Pré-cadastro | Condições comerciais e de instalação, confirmação única e tratamento da contratação concluída com faturamento posterior falho. |
| Contratos | Novo guia de alterações de SMS em massa; alcance por pessoa/empresa e auditoria. Origem da geração de contas identificada como inferência de apresentação. |
| Estoque | Exclusão de separação concluída/vinculada recusada; novo guia patrimonial; quatro imagens ausentes corrigidas/removidas. |
| Clientes e relatórios | Novos guias de Radar, relatório unificado de clientes e produtos para retirada, com contagens, limites históricos e efeitos de lotes. |
| Financeiro | Novos guias de compensação e Pix; vínculos na gerência/carnês; modos Asaas; parâmetros de NFS-e Fortaleza por plano e preservação de notas antigas. |
| Sistema | API de parceiros atualizada, novo guia MCP/OAuth e Empresa alinhada à SPA e ao salvamento em etapas. |
| Rede | Servidores, cadastro, PPP, DNS/cache, monitor de gráficos e TR-069 corrigidos; novo guia de diagnóstico dos serviços de rede. |
| Bloqueio DNS | CSV/PDF atuais e validação estrita; transações parciais, limitações da exportação BIND e sincronização MikroTik não comprovada no backend. |
| Operação | Novas referências de arquitetura/serviços e atualização do banco/canais. |
| Manutenção | README com fluxo de contribuição, links na home, validador local e exclusão de `.env`/`wiki-ssh/` do versionamento. |
| Privacidade | As duas páginas foram explicitamente identificadas como roteiros incompletos; nenhum texto institucional foi inventado. |

Novos guias públicos:

- `contratos/alteracoes-em-massa.md`
- `dashboards/radar-de-clientes.md`
- `estoque/controle-patrimonial.md`
- `financeiro/compensacao-de-baixa.md`
- `financeiro/pix.md`
- `operacao/arquitetura-e-servicos.md`
- `operacao/atualizacao-do-banco.md`
- `rede-infra/operacao-servicos-rede.md`
- `relatorios/produtos-para-retirada.md`
- `relatorios/relatorio-de-clientes.md`
- `sistema/mcp.md`

As páginas alteradas mantêm limites explícitos. A presença de código ou de uma tela não foi tratada como prova de agendamento, compatibilidade de versões ou sucesso de integração externa.

## Próximas revisões priorizadas

Prioridade indica impacto documental, não um incidente confirmado em produção.

| Prioridade | Lacuna remanescente | Fonte e critério de conclusão |
|---|---|---|
| P1 | **47 relatórios com campos genéricos**; vários outros relatórios sem guia dedicado. | Começar por contas a receber/pagar, fiscal, estoque e clientes. Para cada rota em `lhisp-frontend/src/paginas/relatorios/index.tsx`, documentar filtros exatos, período, unidade contada, exclusões, permissões e exportação; confrontar BI/SQL e uma amostra controlada. |
| P1 | Políticas de privacidade completas ausentes. | `lhsac/privacy-policy.md` e `lhsac/nfibra-privacy-policy.md`. Obter o texto institucional aprovado, responsável, versão e destino de publicação; o código não fornece essas decisões. |
| P1 | Procedimentos de backup, restauração e recuperação após migration parcial ausentes. | `lhisp-manager/docker-compose.yaml`, tarefas de backup e `lhisp-dbupdater/src/dbupdate.js`. Documentar armazenamento, retenção, recuperação testada, canal/schema e verificação por base; saída zero do updater não basta. |
| P1 | Matriz de permissões e autenticação transversal incompleta. | Frontend/backend/PHP e OIDC. Mapear diferenças entre empresa, filial visível, filial atendida, caixa, admin e master; documentar sessões, recuperação e concessão de acesso por função. O guia MCP não cobre toda a autenticação do sistema. |
| P2 | Integrações com telas e sem guia específico ou suficiente. | `IntegracoesIndex.tsx`: Intelbras Mibo, PABX Megatelecom, LH-Crypto, LHChat e LHZap. TcIRR já possui guia em `rede-infra/tc-irr.md`, mas sua configuração de integração precisa ser confrontada e vinculada. Documentar configuração, gatilhos, retornos e falhas após revisar seus serviços. |
| P2 | Empresa/usuários/notificações ainda têm cobertura parcial das preferências. | A página Empresa foi alinhada às abas e ao salvamento, sem inventariar todos os campos e efeitos das automações. Confrontar configurators, jobs e mensagens; confirmar frequência instalada separadamente. |
| P2 | Aplicativos técnico e vendedor sem guias próprios. | `lhisp-tecnico/src/App.tsx`, `src/offline/`, `app-tecnico/src/app/`, `lhisp-vendas/src/`. Separar web/PWA e Expo; cobrir login, baixa, anexos, materiais, pendências offline, retentativas e pré-vendas B2B/B2C, sem presumir paridade. |
| P2 | Central do assinante sem guia operacional. | `lhsac-backend/src/rotas.1.0.0.js`: login, contratos, contas, Pix, documentos e solicitações. As duas páginas institucionais existentes não documentam esses fluxos. |
| P2 | Dashboards e cadastros sem cobertura dedicada. | Rotas de inadimplência, PowerBI, pré-cadastros, folha/complementos e grupos de atendimento. Elaborar guias a partir das rotas em `RouterPrincipal.tsx`, `marketing/index.tsx` e `cadastros/index.tsx`, seguindo a implementação. |
| P2 | Relatórios adicionais sem guia. | Rotas de aquisição, retenção, cobrança terceirizada, serviços pendentes e estoque por filial em `paginas/relatorios/index.tsx`. Verificar se substituem ou complementam relatórios antigos antes de remover páginas. |
| P2 | Fiscal e cobrança ainda precisam de matriz específica por integração. | NFS-e Fortaleza foi tratada; permanecem layouts remessa/retorno, particularidades de outros municípios, NFCom/NFe, emissão, cancelamento, rejeições e conciliação de PSPs. Validar fluxo e versão antes de descrever suporte como homologado. |
| P2 | Rede/fabricantes e retenção de logs não revisados integralmente. | Permanecem páginas de OLTs, mapas, monitor de redes, homologação por modelo/firmware e histórico/restore de backups. Guia novo cobre diagnóstico geral, sem certificar fabricantes. |
| P2 | Operação de cargas Radar e retirada automática não homologada. | Registrar executor, frequência efetiva, retomada e monitoramento no ambiente autorizado. A página Radar esclarece execução técnica manual; a rotina de retirada existente não comprova agendamento. |
| P2 | Capturas antigas. | Revalidar telas alteradas e substituir capturas após homologação visual. Capturas legadas identificadas não devem ser usadas para afirmar que a tela atual é idêntica. |
| P3 | Contato/horário de suporte sem confirmação institucional nesta auditoria. | `suporte/contato-suporte.md`. Confirmar canais, responsáveis e horário com o responsável pela publicação; nenhum dado de contato foi alterado por suposição. |
| P3 | Repositórios periféricos sem escopo documental definido. | `lh-erp`, `lh-saneamento`, `lh-sales-agent`, `wind-monitor`, sites e projetos de IA. Definir quais pertencem à documentação do LHISP e quais devem ter referências externas próprias. Inventário não equivale a auditoria desses produtos. |

## Triagem técnica encontrada durante a revisão

São observações de código local; nenhuma foi reproduzida em produção nem corrigida nesta tarefa documental.

| Observação | Evidência e encaminhamento |
|---|---|
| Botão de sincronização DNS MikroTik sem implementação localizada | `lhisp-frontend/src/api/mutations/rede_infra/useSincronizarDnsBloqueioJudicialServidor.ts:8` chama `DnsBloqueioJudicial.sincronizarServidor`; as operações registradas em `lhisp-backend/src/rotas/rotas-base.js:2764` e o BI não a implementam. Confirmar versões/rota antes de depender da função. |
| Exportação DNS: AAAA do ápice e HTTPS legado | `lhisp-backend/src/rotas/rotas-misc.js:756` e `:788`. A zona não declara AAAA explícito no ápice; a ordem das substituições pode omitir URL HTTPS legada. Limites registrados no guia. |
| Rotação MCP e access tokens anteriores | `lhisp-api-parceiros/src/services/McpOAuth.service.ts:181` não compara `clientSecretVersion`, embora o campo seja assinado em `:370`. Confirmar duração efetiva dos tokens anteriores após rotação; não prometer revogação imediata de todo acesso. |
| Netmon e gráficos declaram o mesmo nome de queue | `lhisp-daemon-netmon/src/consumers/ServidorConsumer.ts:16` e `lhisp-daemon-graficos/src/consumers/ServidorConsumer.ts:12`: `DaemonGraficos.ServidorConsumer`. Investigar possível competição de consumidores antes de concluir causa de uma perda de evento. |
| Carregamento alternativo de bases difere entre APIs da biblioteca | `lhisp-getdbconfig/src/get-dbconfig.ts:8` usa `LHISP_DATABASE_FILE`; `Config.service.ts:11` verifica outro caminho e `:48` lê o arquivo fixo. Referência de arquitetura qualificada. |
| Updater pode encerrar com zero após falhas individuais | `lhisp-dbupdater/src/dbupdate.js`: catch por banco e tratamento separado de menus antes de `process.exit(0)`. Validar logs e `LHISP.VERSAO` por base. |

Bloqueio judicial **centralizado** ainda tem plano e implementação inicial de parser no manager. O plano `docs/PLANO_MODULO_BLOQUEIO_JUDICIAL_CENTRALIZADO.md` não foi convertido em guia de funcionalidade entregue; a importação local CSV/PDF é um fluxo distinto.

## Evidências das alterações

Caminhos abaixo são relativos ao respectivo repositório-fonte; linhas referem-se aos hashes do inventário.

| Área | Fontes principais |
|---|---|
| Fila e OS | backend `src/lhisp-business/src/business/agendatecnica/AtendimentoBI.js:162`; frontend `src/paginas/agenda_tecnica/FilaAtendimento.tsx:155`; PHP `web/form/agendatec/os/imprimir.php:117`. |
| Pré-cadastro | backend `src/lhisp-business/src/business/sistema/PreCadastroBI.js:236`; frontend `src/paginas/cadastros/ModalConfirmarPreCadastro.tsx:150`. |
| SMS em massa | backend `src/rotas/rotas-contrato.js:8`, `:104`; frontend `src/paginas/contratos/ContratosAlteracoesEmMassa.tsx:33`. |
| Separação/patrimônio | backend `src/lhisp-business/src/business/estoque/OrdemSeparacaoBI.js:184`, `PatrimonioBI.js:399`; frontend `src/paginas/estoque/patrimonio/ControlePatrimonial.tsx:219`. |
| Clientes/retirada | backend `src/lhisp-business/src/business/relatorios/RelatorioBI.js:484`; frontend `src/paginas/relatorios/produtos_para_retirada/RelProdutosParaRetirada.tsx:95`; PHP `web/inc/services/ordem_servico/GerarOsRetiradaAutomaticaService.php:39`. |
| Radar | frontend `src/paginas/radar_clientes/VisaoBasica.tsx:65`, `ConfiguracoesRadar.tsx:193`; backend `src/lhisp-business/src/business/radar_clientes/RadarClientesPremiumBI.js:22`. |
| Compensação/Pix/origem | PHP `web/inc/services/financeiro/CompensarBaixaContaReceberService.php:31`, `PixCobrancasClient.php:9`; `web/inc/classes/ContaReceberDAO.php:467`, `:3738`, `:3921`. |
| Asaas/NFS-e | cobranças `src/psp/asaas/Assas.ts:191`; frontend `src/paginas/cadastros/financeiro/contas_bancarias/ContaBancaria.tsx:540`; PHP `web/inc/services/notafiscal/ParametrosNfsePlanoService.php:55`, `:201`, `web/inc/classes/NotaFiscalDAO.php:1380`. |
| API/MCP | API parceiros `src/app.ts:55`, `src/controllers/Cliente.controller.ts:294`, `OrdemServico.controller.ts:381`, `src/services/McpOAuth.service.ts:11`, `src/mcp/registry.ts:238`. |
| Empresa | frontend `src/paginas/sistema/Empresa.tsx:28`, `empresa/EmpresaFormsContext.tsx:93`, `empresa/EmpresaTabs.tsx:18`. |
| Servidores/gráficos | frontend `src/paginas/redeinfra/servidores/Servidor.tsx:71`; PHP `web/inc/classes/Mikrotik.php:1964`, `:2289`, `:2712`, `web/form/redeinfra/graphmon.js:64`, `monitoramentoGraficos.php:41`. |
| Serviços rede | daemon Mikrotik `src/services/ServidorProcessor.ts:78`; netmon `src/services/EmpresaWorker.ts:310`; syslog `src/core/empresaWorker.ts:30`; TR-069 `src/app.ts:205`, `:415`. |
| Importação DNS | frontend `src/paginas/redeinfra/dns/BloqueioJudicialCsvImport.tsx`, `parseAnatelPdf.ts`; backend `src/lhisp-business/src/business/redeinfra/DnsBloqueioJudicialBI.js:4`. |
| Arquitetura/migrations | nginx `src/lhisp.conf.template`; backend `src/lhisp-backend.js`; manager `docker-compose.yaml`, `.forgejo/workflows/deploy-updates.yml`; updater `src/dbupdate.js`. |

## Validação e critérios para continuar

- `python3 scripts/validar-documentacao.py`: **173 páginas, 233 links locais, zero erros** nos metadados essenciais e destinos Markdown locais, incluindo imagens. As quatro referências de imagens ausentes foram resolvidas.
- Frontmatter de todos os Markdown alterados validado também com PyYAML; aviso de IA preservado.
- Quatro cenários sintéticos do validador: caso válido com metadado vazio/exemplo de código, imagem ausente, campo obrigatório ausente e caminho fora do repositório.
- `git diff --check` e revisão dos diffs; revisão independente de DNS/arquitetura/updater, NFS-e/Asaas/origem e compensação.
- Nenhum build de aplicação: o repositório publica Markdown no Wiki.js e não contém manifest de build. Renderização no Wiki.js e cenários autenticados não foram executados.

Para fechar cada pendência, registre página, fluxo analisado, hash limpo da fonte, comportamento comprovado e validação. Mantenha a lacuna aberta quando faltar evidência; não troque um placeholder por outro texto genérico. Só promova um novo baseline quando todo o escopo declarado estiver realmente revisado.

## Inventário de fontes observadas

Todos os itens abaixo foram inventariados. A tabela não afirma leitura integral do código. Repositórios com alterações preexistentes não formam um baseline limpo; a revisão de cobranças evitou os trechos alterados. Os demais repositórios com alterações locais foram apenas inventariados.

| Repositório | Branch observada | HEAD observado | Estado inicial |
|---|---|---|---|
| `ai-assistant` | `main` | `5c58ce723b5efe0b0cfded25bc7d009170382d0b` | Limpo |
| `ai-prompts` | `main` | `6301a039ae64c62ba5bc4c062d827630d5ff5bef` | Limpo |
| `app-tecnico` | `development` | `113a47a393d9bf54b8953ff78cb0a7fa50c1a562` | Limpo |
| `devops` | `main` | `1148c53ba76b84cda9afd36993ef0352b79a7ec7` | Limpo |
| `lh-chat-bot` | `development` | `cf8d4260e719073cf07f4546fea342b7e209723d` | Limpo |
| `lh-erp` | `development` | `fd68ebd7fb10f5e112a0c7612d40d238d62b96b2` | Limpo |
| `lh-react-forms` | `main` | `42e2ace9662084bb467857bdc5370a6ecf692216` | Limpo |
| `lh-sales-agent` | `main` | `9a48d88ac3e006e19dda7ffa33d8e05b27484111` | 5 alterações locais preexistentes |
| `lh-saneamento` | `main` | `1800f9cab1c8d1a2b7e8635ca70d9a6e6ee7fc56` | 8 alterações locais preexistentes |
| `lh-whisper` | `main` | `8b6c6ea27eb1e02d7942c29607bfa4aa8cd8fc82` | Limpo |
| `lh-zap-api` | `main` | `2b214653bc642ea34f7167e5f87d8ab79a248a85` | Limpo |
| `lhisp-api-parceiros` | `development` | `05ad02e921b489b6e6944841774613e6167af4ae` | Limpo |
| `lhisp-backend` | `development` | `262fb86c111db952d233174ac5baba7416a96bb5` | Limpo |
| `lhisp-cobrancas` | `development` | `9056b7d5038026f5b82c302ef881832d1a5b1781` | 3 alterações locais preexistentes |
| `lhisp-daemon-graficos` | `master` | `291d6970d1e04ce09083140ca9095b68ec4ea9ea` | Limpo |
| `lhisp-daemon-mikrotik` | `development` | `204f6d6b1a3e79f10adc294abcd9565b8377ec01` | Limpo |
| `lhisp-daemon-netmon` | `master` | `91fa7eedd444a6c6d094ad59ee669ef13324d510` | Limpo |
| `lhisp-daemon-notificacoes` | `development` | `bd999c461533cb78bb3012eff744dc9b10b76d9c` | Limpo |
| `lhisp-daemon-olt` | `development` | `ee31a7cb3952fe749b8784bcf448cf154102f388` | Limpo |
| `lhisp-daemon-ott` | `development` | `f22b2eb9a364cb3e431da46c17ecbaa5c64d7bd2` | Limpo |
| `lhisp-daemon-syslog` | `master` | `2e6c8ccd6b22e8985a72893cefe42d46113217a3` | Limpo |
| `lhisp-daemon-tr069` | `development` | `01aaae89504a3cf407fd0dce9c0c9622f8b0bb74` | Limpo |
| `lhisp-daemon-voip` | `development` | `fc25a88aa111eb5d525acedc1c88c5f1d076c7b8` | Limpo |
| `lhisp-dbupdater` | `development` | `ef989773c3b8095da05e0bdd2b67bc9ab999c4d8` | Limpo |
| `lhisp-docs` | `dev` | `41fcd97a6e8e3e66502bc6b7bbb143b67db4bd42` | Limpo |
| `lhisp-eventbus-consumer` | `development` | `eeaa09af7acd364f206cb610f282eb05924f229b` | Limpo |
| `lhisp-frontend` | `development` | `69e4b49eee7c8c0e638adb73378993d337133532` | Limpo |
| `lhisp-getdbconfig` | `master` | `526ff9e6af3e9558a52971d685e3d570ebe22cdb` | Limpo |
| `lhisp-importacoes` | `fix/eventbus-connection-leak` | `a299b8cae64b673997c66b6c4606150fa941cea6` | Limpo |
| `lhisp-logger` | `master` | `491b6f48ac4d254141d1e26c03036f9523233949` | Limpo |
| `lhisp-manager` | `development` | `2f5dbedb0392551fe9b9bed9a89d7a4bf372bca1` | Limpo |
| `lhisp-nginx` | `development` | `ad175c8d079fd5f60a432e789b27cd51378528b7` | Limpo |
| `lhisp-php` | `development` | `e9aecbfc298a330f32151cffba8755be02c25edc` | Limpo |
| `lhisp-php-fpm` | `feat/imagick-heic` | `17389a57ddbb1dfd2d1f357585f769a35ad7879d` | Limpo |
| `lhisp-pix` | `development` | `da44466894b5bebd33706ff112fa138a3173dc0c` | Limpo |
| `lhisp-radius` | `development` | `4146f7154adf709313d0278091402e3ebe6dcb50` | Limpo |
| `lhisp-rsyslog` | `master` | `f3027ec039de1aec4abc1d1349684063b7f32c1d` | Limpo |
| `lhisp-site` | `dev` | `bb27cfc8e144053e63f90bd8754191e7820f61f6` | Limpo |
| `lhisp-tecnico` | `development` | `5ec0dc7f5ae5e9e7f45ffa222bde9aac45e422be` | Limpo |
| `lhisp-vendas` | `development` | `80895a277de6cbeea6484027bb70cf0196289262` | Limpo |
| `lhnfe` | `dev` | `d6fe5ada375ce89be65a365536260f9cfb9d8be0` | Limpo |
| `lhsac-backend` | `development` | `06268033ee7fc2ea7a4cfde13750c736d8b85701` | Limpo |
| `site-carbon` | `development` | `5e778ea5d2924facf23cc404eb63b641d5256b56` | Limpo |
| `wind-monitor` | `dev` | `7c2a546ec23ff41f40556e741701c8bdbed07041` | Limpo |
