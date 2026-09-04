---
title: IPv6
published: true
editor: markdown
description: Cadastro, divisão e atribuição de prefixos IPv6 aos acessos de um servidor
---

# IPv6

O IPv6 no LHISP é administrado por servidor. A operadora cadastra um bloco agregado que já recebeu e roteou até o concentrador; o sistema divide esse bloco em prefixos menores e reserva um deles para cada acesso. Nos servidores Mikrotik, a reserva também origina comandos para entregar o prefixo ao assinante pelo perfil PPPoE.

Essa estrutura mantém o inventário de endereçamento vinculado aos contratos e permite saber quais prefixos estão livres, utilizados ou deixaram de ser usados. Ela não substitui o planejamento da rede nem providencia o anúncio ou o roteamento do bloco pelo upstream.

## Como os prefixos se relacionam

O LHISP trabalha com quatro níveis relacionados:

1. **Bloco da operadora:** prefixo recebido do provedor de trânsito ou do registro responsável, por exemplo `2804:1234::/40`.
2. **Prefixo do servidor:** bloco agregado cadastrado na aba **IPv6** de [Servidores](/rede-infra/servidores).
3. **Subprefixo do acesso:** divisão gerada automaticamente conforme o tamanho de alocação escolhido. Cada subprefixo pode pertencer a somente um acesso por vez.
4. **Pool no Mikrotik:** quando o acesso recebe um subprefixo, o LHISP cria o pool `lhuser-ID_DO_ACESSO`, usando o bloco reservado e `prefix-length=64`, e o associa ao profile PPPoE como `remote-ipv6-prefix-pool` e `dhcpv6-pd-pool`.

Por exemplo, dividir um `/56` com tamanho de alocação `/62` produz 64 subprefixos. Cada assinante recebe um `/62`, e o pool do roteador pode fornecer redes `/64` dentro dessa delegação.

## Pré-requisitos

- permissão para editar servidores;
- servidor/concentrador previamente cadastrado;
- bloco IPv6 válido e já encaminhado até o servidor;
- definição do tamanho que será delegado aos clientes;
- comunicação operacional entre o LHISP e o Mikrotik, quando houver configuração automática;
- utilitário `sipcalc` disponível no ambiente do backend legado, pois ele é usado para gerar as subdivisões.

Cadastrar o bloco não cria rotas, anúncios BGP ou regras no equipamento. Esses elementos devem existir de acordo com o projeto da operadora.

## Cadastrar um bloco

1. Acesse **Rede/Infra > Servidores** e edite o servidor.
2. Abra a aba **IPv6**.
3. Informe o prefixo com sua máscara, como `2804:1234::/40`.
4. Selecione o **Tamanho da alocação**, isto é, a máscara dos blocos que serão entregues aos acessos.
5. Confirme o cadastro.

O endereço precisa ser um IPv6 válido e o tamanho da alocação deve ser maior que a máscara do bloco agregado. A interface oferece tamanhos até `/62` e impede uma operação que gere mais de 8.192 subprefixos. Essa proteção evita um cadastro excessivamente grande; quanto maior a diferença entre as máscaras, maior será a quantidade de registros gerados.

Antes de salvar, confirme também que o bloco está normalizado e não se sobrepõe a outro já cadastrado. O backend valida o formato, mas não impede de forma abrangente blocos duplicados ou sobrepostos.

## Escolha do bloco pela rede

Uma [Rede](/rede-infra/redes) pode indicar qual prefixo IPv6 do servidor deve abastecer seus acessos. Essa associação é importante quando o mesmo concentrador possui mais de um bloco agregado: ao criar ou editar um acesso nessa rede, o LHISP procura um subprefixo livre dentro do bloco selecionado.

Sem essa seleção, o sistema pode usar o próximo subprefixo disponível do servidor. Se não houver nenhum livre, o acesso pode permanecer sem IPv6; o esgotamento não impede necessariamente a criação do acesso.

Ao transferir o acesso para outra rede ou servidor, o sistema tenta reservar um prefixo compatível com o novo destino. Se o novo contexto não utilizar IPv6, a associação anterior é removida.

## Atribuição automática e em lote

Na criação de um acesso, o LHISP procura um subprefixo livre, relaciona-o ao acesso e registra o início do uso no histórico IPv6 do contrato. Em Mikrotiks, também enfileira a recriação do pool e a atualização do profile PPPoE correspondente.

