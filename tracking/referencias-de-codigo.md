---
title: Tracking da Documentação
published: true
editor: markdown
description: Baselines Git e cobertura usadas para atualizar a documentação de forma incremental
---

# Tracking da Documentação

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.

Este documento registra as versões do código usadas como fonte da documentação. Ele permite comparar um baseline conhecido com o estado atual dos repositórios e revisar somente as páginas possivelmente afetadas.

O hash de um repositório **não significa que toda a documentação foi validada contra ele**. A referência só é válida para os caminhos marcados como **Revisado** na matriz de cobertura.

## Snapshot B001

- Data de coleta: **2026-09-04**.
- Workspace: repositórios irmãos de `lhisp-docs` em `/home/loki/Projetos/lhsistemas`.
- Estado: todos os repositórios listados estavam sem alterações locais.
- Natureza: snapshot completo inicial. Os nomes das branches são informativos; o hash é a referência imutável.

### Fontes prioritárias

| Repositório | Branch observada | Commit de referência |
|---|---|---|
| `lhisp-frontend` | `development` | `daa4d64c565920817a853b7fa77f8e28dc58c8c8` |
| `lhisp-backend` | `development` | `297615f79b6e82e173c528330dbe96931633b664` |
| `lhisp-php` | `development` | `24ced303de42a255bd067a3b33b208b56430204d` |
| `lhisp-manager` | `development` | `d5680693223a657edd21e855dc4503b4a49ab83b` |

### Aplicações e serviços relacionados

| Repositório | Branch observada | Commit de referência |
|---|---|---|
| `ai-assistant` | `main` | `5c58ce723b5efe0b0cfded25bc7d009170382d0b` |
| `app-tecnico` | `development` | `113a47a393d9bf54b8953ff78cb0a7fa50c1a562` |
| `devops` | `main` | `9b4445bdd5f2941563fc50d6a36a4a1cbf153816` |
| `lh-chat-bot` | `development` | `cf8d4260e719073cf07f4546fea342b7e209723d` |
| `lh-erp` | `development` | `ce11d16c6eede209eda369838b24217ac3e4f348` |
| `lh-react-forms` | `main` | `42e2ace9662084bb467857bdc5370a6ecf692216` |
| `lh-whisper` | `main` | `8b6c6ea27eb1e02d7942c29607bfa4aa8cd8fc82` |
| `lh-zap-api` | `main` | `2b214653bc642ea34f7167e5f87d8ab79a248a85` |
| `lhisp-api-parceiros` | `development` | `48579affdd87796035555e171238f544ace3a7e5` |
| `lhisp-cobrancas` | `development` | `872a3a0b9082ea93abdeb62c42ef531786c339da` |
| `lhisp-daemon-graficos` | `master` | `291d6970d1e04ce09083140ca9095b68ec4ea9ea` |
| `lhisp-daemon-mikrotik` | `development` | `a5f278ec44e0a3194d012257aa29b1ee1ca9444d` |
| `lhisp-daemon-netmon` | `master` | `91fa7eedd444a6c6d094ad59ee669ef13324d510` |
| `lhisp-daemon-notificacoes` | `development` | `ade41d39fa1dfc3b011cb672f80a066a6df8ef87` |
| `lhisp-daemon-olt` | `development` | `ee31a7cb3952fe749b8784bcf448cf154102f388` |
| `lhisp-daemon-ott` | `development` | `f22b2eb9a364cb3e431da46c17ecbaa5c64d7bd2` |
| `lhisp-daemon-syslog` | `master` | `2e6c8ccd6b22e8985a72893cefe42d46113217a3` |
| `lhisp-daemon-tr069` | `development` | `01aaae89504a3cf407fd0dce9c0c9622f8b0bb74` |
| `lhisp-daemon-voip` | `development` | `fc25a88aa111eb5d525acedc1c88c5f1d076c7b8` |
| `lhisp-dbupdater` | `master` | `fa914dd1d42e3109a397114e7b549d05b346bd40` |
| `lhisp-eventbus-consumer` | `development` | `eeaa09af7acd364f206cb610f282eb05924f229b` |
| `lhisp-importacoes` | `fix/eventbus-connection-leak` | `a299b8cae64b673997c66b6c4606150fa941cea6` |
| `lhisp-logger` | `master` | `491b6f48ac4d254141d1e26c03036f9523233949` |
| `lhisp-nginx` | `development` | `ad175c8d079fd5f60a432e789b27cd51378528b7` |
| `lhisp-php-fpm` | `feat/imagick-heic` | `17389a57ddbb1dfd2d1f357585f769a35ad7879d` |
| `lhisp-pix` | `fix/eventbus-connection-leak` | `931d103024d727afd554bca2fcc9a3bc59c22b03` |
| `lhisp-radius` | `development` | `4146f7154adf709313d0278091402e3ebe6dcb50` |
| `lhisp-rsyslog` | `master` | `f3027ec039de1aec4abc1d1349684063b7f32c1d` |
| `lhisp-site` | `main` | `16d876e2d59979bd322975b67ccf519c0169f7bd` |
| `lhisp-tecnico` | `development` | `5ec0dc7f5ae5e9e7f45ffa222bde9aac45e422be` |
| `lhisp-vendas` | `development` | `80895a277de6cbeea6484027bb70cf0196289262` |
| `lhnfe` | `dev` | `45394e75e0073d9e51ff2f1277a2c79aaa52f0f3` |
| `lhsac-backend` | `development` | `8dab244f08ebb3a4cf6f6b50e2578fe3d98d1519` |
| `site-carbon` | `development` | `5e778ea5d2924facf23cc404eb63b641d5256b56` |
| `wind-monitor` | `dev` | `e36dee86ea138cfbec0cea84e4eef9f3b0168baa` |

