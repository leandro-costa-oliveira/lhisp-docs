---
title: Cadastrar rede
published: true
editor: markdown
description: Definição de redes de acesso e backbone usadas para liberar clientes e provisionar equipamentos.
---

# Cadastrar rede

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.

Uma rede representa o ponto lógico e físico em que um acesso será entregue. Ela liga setor, concentrador, interface, prefixos e, conforme a tecnologia, ponto de acesso ou porta de OLT. Ao liberar um cliente, o LHISP usa essa definição para validar capacidade e POP, atribuir endereçamento e provisionar o acesso nos equipamentos.

Existem dois usos distintos:

- **Rede de acesso:** selecionável no contrato para liberação de clientes. Define tecnologia e pode herdar blocos IPv4/IPv6 do servidor.
- **Rede administrativa:** representa enlaces de uso interno ou backbone. Exige rede, máscara e interface e não participa do mesmo fluxo de seleção tecnológica do assinante.

## Antes de cadastrar

Cadastre primeiro os elementos referenciados pela rede:

- [setor](/rede-infra/setores), para organizar a área de atendimento;
- [servidor](/rede-infra/servidores), que concentra e provisiona os acessos;
- [prefixos IPv4 e IPv6](/rede-infra/prefixos-de-ip), quando a rede distribuir endereços;
- ponto de acesso Wireless ou OLT GePON/GPON, quando aplicável.

A descrição deve ser única. O backend também impede usar como interface da rede uma das interfaces de saída configuradas no servidor.

## Criar a rede

Em **Rede e Infraestrutura → Redes**, clique em **Novo** e defina:

1. se a rede é de acesso ou administrativa;
2. setor, descrição e servidor;
3. interface e limite de acessos;
4. prefixos IPv4/IPv6 ou endereço e máscara, conforme o tipo;
5. tecnologia e dados do equipamento de acesso;
6. opções **NAT** e **Exigir POP**.

Depois de salvar, confira a rede na listagem e no cadastro do servidor. Para redes ópticas, valide também se OLT, slot, porta, uplink e VLAN correspondem à topologia real.

## Tecnologia e vínculos

| Tecnologia | O que a rede passa a representar |
|---|---|
| **Wireless** | Um ponto de acesso e sua interface de entrega. |
| **GePON** | Uma placa e porta PON de uma OLT GePON. A OLT é obrigatória. |
| **GePON - Auth Mac** | A mesma topologia GePON, com autenticação baseada em MAC no fluxo correspondente. |
| **GPON** | Uma OLT GPON, slot, porta PON, uplink e VLAN usados no provisionamento de ONUs. A OLT é obrigatória. |
| **Cabo UTP / Outros** | Entrega genérica sem vínculo obrigatório com OLT ou ponto de acesso. |

Ao trocar a tecnologia, o backend limpa vínculos que pertenciam ao tipo anterior. Não reutilize uma rede existente apenas para alterar a topologia sem antes avaliar os acessos já associados.

## Endereçamento

Em rede de acesso, **Prefixo IPv4** e **Prefixo IPv6** apontam para blocos cadastrados no servidor. Esses vínculos orientam a escolha e a associação de subprefixos aos acessos.

Em rede administrativa, informe o endereço, a máscara e a interface. O backend aceita máscaras entre `/24` e `/31`, calcula rede, máscara e broadcast e recusa intervalos sobrepostos detectados. Para máscaras menores que `/31`, o endereço informado não pode ser o broadcast.

O campo **NAT** participa da configuração da rede no concentrador. Ele não substitui o cadastro de CGNAT nem define sozinho o endereço público do cliente.

## Limite de acessos e POP obrigatório

**Limitar quantidade de acessos** é uma trava de capacidade. Na criação de um acesso, o backend conta os acessos já liberados na rede e recusa o novo quando o limite foi atingido. Valor zero deixa a rede sem esse limite.

