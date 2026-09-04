---
title: Enviar Comandos
published: true
editor: markdown
description: Execução SSH direta de comandos em um ou vários equipamentos filtrados.
---

# Enviar Comandos

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.

**Enviar Comandos** é uma ferramenta administrativa para executar texto arbitrário por SSH em vários servidores. Ela atende correções ou consultas operacionais que não possuem ação própria no LHISP, mas ignora as validações de negócio dos cadastros e pode alterar simultaneamente muitos equipamentos.

> **Atenção:** a execução é direta e pode interromper autenticação, roteamento, firewall ou gerência. Use somente comandos revisados, em destinos autorizados, com backup e plano de reversão.

## Diferença para a fila automática

As automações de contratos, redes e servidores normalmente gravam comandos na fila e notificam um daemon. Esta ferramenta abre uma conexão SSH durante a própria requisição e executa o comando imediatamente em cada destino, um após o outro.

Consequências:

- não há transação ou rollback entre equipamentos;
- falha em um servidor não desfaz os anteriores;
- o retorno existe na página da execução, não como garantia de histórico persistente;
- o LHISP não atualiza seus cadastros para refletir alterações manuais no equipamento;
- repetir ou recarregar uma execução pode reaplicar comandos não idempotentes.

## Permissão e destinos

A execução exige a permissão `enviar_comandos`. A seleção começa como **Todos** e o filtro **Ativo** vem marcado.

- Sem IDs escolhidos, o backend percorre todos os servidores visíveis da empresa.
- Com IDs escolhidos, considera apenas esses servidores.
- Em ambos os casos, aplica em conjunto o tipo e todas as opções marcadas: **Ativo**, **Transmissor Wireless**, **Servidor de Acesso/PPPoE**, **Enlace**, **OSPF**, **IP Dinâmico** e **iBGP**.

Marcar várias opções usa lógica **E**: o equipamento precisa atender a todas. Deixar uma opção desmarcada não seleciona o valor “não”; apenas deixa de filtrar por ela.

O botão de limpeza remove a seleção explícita e retorna para **Todos**. Antes de executar, confira os rótulos mostrados e mantenha filtros restritivos. Nunca use “Todos” para experimentar sintaxe.

## Variáveis por servidor

Antes de abrir o SSH, o backend substitui marcadores no texto:

| Marcador | Valor cadastrado |
|---|---|
| `#ID#` | ID do servidor. |
| `#EMPRESA_ID#` | ID da empresa. |
| `#IP#` | Endereço IP do servidor. |
| `#NOME#` | Nome do servidor. |

A substituição é textual e diferencia maiúsculas de minúsculas. Revise o comando já expandido que aparece no resultado de cada servidor, especialmente quando nome ou IP fizer parte de comentário, arquivo ou identificador.

## Comportamento por fabricante

O texto enviado precisa usar a CLI do tipo selecionado:

- **Huawei:** o backend desabilita paginação temporária, envia cada linha não vazia e responde automaticamente `Y` quando o prompt pede confirmação.
- **Datacom:** habilita terminal interativo e envia o comando linha a linha, aguardando o prompt.
- **Demais tipos:** usa o executor SSH genérico/Mikrotik.

Isso não converte comandos entre fabricantes. Um texto RouterOS enviado a Huawei, Cisco ou equipamento “Outros” continua inválido e pode parar em um modo de configuração inesperado. Filtre sempre por tipo quando a sintaxe não for universal.

## Procedimento seguro

1. Confirme a permissão, a janela e o responsável pela mudança.
2. Faça backup e prepare o comando inverso.
3. Teste primeiro uma consulta somente leitura em um único equipamento.
4. Selecione explicitamente um pequeno lote do mesmo fabricante e versão.
5. Use marcadores somente onde o valor expandido é seguro.
6. Execute e leia comando e retorno de cada linha.
7. Valide o estado real no equipamento e no serviço afetado.
8. Amplie o lote gradualmente e registre externamente evidências e resultados.

Para mudanças já modeladas pelo LHISP, prefira o cadastro correspondente ou **Atualizar Servidor**. Assim, banco e equipamento permanecem coerentes.

## Interpretar o resultado

A tabela mostra nome/IP do servidor, comando expandido e saída SSH. Cada equipamento possui tratamento de erro próprio, então o processamento continua após uma falha individual.

Ausência de erro de transporte não significa que a CLI aceitou a mudança. Muitos equipamentos retornam mensagem de sintaxe ou aviso com sessão SSH bem-sucedida; leia a saída completa e faça uma consulta posterior. O total exibido no rodapé não deve substituir a conferência das linhas realmente processadas.

## Problemas comuns

| Sintoma | Verificação |
|---|---|
| `Acesso Negado` | O usuário não possui `enviar_comandos`. |
| Nenhum servidor aparece | Revise IDs, tipo e combinação dos filtros; **Ativo** vem marcado. |
| Erro de conexão SSH | Confira IP, porta, credenciais, algoritmo, ACL e caminho **Conectar por**. |
| Funciona em um fabricante e falha em outro | Separe os lotes e use a sintaxe da CLI correspondente. |
| Saída informa sucesso, mas cadastro diverge | A ferramenta não sincroniza de volta o estado do equipamento; ajuste pelo fluxo oficial quando necessário. |
| Parte do lote foi alterada | Não existe rollback coletivo; interrompa a ampliação, identifique as linhas concluídas e aplique o plano de reversão. |
| Comando executou novamente | Evite recarregar/repostar a página e use comandos idempotentes quando possível. |

![Enviar Comandos](/assets/screenshots/rede-infra/enviar-comandos.png)