## Alterações posteriores detectadas

Esta fila registra `HEADs` observados depois do snapshot, mas ainda não promovidos a baseline. Uma entrada só pode ser removida após analisar o diff, atualizar ou confirmar as páginas afetadas e criar um novo snapshot.

| Repositório | De B001 | HEAD observado | Estado | Páginas candidatas |
|---|---|---|---|---|
| `lhisp-frontend` | `daa4d64c565920817a853b7fa77f8e28dc58c8c8` | `b2e6348acf7681cc58f316a52205907ba7488ffa` | Pendente | `rede-infra/cadastrar-servidor.md`, `rede-infra/servidores.md` |
| `lhisp-php` | `24ced303de42a255bd067a3b33b208b56430204d` | `d10243004a36f7624a39bd06314dcf928ad397ed` | Pendente | `agenda-tecnica/agenda-tecnica.md`, `contratos/adicionar-acesso-cliente.md` e páginas de servidor, CGNAT e diagnóstico de acesso em `rede-infra/**` |
| `lhisp-api-parceiros` | `48579affdd87796035555e171238f544ace3a7e5` | Mesmo commit; worktree alterada | Não versionado | `sistema/api-parceiros.md` e documentação de impressão de OS |

Resumo preliminar dos diffs:

- o frontend removeu do formulário de servidor as opções de autenticação PPP;
- o PHP alterou impressão/listagem de ordens de serviço, diagnóstico de autenticação Radius, configuração CGNAT e os formulários de acesso e servidor;
- o `lhisp-api-parceiros` possui o arquivo local não versionado `bruno/Obter PDF Ordem Serviço.yml`, SHA-256 `091612d6fa460f5e3ad19822f68ed1ed5b437dafd622c6ba7e303e281942f2f8`, descrevendo `GET /api-parceiros/ordem_servico/:id/pdf`;
- a remoção de arquivos antigos de configuração Radius precisa ser separada das mudanças funcionais durante a análise.

Essas descrições servem apenas para triagem e **não substituem a leitura do diff**. Enquanto a fila estiver pendente, as páginas candidatas revisadas em `B001` não devem ser consideradas atualizadas até o `HEAD` observado.

## Cobertura da documentação

O commit de conclusão identifica o ponto do histórico de `lhisp-docs` em que o conjunto ficou revisado. Cada arquivo continua tendo seu próprio commit, conforme o histórico Git.

| Caminho no `lhisp-docs` | Estado | Snapshot de código | Commit de conclusão |
|---|---|---|---|
| `agenda-tecnica/**` | Revisado em B001; diff posterior pendente | `B001` | `5cfb597` |
| `cadastros/**` | Revisado | `B001` | `4bce433` |
| `contratos/**` | Revisado em B001; diff posterior pendente | `B001` | `163cccd` |
| `dashboards/**` | Revisado | `B001` | `4243e8e` |
| `estoque/**` | Revisado | `B001` | `4b6081d` |
| `financeiro/**` | Revisado | `B001` | `b23863b` |
| `home.md` e `index.md` | Revisado | `B001` | `f74251c` |
| `misc/exportar-boletos-gerencianet.md` | Revisado | `B001` | `7c2c6a1` |
| `rede-infra/**` | Pendente de revisão completa | — | — |
| `relatorios/**` | Pendente de revisão completa | — | — |
| `sistema/**` | Pendente de revisão completa | — | — |
| `lhsac/**` | Pendente de revisão completa | — | — |
| `suporte/**` | Pendente de revisão completa | — | — |
| `README.md`, `.claude/CLAUDE.md` e `tasks/**` | Pendente de revisão editorial | — | — |

