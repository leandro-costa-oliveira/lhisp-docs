---
title: DNS Bloqueio Judicial
published: true
editor: markdown
description: Cadastro de domínios e publicação da configuração BIND usada no bloqueio por DNS.
---

# DNS Bloqueio Judicial

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.

O Bloqueio Judicial mantém, por empresa, a relação de domínios que o servidor DNS deve responder com endereços de loopback. Ele apoia o cumprimento de ordens de bloqueio por DNS: o LHISP administra a lista e publica arquivos BIND, enquanto um processo externo no servidor DNS baixa, valida e recarrega a configuração.

Salvar um domínio não altera imediatamente o BIND. A efetivação depende da próxima sincronização e do `named` estar usando os arquivos publicados. Também não há inspeção de tráfego HTTPS ou bloqueio por IP nesta funcionalidade.

## Como a publicação funciona

O backend expõe dois arquivos:

| Endpoint | Conteúdo |
|---|---|
| `/api/dns/bloqueio.judicial.zone` | Zona-sumidouro comum, com respostas `127.0.0.1` e `::1`, inclusive para subdomínios por wildcard. |
| `/api/dns/bloqueio.judicial.conf` | Uma declaração `zone` para cada domínio da empresa, apontando para o arquivo de zona comum. |

Ao gerar o `.conf`, o backend normaliza cada entrada: remove caracteres não imprimíveis, usa o trecho posterior a ponto e vírgula, retira prefixos `http://` ou `https://`, descarta caminhos após `/` e ignora valores sem ponto. Domínios repetidos no resultado são emitidos uma só vez.

O contexto da empresa é necessário para gerar a lista correta. Use a URL da própria instância e os cabeçalhos/contexto definidos na implantação; ao acessar diretamente o backend, confirme `dbname` e `EmpresaId`. Uma configuração obtida no tenant errado pode aplicar bloqueios de outra base ou retornar lista vazia.

## Manter a lista no LHISP

Em **Rede e Infraestrutura → Configurações Globais → Bloqueio Judicial**, a consulta pesquisa pelo início do domínio e apresenta dez registros por página.

Para inclusão individual:

1. clique em **Novo**;
2. informe somente o host, por exemplo `exemplo.invalid`, sem protocolo, porta ou caminho;
3. salve e confirme a entrada na pesquisa;
4. aguarde a sincronização do DNS e teste a resposta no resolvedor do provedor.

O domínio é único por empresa. A tela individual limita o valor a 100 caracteres. Excluir o item o remove logicamente da lista, mas a zona continuará carregada no BIND até a próxima atualização do arquivo `.conf` e recarga do serviço.

## Importar CSV

A importação foi preparada para planilhas de bloqueio/desbloqueio, inclusive formatos usados em comunicações da Anatel. O leitor procura uma linha de cabeçalho iniciada por **Site**, **URL/Endereço IP do host**, **IP Host Address or URL** ou contendo **Operação**. Depois, o usuário escolhe a coluna que contém o domínio.

Se existir uma coluna **Operação**:

- `desbloqueio` ou `desbloquear` procura correspondências exatas e remove os registros encontrados;
- qualquer outro valor, coluna ausente ou célula vazia entra no lote de bloqueio.

As inclusões são executadas em transação, atualizam duplicidades e registram log por item. Valores do lote são cortados em 255 caracteres pelo backend, mas isso não garante domínio válido.

O parser separa linhas por quebra e colunas por vírgula; ele não implementa toda a sintaxe CSV, como vírgula dentro de campo entre aspas. Antes de confirmar, revise a prévia, a coluna selecionada, operações e linhas vazias. Para arquivos complexos, normalize-os em uma ferramenta de planilha e exporte CSV simples.

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

O resultado esperado para domínio e subdomínio é loopback. Teste também um domínio não bloqueado para garantir que a resolução normal continua funcionando. Considere cache e TTL de 3.600 segundos ao avaliar uma alteração recente.

## Problemas comuns

| Sintoma | Verificação |
|---|---|
| Domínio salvo continua resolvendo normalmente | Confira sincronização, include no `named.conf`, recarga, cache/TTL e resolvedor realmente usado pelo cliente. |
| `.conf` não contém o domínio | Use apenas host válido; confira tenant e normalização de protocolo, caminho ou caracteres. |
| Importação removeu/adicionou itens incorretos | Revise coluna **Operação**, coluna de domínio e limitações do parser CSV. |
| `named-checkconf` falha | Mantenha os arquivos ativos anteriores e revise conteúdo, caminho e permissões dos temporários. |
| BIND não recarrega | Consulte logs do serviço, SELinux/AppArmor, proprietário e acesso a `/var/named`. |
| Apenas alguns clientes continuam acessando | Confirme DNS recebido, cache local, DNS seguro no navegador, VPN e resolvedores externos. |

![Bloqueio Judicial de Domínios](/assets/screenshots/rede-infra/dns-bloqueio-judicial.png)
