---
title: GePON OLT
published: true
editor: markdown
description: Cadastro e operação das OLTs EPON/GePON integradas ao LHISP
---

# GePON OLT

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.

A OLT GePON representa, no LHISP, o equipamento que concentra as ONUs de uma rede EPON/GePON. O cadastro não serve apenas como inventário: ele fornece ao sistema o endereço e as credenciais SNMP usados para descobrir ONUs, consultar seu estado e executar operações de provisionamento.

Esta integração pertence ao módulo legado e é diferente do cadastro de [GPON OLT](/rede-infra/gpon-olt), que usa outro modelo de dados e outros mecanismos de comunicação.

## Relações com outras funcionalidades

- **Ponto de presença (POP):** posiciona a OLT na estrutura física da rede e é usado para filtrar equipamentos e ONUs.
- **Redes:** uma rede do tipo **GePON** ou **GePON - Auth Mac** pode ser vinculada à OLT e à porta PON correspondente.
- **ONUs:** cada ONU cadastrada pertence a uma OLT e a um POP. A tela da OLT também mostra equipamentos descobertos que ainda não existem no cadastro do LHISP.
- **Acessos de clientes:** em redes GePON, o acesso registra a ONU e sua porta Ethernet; uma porta já ocupada não pode ser reutilizada, salvo quando a associação existente permite subassociação. O caminho pode ainda incluir um [Pacswitch](/rede-infra/gepon-pacswitch).
- **GePON - Auth Mac:** ao criar um acesso, o sistema exige uma ONU, pode criar seu registro a partir do MAC informado e solicita seu provisionamento na OLT. Ao excluir o acesso ou cancelar o serviço com remoção de acessos, tenta desprovisionar e excluir essa ONU.
- **Projetos de rede:** a OLT também pode ser associada à terminação de um cabo no mapa da infraestrutura.

Por essas relações, alterar a OLT de uma rede ou remover um equipamento em uso pode impedir o cadastro de acessos, a consulta de ONUs e o desprovisionamento durante um cancelamento.

## Modelos e suporte efetivo

A tela oferece os tipos **FIT FNL 1000**, **FIT FNL 2000**, **FIT FNL 5000**, **CIANET CTS2720**, **V-Solutions** e **Intelbras EPON**.

No código atual, as rotinas genéricas de comunicação estão implementadas para os cinco primeiros modelos. Embora **Intelbras EPON** apareça na lista, o adaptador usado por esta tela não possui tratamento para esse tipo e retorna `OLT NÃO SUPORTADA` ao tentar consultar ou operar o equipamento. Antes de selecionar esse modelo, confirme com a equipe responsável se existe uma integração específica disponível no ambiente.

## Cadastro e comunicação

Acesse **Rede/ Infra > GePON > GePON OLT** e use **Novo** ou **Editar**.

| Campo | Regra e efeito |
|---|---|
| **Ponto de Presença** | Obrigatório. Associa a OLT a um POP existente. |
| **Tipo** | Obrigatório. Seleciona o adaptador usado para interpretar as informações e executar comandos no equipamento. Um tipo incorreto não é apenas uma classificação errada: ele faz o sistema usar comandos e OIDs incompatíveis. |
| **Conectar por** | Servidor intermediário opcional, descrito na interface como redirecionamento para acesso remoto ao Pacswitch. O vínculo é armazenado, porém a fábrica de drivers da OLT não o utiliza nas chamadas SNMP atuais; não presuma que ele crie um túnel para a OLT. |
| **IP** | Obrigatório e validado como endereço IP. É o destino das consultas e operações. |
| **Comunidade SNMP** | Credencial usada pelo adaptador do fabricante. Para FIT FNL 5000, quando o campo fica vazio, o código usa `SNMPWRITE`. |
| **Porta SNMP** | Usa `161` quando não informada. FIT FNL 5000, Cianet e V-Solutions recebem explicitamente IP e porta; os adaptadores FIT FNL 1000/2000 usam apenas o IP no código atual. |
| **Timeout SNMP (s)** | Valor salvo no cadastro. Atualmente é repassado explicitamente ao adaptador V-Solutions; os demais adaptadores não o recebem nessa integração. |
| **Descrição** | Obrigatória. Identifica a OLT nas buscas e nos vínculos de rede. |

Salvar o formulário apenas grava ou altera o cadastro. A validação real de conectividade acontece quando a aba **Informações / ONUs** consulta o equipamento.