## Como detectar alterações

Para cada repositório relevante, compare o hash do snapshot com o `HEAD` que será usado na nova revisão:

```bash
git -C ../lhisp-frontend status --short
git -C ../lhisp-frontend rev-parse HEAD
git -C ../lhisp-frontend log --oneline --decorate daa4d64c565920817a853b7fa77f8e28dc58c8c8..HEAD
git -C ../lhisp-frontend diff --name-status daa4d64c565920817a853b7fa77f8e28dc58c8c8..HEAD
git -C ../lhisp-frontend diff daa4d64c565920817a853b7fa77f8e28dc58c8c8..HEAD -- src/paginas src/api
```

Repita a comparação no backend, PHP e serviços relacionados. Use `git log` para entender a intenção da mudança e `git diff` para validar o comportamento efetivamente alterado.

Não compare apenas nomes de arquivos. Siga as relações entre:

- rotas, componentes e chamadas de API no frontend;
- regras de negócio, modelos, permissões e transações no backend;
- ações, DAOs e páginas ainda executadas no PHP;
- crontabs, workers, consumidores de eventos, daemons e integrações;
- atualizações de banco no `lhisp-manager` e `lhisp-dbupdater`.

## Como relacionar o diff às páginas

Use o caminho alterado e os identificadores encontrados no diff para procurar referências na documentação:

```bash
rg -n "NomeDaClasse|NomeDaRota|nome_da_permissao|Texto da tela" .
```

Se a busca direta não encontrar uma página, avalie o módulo funcional. Uma alteração em geração de contas, por exemplo, pode afetar simultaneamente contratos, financeiro, impressão, cobrança bancária e relatórios.

Classifique cada mudança:

| Classe | Tratamento |
|---|---|
| Interface sem mudança de comportamento | Confira nomes, campos, passos e capturas. |
| Regra de negócio ou validação | Atualize propósito, condições, erros e efeitos relacionados. |
| Automação, job ou evento | Documente frequência, critérios, idempotência e falhas parciais. |
| Integração externa | Confira configuração, gatilhos, dados enviados, retornos e contingência. |
| Banco/modelo | Procure impactos em filtros, estados, relacionamentos e compatibilidade. |
| Refatoração interna equivalente | Registre como analisada no tracking; a página pode não precisar mudar. |

## Como avançar o baseline

1. Confirme que o repositório-fonte está limpo. Alterações locais não são representadas pelo hash e impedem um baseline confiável.
2. Crie um novo identificador sequencial, como `B002`, com data e hashes efetivamente analisados.
3. Um snapshot novo pode herdar o anterior. Registre somente os repositórios cujo hash mudou e declare explicitamente `Herda: B001`.
4. Atualize e valide cada página afetada contra o código.
5. Faça o commit e o push exclusivos da página revisada.
6. Em outro commit exclusivo, atualize neste documento a linha de cobertura para o novo snapshot e informe o commit da página.
7. Não avance a cobertura de um diretório inteiro enquanto restar algum arquivo afetado sem análise.

Exemplo de snapshot incremental:

```yaml
id: B002
data: AAAA-MM-DD
herda: B001
repositorios_alterados:
  lhisp-frontend: NOVO_HASH
  lhisp-backend: NOVO_HASH
```

Se um commit de referência não existir mais após reescrita do histórico, tente recuperar as referências remotas. Se o hash continuar indisponível, marque o baseline como inválido e faça uma validação completa do escopo afetado.

## Checklist de encerramento

- Diff do código analisado do baseline até o novo hash.
- Impactos indiretos pesquisados nos demais repositórios.
- Conteúdo confrontado com frontend, backend e legado, nessa ordem.
- Aviso de conteúdo gerado por IA preservado em todo `.md` alterado.
- `git diff --check` e diff completo da página revisados.
- Um commit e um push exclusivos por arquivo de documentação.
- Snapshot e matriz de cobertura atualizados sem ocultar pendências.
