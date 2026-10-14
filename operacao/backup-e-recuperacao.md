---
title: Backup e recuperação do tenant
description: Artefatos de backup, retenção local, conferência diária e roteiro de restauração isolada do banco e configuração.
published: true
editor: markdown
---

# Backup e recuperação do tenant

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.

Referência técnica do backup implementado no backend e na gerência. Os procedimentos abaixo não foram executados contra uma instalação nesta revisão; a recuperação precisa registrar um teste real antes de ser considerada homologada.

## O que é copiado

| Artefato | Conteúdo e limite |
|---|---|
| Banco `tar.xz` | Arquivos SQL separados por tabela do banco selecionado. Não inclui automaticamente arquivos de anexos ou gráficos. |
| Configuração `json` | Somente a entrada do tenant em `databases.json`, enviada separadamente ao prefixo `config/`. Contém parâmetros e segredos necessários à recuperação. |
| RRD | Backup próprio do serviço de gráficos, separado do dump SQL. |
| Anexos | Dependem do armazenamento local/S3 e da política da instalação; não estão cobertos apenas pela presença do dump SQL. |

A configuração sensível não entra no pacote do banco. Um tenant não deve receber a configuração de todos os outros tenants do mesmo servidor. Chaves de cifra ausentes podem impedir recuperar credenciais cifradas mesmo quando o SQL foi restaurado.

O dump é feito tabela a tabela. Não existe nesse fluxo uma transação única que forneça um ponto consistente para todas as tabelas. Durante atividade concorrente, relacionamentos podem refletir momentos diferentes; `HISTORICOACESSO` também usa opção de dump sem trava de tabelas.

## Execução e envio

O serviço de referência é `lhisp-backup`, que executa `node src/services/backup.js`. A configuração de bases é carregada de `DATABASE_JSON_PATH`, padrão `/etc/lhisp/databases.json`. A execução geral ignora entradas com `ignorarBackup`; também existe seleção de uma base por argumento.

O arquivo `lhisp-manager/crontab` prevê backup do banco às **03h30** e RRD às **01h30**, no fuso do cron instalado. Isso descreve o arquivo versionado, sem confirmar que foi instalado ou que o servidor usa o fuso de Fortaleza. A tarefa central de conferência usa o **dia UTC**.

O processo cria uma trava por banco no volume de backup. Uma segunda execução pode ser ignorada com retorno sem erro enquanto outra está em andamento. Portanto, “execução ignorada” não é uma cópia nova; confirme o objeto daquele dia.

O diretório padrão é `/lh/lhisp/dados/backups`, alterável por `PATH_BACKUP`. Depois do dump, o processo empacota SQLs e comprime em `xz`, dimensionando recursos. Arquivos acima do limite padrão de PUT único de **4 GiB** usam multipart; partes têm **1 GiB** por padrão, com até três tentativas por parte.

O tenant autentica a solicitação de URL de envio com seu `ContratoUUID`. O dump é enviado antes da configuração. Uma falha no envio da configuração é registrada, mas não transforma necessariamente o backup SQL em erro; confira os dois artefatos.

## Retenção e comprovação

- Sem `BACKUP_MANTER_LOCAL`, o pacote local é removido depois do envio confirmado.
- `BACKUP_MANTER_LOCAL` aceita `1`, `true` ou `sim`; permite manter o pacote local após o envio.
- A limpeza local usa `BACKUP_DAYS`, padrão **10 dias**, para pacotes antigos. Isso não define a retenção do bucket S3.
- Restos de partes locais com mais de um dia são limpos no fluxo de backup.
- A retenção remota depende da configuração do bucket; não foi estabelecida por este guia.

Falhas em uma tabela são acumuladas: o processo pode **enviar um pacote parcial** e depois encerrar com erro indicando backup incompleto. Objeto presente, tamanho não zero e alerta diário de presença não comprovam integridade nem completude do SQL.

## Conferência diária da gerência

`VerificarBackups` compara as instalações esperadas com objetos no prefixo `<dia UTC>/db/`. O casamento usa `serverTag` e `dbname` quando disponíveis; sem `serverTag`, usa uma identificação menos precisa por base.