A aba IPv6 do servidor oferece atribuição em lote aos acessos não cancelados. Antes de executar, use a prévia e confira os estados apresentados:

| Estado | Significado |
|---|---|
| **Novo** | acesso sem prefixo que receberá o próximo disponível |
| **Atribuído** | acesso que já possui uma reserva coerente |
| **Órfão** | o acesso informa um prefixo que não pertence mais ao inventário atual do servidor |
| **Divergente** | a reserva e o prefixo gravado no acesso não coincidem; a execução sincroniza os dados |
| **Indisponível** | não há subprefixo livre para atender o acesso |

A execução trata cada acesso individualmente. Portanto, uma falha no meio do processo pode produzir um resultado parcial. Confira o resumo final e repita a prévia para localizar itens ainda pendentes.

## Consultar utilização

Ao abrir os detalhes de um prefixo, a página apresenta os totais de subprefixos, usados e livres. A listagem é paginada em grupos de 100 e pode exibir apenas os utilizados.

O filtro por prefixo, contrato, cliente, usuário ou MAC atua sobre os registros carregados na página. Se o item não aparecer, avance na paginação antes de concluir que ele não existe.

O LHISP também mantém o período de utilização do prefixo por contrato. Quando a associação é encerrada, o subprefixo volta a ficar livre e a data final do histórico é preenchida; uma nova atribuição cria outro período.

## Remover um bloco

A exclusão é irreversível e não remove somente o cadastro principal. O LHISP:

- libera e exclui os subprefixos do bloco;
- retira o IPv6 dos acessos associados;
- encerra os respectivos registros de histórico;
- exclui o prefixo agregado.

Revise os acessos afetados antes de confirmar. Há uma limitação no fluxo atual de remoção: ao retirar somente o prefixo de um acesso Mikrotik, inclusive durante a exclusão do agregado, os dados são limpos no LHISP, mas a remoção do pool `lhuser-ID_DO_ACESSO` pode não ser enviada ao roteador. Depois da operação, valide o equipamento e remova referências residuais quando necessário.

## Aplicação no Mikrotik

As mudanças no equipamento não são síncronas. O LHISP grava ações na fila do servidor e o serviço de integração com Mikrotik as executa posteriormente. Assim, uma atribuição salva com sucesso confirma a reserva no sistema, mas não garante que o roteador já tenha aplicado os comandos.

Ao atualizar um servidor, existem rotinas separadas para:

- **IPv6:** recriar pools e configurações IPv6 dos profiles PPPoE dos acessos ativos;
- **Firewall IPv6:** recriar as regras IPv6 administradas pelo LHISP.

Selecione somente a rotina necessária e acompanhe a fila e a conectividade do servidor. Para diagnóstico controlado, [Enviar Comandos](/rede-infra/enviar-comandos) pode ser usado, mas comandos manuais não atualizam o inventário de prefixos do LHISP.

## Sobre a habilitação do IPv6 no RouterOS

Versões antigas desta página orientavam habilitar um pacote chamado `ipv6`, reiniciar o equipamento e distribuir esse comando em lote. Esse não é o fluxo implementado pela funcionalidade atual: o LHISP pressupõe que os menus `/ipv6` estejam disponíveis e não habilita pacote nem reinicia o roteador ao cadastrar ou atribuir prefixos.

Em instalações legadas, verifique a versão e os pacotes diretamente no equipamento antes de usar a automação. Não envie o antigo comando indiscriminadamente para todos os servidores.

## Diagnóstico

| Sintoma | Verificação |
|---|---|
| O bloco não é aceito | valide o endereço, a máscara e se o tamanho de alocação é maior que a máscara do agregado |
| A interface recusa a subdivisão | reduza a diferença entre as máscaras para gerar no máximo 8.192 subprefixos |
| O acesso ficou sem IPv6 | confira prefixos livres no servidor e o bloco selecionado na rede |
| A prévia mostra órfão ou divergente | revise a origem do prefixo e confirme a atribuição para normalizar o acesso |
| O prefixo aparece no LHISP, mas não no roteador | verifique a comunicação, a fila de ações e o profile `lhuser-ID_DO_ACESSO` |
| Um pool permaneceu após a exclusão | faça a conferência no Mikrotik e limpe o pool ou profile residual |
| O cliente recebe IPv6, mas não navega | confirme roteamento do agregado, firewall IPv6 e delegação no CPE; o cadastro isolado não cria a rota upstream |

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.
