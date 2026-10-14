---
title: DNS Bloqueio Judicial
published: true
editor: markdown
description: Cadastro de domínios, importação CSV/PDF e publicação da configuração BIND usada no bloqueio por DNS.
---

# DNS Bloqueio Judicial

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.

O Bloqueio Judicial mantém, por empresa, a relação de domínios que o servidor DNS deve responder com endereços de loopback. Ele apoia o cumprimento de ordens de bloqueio por DNS: o LHISP administra a lista e publica arquivos BIND, enquanto um processo externo no servidor DNS baixa, valida e recarrega a configuração.

Salvar um domínio não altera imediatamente o BIND. A efetivação depende da próxima sincronização e do `named` estar usando os arquivos publicados. Também não há inspeção de tráfego HTTPS ou bloqueio por IP nesta funcionalidade.

## Como a publicação funciona

O backend expõe dois arquivos:

| Endpoint | Conteúdo |
|---|---|
| `/api/dns/bloqueio.judicial.zone` | Zona-sumidouro comum: A para `127.0.0.1` no ápice e wildcard A/AAAA para `127.0.0.1` e `::1`. |
| `/api/dns/bloqueio.judicial.conf` | Uma declaração `zone` para cada domínio da empresa, apontando para o arquivo de zona comum. |

Ao gerar o `.conf`, o backend tenta normalizar entradas legadas: remove caracteres não imprimíveis, usa o trecho posterior a ponto e vírgula, trata prefixos de protocolo, descarta caminhos após `/` e ignora valores sem ponto. Domínios repetidos no resultado são emitidos uma só vez. O tratamento atual de `https:/` antes de `https://` pode descartar uma URL HTTPS antiga; confira o `.conf` gerado e corrija o cadastro para conter somente o domínio.

O contexto da empresa é necessário para gerar a lista correta. Use a URL da própria instância e os cabeçalhos/contexto definidos na implantação; ao acessar diretamente o backend, confirme `dbname` e `EmpresaId`. Uma configuração obtida no tenant errado pode aplicar bloqueios de outra base ou retornar lista vazia.

## Manter a lista no LHISP

Em **Rede e Infraestrutura → Configurações Globais → Bloqueio Judicial**, a consulta pesquisa pelo início do domínio e apresenta dez registros por página.

Para inclusão individual:

1. clique em **Novo**;
2. informe somente o host, por exemplo `exemplo.invalid`, sem protocolo, porta ou caminho;
3. salve e confirme a entrada na pesquisa;
4. aguarde a sincronização do DNS e teste a resposta no resolvedor do provedor.

O domínio é único por empresa. O backend remove espaços nas extremidades e o ponto final, converte para minúsculas e exige um domínio válido de até 100 caracteres. URLs completas, IPs, portas, caminhos e valores inválidos são recusados no cadastro e na inclusão em lote. A exportação BIND ainda normaliza entradas antigas; isso não significa que o cadastro atual aceite URLs.

Excluir o item o remove logicamente da lista, mas a zona continuará carregada no BIND até a próxima atualização do arquivo `.conf` e recarga do serviço. Recadastrar um domínio excluído restaura o registro existente.

## Importar CSV ou PDF

Na listagem, use **Importar CSV ou PDF**, selecione o arquivo e confira a prévia antes de salvar. A prévia mostra até 100 linhas; a importação envia todas as linhas carregadas.

### CSV

O leitor aceita vírgula ou ponto e vírgula, detectados pela primeira linha, campos entre aspas, aspas duplicadas e quebras de linha dentro de campos. Remove o BOM e ignora linhas vazias. Procura um cabeçalho iniciado por **Site**, **URL/Endereço IP do host**, **IP Host Address or URL** ou contendo **Operação**; se não encontrar, usa a primeira linha como cabeçalho.

A coluna do domínio é reconhecida por esses títulos ou por **Domínio**, **Dominio**, **Domain**, **URL** e **Site**. Confira a coluna selecionada antes de confirmar.

Se existir uma coluna **Operação**:

- `desbloqueio` ou `desbloquear` procura correspondências exatas e remove os registros encontrados;
- qualquer outro valor, coluna ausente ou célula vazia entra no lote de bloqueio.

O backend valida todos os domínios do lote de inclusão antes de gravá-lo, elimina repetições, restaura registros excluídos e registra log por domínio. As inclusões compartilham uma transação. Os desbloqueios são enviados antes, em chamadas separadas: a importação inteira não é uma transação única. Se houver falha após um desbloqueio, confira a lista antes de repetir.

### PDF

O parser reconhece dois layouts de PDF da Anatel pela primeira página: uma listagem com a marca `bet-legal.org/dominio/` e uma tabela de operações com **Todas/Any** e **Bloqueio**. Na listagem, os domínios são bloqueados; na tabela, a operação pode ser **Bloqueio** ou **Desbloqueio**. Repetições de domínio mantêm a última ocorrência extraída.