| Resultado | Interpretação |
|---|---|
| Com backup | Há objeto cujo nome corresponde à instalação. Não houve restauração ou verificação de todas as tabelas. |
| Sem backup | Não há objeto reconhecido para a instalação no dia consultado. |
| Objeto sem contrato associado | Existe objeto, mas a identificação não casou com o cadastro central; não equivale, sozinho, a falha no envio. |
| Nenhuma instalação identificada | A conferência é ignorada e avisa que não foi possível realizá-la; não é “todos os backups OK”. |

Confira divergência de `serverTag`/`dbname` após migrações de servidor. A contagem total de objetos inclui retentativas e não substitui a correspondência por instalação.

## Recuperação em ambiente isolado

1. Identifique tenant, dia, objeto SQL, objeto de configuração e versões das aplicações/schema que precisam ser recuperadas. Preserve os artefatos originais e registre suas identificações/checksums.
2. Obtenha os arquivos por um canal autorizado. Não publique URLs assinadas nem o JSON de configuração em chamados.
3. Inspecione o formato real antes de extrair. Objetos antigos podem ter extensão diferente do conteúdo; o fluxo atual anuncia `tar.xz`.
4. Teste a integridade de compressão e liste o pacote. Extraia em diretório descartável próprio, sem substituir diretórios da aplicação.
5. Prepare um servidor de banco **isolado e vazio**, sem conexão com integrações, filas, cron ou daemons de produção. Use uma versão compatível com o dump.
6. Examine os SQLs e a lista de tabelas. O dump contém instruções de banco/`USE`: informar outro banco na linha de comando não garante redirecionamento dessas instruções. Preserve o nome original somente dentro do servidor isolado.
7. Importe os arquivos com ordem/dependências e tratamento de chaves estrangeiras definidos para a versão do banco. Interrompa e registre erros; não use “ignorar erros” como critério de recuperação.
8. Confira `LHISP.VERSAO`, tabelas esperadas, contagens e relações de amostras de contratos, contas, históricos e estoque. Compare com o log de origem e a lista de falhas do dump.
9. Recupere a configuração recortada do tenant, incluindo chaves necessárias, em arquivo restrito. Substitua destinos externos no ambiente de teste e mantenha automações desativadas.
10. Recupere anexos/RRD separadamente, quando fizerem parte do incidente. Valide arquivos referenciados e permissões de leitura.
11. Faça os testes funcionais definidos para o incidente e registre duração, perdas conhecidas e responsáveis. Só então prepare o procedimento de retorno da instalação.

Inspeção local de um pacote XZ já obtido, sem conectar a banco ou servidor:

```bash
file backup.tar.xz
xz --test backup.tar.xz
tar --list --xz --file backup.tar.xz
```

O guia não fixa uma ordem universal de importação nem um comando para sobrescrever produção: os dumps usam SQL por tabela, com dependências e nomes próprios. Uma recuperação homologada deve versionar seu roteiro específico e os resultados obtidos, incluindo perda máxima aceita e tempo de recuperação.

## Falhas e retomada

| Situação | Tratamento |
|---|---|
| Sem objeto do dia | Verifique agenda efetiva, log, identificação, espaço, trava e comunicação com gerência/S3. |
| `Backup incompleto` | Identifique as tabelas que falharam; o pacote já enviado pode ser parcial. |
| SQL presente, configuração ausente | Confira o envio independente de configuração e recupere as chaves do tenant antes de concluir a restauração. |
| Multipart não concluído | Preserve chave, upload ID e partes registrados; investigue retomada/conclusão no fluxo técnico em vez de apagar objetos por suposição. |
| Arquivo local ausente após sucesso | Comportamento padrão; confirme o objeto remoto e a configuração. |
| Dump restaurado, sistema inconsistente | Verifique falhas por tabela, snapshot não transacional, versão/schema e arquivos externos. |

Consulte [Arquitetura e serviços](/operacao/arquitetura-e-servicos) e [Atualização do banco](/operacao/atualizacao-do-banco) antes de coordenar imagens e migrations da recuperação.