## Informações e descoberta de ONUs

Ao abrir **Informações / ONUs**, o LHISP consulta a OLT e apresenta, quando fornecidos pelo adaptador:

- MAC e identificação do fabricante;
- versão de firmware e quantidade de portas PON;
- estado da comunicação com a OLT;
- ONUs descobertas, com placa, porta PON, LLID, MAC, descrição e estado.

A listagem combina duas fontes:

1. ONUs retornadas pela OLT. Quando o MAC ainda não existe no LHISP, a linha aparece como **NÃO CADASTRADO [MAC]** e oferece a ação de cadastro.
2. ONUs cadastradas no LHISP que não foram encontradas naquela consulta. Elas permanecem visíveis como offline, com valores indisponíveis preenchidos por marcadores.

Esse comportamento ajuda a distinguir uma ONU nova de uma ONU conhecida que deixou de responder. A atualização é feita ao carregar a aba ou acionar **Atualizar**; apesar de existir código auxiliar para contagem, esta tela não agenda uma atualização periódica automática no fluxo atual.

## Cadastro e configuração de ONU

É possível cadastrar uma ONU a partir do botão geral ou diretamente de uma linha descoberta. O MAC precisa ser único dentro da mesma OLT. O registro mantém, entre outros dados, POP, OLT, porta PON, número de portas Ethernet, modo bridge, VLAN e limites de upload/download.

Ao cadastrar uma ONU, o LHISP grava o registro e, dentro da mesma transação, chama a aplicação de configurações no equipamento. Conforme o suporte do adaptador, essa etapa pode definir:

- modo bridge e limite de entradas MAC;
- VLAN;
- descrição;
- perfil de velocidade/SLA;
- persistência da configuração na OLT.

Se a aplicação retornar erro, o cadastro informa a falha. Ao editar uma ONU, os dados são gravados antes da tentativa de configuração; portanto, diante de erro, confira tanto o estado salvo no LHISP quanto a configuração efetiva do equipamento.

## Operações que afetam o equipamento

- **Reiniciar ONU:** envia imediatamente o comando de reinicialização para o MAC selecionado e pode interromper o acesso do cliente.
- **Apagar ONU:** remove o cadastro do LHISP e tenta desprovisionar o MAC na OLT. Falhas no desprovisionamento são registradas no log, mas não impedem necessariamente a exclusão do cadastro; confirme o estado no equipamento.
- As rotinas de **reiniciar todas as ONUs**, **aplicar configurações em todas as ONUs**, **remover ONU da OLT** e **aplicar configurações individualmente** existem no backend, mas seus controles estão ocultos na interface atual. Não dependa delas como fluxo operacional disponível.

## Exclusão da OLT

A exclusão é física e não executa uma limpeza automática das ONUs, redes, Pacswitches ou terminações de cabo relacionados. O banco possui vínculos que normalmente impedem a remoção enquanto houver dependências. Antes de apagar:

1. identifique redes e acessos que usam a OLT;
2. verifique ONUs e Pacswitches associados;
3. confira associações no projeto de rede;
4. planeje a migração dos clientes e só então remova os vínculos.

Excluir apenas o cadastro também não desprovisiona em massa as ONUs no equipamento.

## Diagnóstico de problemas

| Sintoma | Verificação recomendada |
|---|---|
| **Erro de comunicação na aba de informações** | Teste alcance ao IP a partir do servidor que executa o PHP, porta SNMP, comunidade, ACL do equipamento e modelo selecionado. |
| **OLT NÃO SUPORTADA** | O tipo escolhido não possui adaptador na fábrica atual; isso ocorre, inclusive, com a opção Intelbras EPON desta tela. |
| **ONU aparece como não cadastrada** | A OLT descobriu o MAC, mas ele ainda não está registrado nesta OLT no LHISP. Valide porta PON e identificação antes de cadastrar. |
| **ONU cadastrada aparece offline** | O MAC existe no banco, mas não veio na descoberta. Confirme energia, fibra, porta PON e se o registro pertence à OLT correta. |
| **Falha ao salvar a OLT** | Confirme POP, tipo, descrição e IP. A porta vazia é convertida para 161; um servidor intermediário informado precisa existir. |
| **Não é possível apagar a OLT** | Procure dependências em redes, ONUs, Pacswitches e infraestrutura de cabos antes de tentar novamente. |

## Screenshot

![GePON OLT no ambiente de demonstração](/assets/screenshots/rede-infra/gepon-olt.png)
