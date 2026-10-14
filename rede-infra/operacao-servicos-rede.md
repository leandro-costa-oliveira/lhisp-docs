---
title: Operação dos serviços de rede
published: true
editor: markdown
description: Conferências de cadastro, aplicação de configurações, monitoramento e acesso de assinantes.
---

# Operação dos serviços de rede

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.

Salvar um cadastro e aplicar sua configuração são etapas diferentes. Este guia reúne verificações disponíveis ao provedor para acompanhar o resultado e encaminhar divergências ao suporte.

## Identificar o problema

| Sintoma | Conferência inicial |
|---|---|
| Configuração do equipamento continua pendente | Cadastro, **Status SSH**, mensagem apresentada e comandos pendentes. |
| Status de disponibilidade parece desatualizado | Endereço cadastrado, conectividade e horário da observação. |
| Gráfico sem dados recentes | Cadastro do gráfico, interface ou OID e acesso SNMP ao equipamento. |
| Alerta aparece, mas a notificação não chega | Regras de [alertas](/rede-infra/central-de-alertas) e integração de notificação utilizada. |
| Histórico de sessão ausente | Equipamento, acesso do assinante e período consultado. |
| Autenticação do assinante falha | Cadastro do acesso, serviço vinculado, equipamento e mensagem da tentativa. |
| CPE não conclui provisionamento | Cadastro, identificação da CPE, comunicação e parâmetros aceitos pelo equipamento. |

## Aplicação de configurações

Em [Servidores](/rede-infra/servidores), confira o equipamento, **Status SSH** e o caminho **Conectar por** antes de solicitar **Atualizar Servidor**. Selecione somente o escopo necessário e preserve um backup da configuração anterior.

Uma falha de comunicação pode ocorrer depois de o equipamento ter recebido parte da alteração. Antes de repetir a operação, compare o estado real com o resultado esperado. Comandos pendentes ou uma mensagem de conexão bem-sucedida, isoladamente, não comprovam que toda a configuração foi aceita.

Não use **Limpar Comandos da Fila** para resolver uma falha: essa opção descarta trabalho pendente e não desfaz o que já foi aplicado. A ferramenta [Enviar Comandos](/rede-infra/enviar-comandos) permite intervenções manuais e exige avaliação própria de impacto.

## Monitoramento e gráficos

O status de monitoramento não é um teste instantâneo. Um ping pontual pode apresentar resultado diferente do estado mantido pelo acompanhamento automático. Em equipamentos dependentes de um gateway, confira também o gateway e o caminho de comunicação antes de concluir que a falha está no equipamento final.

A opção **Enviar Alertas** controla a notificação; não substitui a coleta do estado. Confira os critérios em [Central de Alertas](/rede-infra/central-de-alertas).

Para gráficos, verifique a interface ou OID selecionada, os parâmetros SNMP do cadastro e o horário dos dados exibidos. Atualizar a imagem da página não comprova que houve nova coleta. Consulte [Monitor de Gráficos](/rede-infra/monitoramento-de-graficos).

## Sessões e autenticação

Autenticação bem-sucedida e registro de sessão são resultados distintos. Se o assinante navega, mas o histórico não aparece, registre o acesso, o equipamento e o período para análise, sem repetir alterações de credenciais como tentativa de correção.

Para falhas de autenticação, confira o vínculo do acesso à rede e ao serviço, a situação do cadastro e as restrições de MAC utilizadas. No equipamento, a identificação e os parâmetros RADIUS devem corresponder ao cadastro autorizado. Não compartilhe senhas ou segredos em capturas de diagnóstico.

Se houver reinício do concentrador, registre o horário: ele pode ajudar a explicar encerramentos simultâneos de sessões. Em configurações de envio de registros, use os parâmetros fornecidos para a instalação; não deduza valores a partir de outro provedor.

## Provisionamento TR-069

Confira separadamente a configuração da rede, a comunicação da CPE e a aceitação dos parâmetros. Um equipamento acessível não comprova que o provisionamento foi concluído.

Se a tela parecer desatualizada depois de uma tentativa, confira o horário e a mensagem antes de reaplicar. A CPE pode já ter recebido parte da configuração. Consulte [Compatibilidade TR-069](/rede-infra/tr069-outros-fabricantes) para os requisitos de identificação e as diferenças entre modelos.

## Encaminhar ao suporte

Registre empresa, identificação do equipamento ou acesso, horário com fuso, ação solicitada, resultado esperado e mensagem apresentada. Informe o que foi conferido e se houve alteração parcial ou impacto em outros equipamentos.

Oculte senhas, tokens, segredos RADIUS/SNMP e dados pessoais desnecessários antes de compartilhar capturas ou saídas de diagnóstico. Evite repetir mudanças com impacto nos clientes até definir a retomada com o responsável técnico.