**Exigir POP** torna o ponto de presença obrigatório na liberação e na alteração do acesso. Existe uma exceção no cadastro inicial quando a empresa configurou o POP para ser escolhido pelo técnico na baixa da OS de instalação; nesse caso, a exigência é adiada para a execução da ordem.

Essas opções afetam contratos e ordens de serviço, não apenas a exibição desta tela.

## Automações ao salvar

Ao criar uma rede, o backend grava o vínculo e solicita sua configuração no servidor. Em rede GPON, também chama o configurador da OLT para criar a rede na uplink indicada. Por fim, publica um evento de cadastro para os demais serviços.

Alterar uma rede pode ter efeitos maiores:

- os dados GPON de todos os acessos da rede recebem o novo slot e a nova porta;
- a configuração anterior é removida e a nova é enviada ao concentrador;
- se o servidor mudou, acessos não cancelados nem suspensos perdem as associações antigas de prefixos, recebem os próximos subprefixos livres do novo servidor quando disponíveis e são removidos do equipamento antigo e adicionados ao novo;
- o servidor gravado nos acessos acompanha o novo servidor da rede;
- em GPON, a nova configuração também é aplicada à OLT;
- um evento de alteração é publicado.

Por isso, trate mudança de servidor, prefixo, tecnologia, VLAN, slot ou PON como migração de rede. Planeje janela, confira disponibilidade de endereços e valide os comandos/equipamentos depois da operação.

## TR-069

Quando o módulo comercial TR-069 está ativo e a rede já foi salva, a página apresenta o painel de autoconfiguração de CPEs. A ativação exige VLAN e pool CIDR. O setup é aplicado de forma assíncrona pelo daemon e passa pelos estados **PENDENTE**, **APLICADO** ou **ERRO**; a tela também permite reaplicar ou desativar.

Salvar os dados básicos da rede não significa que o setup TR-069 já foi aplicado. Aguarde o status e examine a mensagem de retorno.

## Transferir acessos

A função legada **Transferir acessos** move todos os acessos de uma rede de origem para outra. Para cada acesso, o LHISP remove a configuração anterior, altera a rede e recria a configuração. Se o servidor for diferente, também desassocia os prefixos antigos e tenta reservar os próximos IPv4 e IPv6 disponíveis no destino.

A rotina processa um acesso por transação. Uma falha no meio pode deixar parte dos clientes já transferida; valide contagem, prefixos, autenticação e conectividade após a execução.

## Exclusão

A rede não pode ser apagada enquanto houver nela acessos cujo serviço esteja **ATIVO** ou **BLOQUEADO**. Transfira ou regularize os acessos antes. A remoção também comunica o configurador da tecnologia e publica evento para os serviços integrados.

Não interprete a ausência de acessos ativos como garantia de que a rede é descartável: confira acessos suspensos/cancelados, histórico, OLT, prefixos e dependências operacionais.

## Problemas comuns

| Sintoma | Verificação |
|---|---|
| Rede administrativa não salva | Informe rede, máscara `/24` a `/31` e interface; verifique sobreposição e broadcast. |
| Interface é recusada | Ela coincide com uma interface de saída do servidor. Use a interface de entrega correta. |
| OLT ou campos ópticos não aparecem | Confira a tecnologia selecionada e cadastre a OLT correspondente. |
| Novo acesso informa rede lotada | Revise o limite e a quantidade de acessos já liberados; não aumente sem validar capacidade real. |
| Liberação exige POP | Selecione o POP ou confira a configuração que delega a escolha à OS de instalação. |
| Cliente perdeu IP após mudar o servidor | Verifique se havia subprefixos livres no novo servidor e revise as associações IPv4/IPv6. |
| TR-069 permanece pendente ou com erro | Confira daemon, VLAN, pool CIDR e mensagem do setup; reaplique somente após corrigir a causa. |

![Cadastro de rede](/assets/screenshots/rede-infra/cadastrar-rede-form.png)
