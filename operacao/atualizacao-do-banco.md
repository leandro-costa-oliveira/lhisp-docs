---
title: Atualização do banco e canais de migrations
description: Origem das migrations, seleção de canal, aplicação e limites do lhisp-dbupdater.
published: true
editor: markdown
---

# Atualização do banco e canais de migrations

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.

Referência técnica baseada em `lhisp-manager` e `lhisp-dbupdater`, examinados em **14/10/2026**. Não constitui registro de atualização de uma instalação.

## Origem e publicação

O schema é versionado no `lhisp-manager`, em `src/database/updates/lhupdate-<N>.sql`. Atualizações antigas podem estar em diretórios `src/database/updates-<faixa>/`. A versão aplicada fica em `LHISP.VERSAO` de cada banco.

O workflow `.forgejo/workflows/deploy-updates.yml` publica SQLs e `version.txt` no bucket de atualizações. Os canais `development` e `master` recebem arquivos em prefixos próprios. A publicação envia os SQLs antes de `version.txt`; o canal `master` também mantém a publicação legada na raiz.

## Seleção de canal no updater

| `LHISP_UPDATES_CHANNEL` | Origem relativa no bucket |
|---|---|
| Ausente ou vazia | Raiz legada. |
| `development` | Prefixo `development/`. |
| `master` | Prefixo `master/`. |
| Outro valor não vazio | Erro de inicialização; o updater não aceita o canal. |

O canal do banco deve corresponder às imagens previstas para o ambiente. Trocar a variável não reverte migrations já aplicadas. O nome da branch do checkout local também não seleciona o canal em tempo de execução.

## Comportamento da aplicação

1. O updater prioriza as bases de `/etc/lhisp/databases.json` e ignora entradas com `desativarLhisp` habilitado. Se o arquivo não existir, usa um fallback embutido; não o trate como configuração válida da implantação.
2. Para cada base, lê a versão atual e consulta `version.txt` do canal escolhido.
3. Busca os arquivos `lhupdate-<N>.sql` em ordem crescente até a versão publicada.
4. Divide cada arquivo pelo caractere `;`, executa os trechos e atualiza `LHISP.VERSAO` dentro do callback transacional.
5. Depois de processar o schema da base, tenta atualizar os menus consultando a gerência.

O runner não interpreta SQL como um cliente completo: não use `;` em comentários/strings nem dependa de `DELIMITER` ou de procedures que exijam esse tratamento. A chamada transacional também não garante rollback de DDL que faça commit implícito no MySQL/MariaDB.

## Como verificar uma atualização autorizada

Antes de executar o procedimento de implantação da instalação, identifique o canal, as versões de origem/destino, o intervalo de SQLs e a compatibilidade das imagens. Prepare backup e recuperação conforme o procedimento operacional daquele ambiente.

Após a execução, confira **cada base esperada**, a versão e as mensagens de erro. Consulta de referência, no banco correto:

```sql
SELECT VERSAO FROM LHISP LIMIT 1;
```

No código atual, erros de uma base são capturados para permitir processar as demais; falhas de menus também são registradas separadamente. O processo pode terminar com código zero e imprimir `DONE` mesmo após falha de uma base. Portanto, saída do processo isoladamente não comprova sucesso de todas as atualizações.

Não avance `LHISP.VERSAO` manualmente para ocultar uma falha. Verifique o SQL afetado e o estado real antes de repetir uma execução: alterações DDL parcialmente aplicadas podem persistir.

## Pendências operacionais

O guia de [Backup e recuperação](/operacao/backup-e-recuperacao) descreve como conferir os artefatos e preparar uma restauração isolada. A homologação da recuperação, a matriz de compatibilidade entre imagens e schema e a duração/bloqueios das migrations dependem da implantação e precisam de validação em ambiente apropriado. Nenhum updater, banco ou servidor foi executado durante esta revisão documental.