A extração usa texto e posição das colunas do PDF. Não há OCR para arquivos digitalizados. Outros layouts, PDFs sem texto ou documentos sem domínios reconhecidos retornam erro. Revise as operações e compare a quantidade com o documento original; o reconhecimento do layout não comprova a interpretação de toda a ordem.

## Opção de DNS no cadastro MikroTik

O cadastro de servidor exibe **DNS Bloqueio Judicial** para equipamentos MikroTik marcados como **Servidor de DNS**, além de um botão de sincronização após salvar. No checkout auditado em 14/10/2026, a interface chama `/api/DnsBloqueioJudicial.sincronizarServidor`, mas essa operação não foi localizada nas rotas ou no BI do backend. A presença do campo e do botão não comprova aplicação no equipamento. Confirme a compatibilidade das versões instaladas antes de depender desse fluxo; a publicação BIND descrita nesta página é um caminho separado.

## Configurar o BIND

No servidor DNS, inclua uma vez o arquivo gerado no `named.conf`:

```conf
include "/etc/named/bloqueio.judicial.conf";
```

Baixe os dois endpoints para arquivos temporários. Adapte URL, autenticação/contexto do tenant, usuário do serviço e caminhos à distribuição:

```bash
curl --fail --silent --show-error https://seu-lhisp/api/dns/bloqueio.judicial.zone --output /var/named/bloqueio.judicial.zone.tmp
curl --fail --silent --show-error https://seu-lhisp/api/dns/bloqueio.judicial.conf --output /etc/named/bloqueio.judicial.conf.tmp
```

Valide antes de substituir os arquivos ativos:

```bash
named-checkzone bloqueio.judicial /var/named/bloqueio.judicial.zone.tmp
named-checkconf /etc/named/bloqueio.judicial.conf.tmp
```

Como o `.conf` aponta para `/var/named/bloqueio.judicial.zone`, a automação deve instalar primeiro a zona validada, depois o `.conf`, validar a configuração completa e executar `reload` ou `restart` somente se todas as etapas tiverem sucesso. Preserve a versão anterior para reversão.

Não escreva a resposta HTTP diretamente sobre o arquivo ativo. Falha de rede, erro do backend ou página de proxy poderia truncar uma configuração funcional.

## Automatização

O repositório do LHISP não contém uma tarefa que atualize automaticamente o BIND externo. Agende no próprio servidor DNS um script que:

1. use trava para impedir execuções simultâneas;
2. baixe zona e configuração para temporários;
3. recuse arquivos vazios ou respostas HTTP com erro;
4. valide com `named-checkzone` e `named-checkconf`;
5. substitua os dois arquivos de forma atômica e com proprietário/permissões corretos;
6. recarregue o `named`;
7. registre sucesso ou falha e alerte a operação.

Defina a frequência conforme o prazo operacional das ordens. Após inclusão ou desbloqueio urgente, execute o processo controladamente e teste em mais de um resolvedor.

## Validação

Use um cliente que consulte diretamente o DNS autoritativo/recursivo configurado:

```bash
dig @IP_DO_DNS dominio-bloqueado.example A
dig @IP_DO_DNS dominio-bloqueado.example AAAA
dig @IP_DO_DNS sub.dominio-bloqueado.example A
```

O resultado esperado para A do domínio e para A/AAAA dos subdomínios é loopback. No template atual, a linha `AAAA ::1` sem proprietário vem após a entrada `*`, e não há uma declaração explícita de AAAA no ápice. Não conte com uma resposta `::1` para AAAA do domínio raiz sem validar a zona efetivamente carregada. Teste também um domínio não bloqueado para garantir que a resolução normal continua funcionando. Considere cache e TTL de 3.600 segundos ao avaliar uma alteração recente.

## Problemas comuns

| Sintoma | Verificação |
|---|---|
| Domínio salvo continua resolvendo normalmente | Confira sincronização, include no `named.conf`, recarga, cache/TTL e resolvedor realmente usado pelo cliente. |
| `.conf` não contém o domínio | Use apenas host válido; confira tenant e normalização de protocolo, caminho ou caracteres. |
| Importação removeu/adicionou itens incorretos | Revise coluna **Operação**, coluna de domínio, prévia e possíveis operações já concluídas antes de uma falha. |
| CSV contém URL completa ou domínio inválido | Informe somente o domínio válido, com até 100 caracteres; a inclusão em lote também valida esses limites. |
| PDF não reconhecido | Confira se é um dos dois layouts suportados e se contém camada textual. PDFs digitalizados exigem preparação externa. |
| `named-checkconf` falha | Mantenha os arquivos ativos anteriores e revise conteúdo, caminho e permissões dos temporários. |
| BIND não recarrega | Consulte logs do serviço, SELinux/AppArmor, proprietário e acesso a `/var/named`. |
| Apenas alguns clientes continuam acessando | Confirme DNS recebido, cache local, DNS seguro no navegador, VPN e resolvedores externos. |

![Bloqueio Judicial de Domínios](/assets/screenshots/rede-infra/dns-bloqueio-judicial.png)
