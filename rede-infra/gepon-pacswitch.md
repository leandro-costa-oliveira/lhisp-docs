---
title: GePON PACSWITCH
published: true
editor: markdown
description: Topologia, ocupação de portas e monitoramento dos Pacswitches GePON
---

# GePON PACSWITCH

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.

O Pacswitch representa um switch de acesso instalado depois de uma ONU GePON. Ele expande a quantidade de portas Ethernet disponíveis para clientes e permite registrar, no LHISP, o caminho físico entre OLT, ONU, eventuais switches em cascata e cada acesso.

O cadastro é usado tanto pela equipe de rede quanto pelo fluxo de contratos: ao instalar um cliente em uma porta do Pacswitch, o acesso guarda o equipamento e a porta escolhidos. Isso permite impedir a reutilização de uma porta ocupada e mostrar a qual contrato ela pertence.

## Como a topologia é formada

Todo Pacswitch precisa chegar a uma [OLT GePON](/rede-infra/gepon-olt) por meio de uma ONU. Há dois modos de uplink:

- **GePON ONU:** o switch está ligado diretamente a uma porta Ethernet da ONU.
- **GePON PACSWITCH:** o switch está ligado a uma porta de outro Pacswitch. Mesmo nesse caso, o registro também herda a ONU raiz e a porta dessa ONU, preservando o caminho de origem.

Ao escolher o equipamento de origem, o sistema determina automaticamente a OLT correspondente. O POP do Pacswitch é informado separadamente e indica onde o equipamento deve aparecer na estrutura física.

No acesso de um cliente em rede do tipo **GePON**, primeiro é escolhida a ONU e sua porta. Se essa porta leva a um Pacswitch, o formulário exige também o switch e sua porta de cliente. O acesso passa a ocupar essa porta até ser alterado ou removido.

## Cadastro

Acesse **Rede/ Infra > GePON > GePON PACSWITCH**, clique em **Novo** e informe:

| Campo | Regra e efeito |
|---|---|
| **Ponto de Presença** | Obrigatório. Localização lógica/física do switch. Não é inferida automaticamente a partir do POP da ONU. |
| **Tipo** | Define a quantidade de portas: **PACSWITCH FIT 7P** cria 7 portas lógicas; **PACSWITCH FIT 14P**, 14. |
| **Cascateamento** | Obrigatório. Escolhe se o uplink vem diretamente de uma ONU ou de outro Pacswitch. |
| **GePON ONU / Porta** | No vínculo direto, identifica a ONU de origem e a porta Ethernet usada como uplink. A porta não pode estar ocupada. |
| **GePON PACSWITCH / Porta** | No vínculo em cascata, identifica o switch anterior e a porta usada como uplink. |
| **IP** | Obrigatório e normalizado pelo backend. É usado no acesso SNMP e na abertura da interface web. |
| **Comunidade SNMP** | Credencial para consultar o estado das portas. |
| **Descrição** | Obrigatória. Identificação operacional nas buscas e seleções de acesso. |
| **MAC** | Opcional no backend, mas a tela limita a entrada ao formato de seis pares hexadecimais. |

O cadastro exige a permissão `pacswitch_add`; a alteração exige `pacswitch_edit`.

## Regras de portas e cascateamento

- Uma porta da ONU já associada a um acesso ou a um Pacswitch é rejeitada na criação de um novo switch direto.
- Uma porta do Pacswitch já associada a um acesso é rejeitada no cascateamento e no cadastro de outro acesso.
- Ao editar e manter exatamente a mesma origem, a associação atual é aceita.
- O sistema não impede explicitamente que um Pacswitch seja selecionado como origem dele próprio nem percorre a árvore para detectar ciclos. Revise o desenho antes de salvar um cascateamento.
- A consulta de ocupação das portas do Pacswitch considera os **acessos de clientes**. No código atual, Pacswitches descendentes não entram nessa mesma lista de ocupação; portanto, em topologias em cascata, confirme manualmente se a porta de uplink já está sendo usada por outro switch.

Essa última limitação significa que a cor **LIVRE** na tela não é garantia suficiente para portas usadas apenas por outro Pacswitch em cascata.

## Efeito de alterar a origem

Quando a ONU raiz ou sua porta é alterada, o backend propaga o novo par ONU/porta para acessos e registros de Pacswitch que ainda apontem para o par anterior. Essa atualização pode atingir todo o ramo que compartilha aquela origem, não apenas o equipamento aberto.

Antes de mover um Pacswitch:

1. identifique os acessos e switches abaixo dele;
2. confirme a nova ONU e a capacidade da porta;
3. realize a alteração em janela apropriada;
4. confira os vínculos dos clientes e o estado das portas depois de salvar.

A operação altera apenas os registros do LHISP; não há uma rotina nesta tela que reconfigure fisicamente VLANs ou uplinks do switch.

## Estado das portas

Ao consultar um registro, a tela tenta acessar o equipamento por SNMP e mostra cada porta com:

- estado retornado pelo switch e código correspondente;
- indicação de porta livre;
- identificação do acesso associado, incluindo contrato e MAC.

O botão **Atualizar** refaz a leitura. Se uma consulta falha, o erro aparece na porta e o restante daquela rodada deixa de tentar o mesmo adaptador, evitando repetir a espera em todas as portas.

### Suporte dos modelos

Embora a tela permita cadastrar os modelos de 7 e 14 portas, o adaptador SNMP atual é criado somente para **PACSWITCH FIT 7P**. Um registro **FIT 14P** é aceito e mantém 14 portas lógicas, mas a consulta de estado retorna `PacSwitch não suportado` até que exista um adaptador correspondente.

## Acesso web e relay

O botão de acesso web abre a interface HTTP do Pacswitch:

- se a OLT de origem não possui servidor em **Conectar por**, o navegador aponta diretamente para `IP do Pacswitch:80`;
- se possui, o LHISP acessa esse servidor Mikrotik por SSH, remove uma regra antiga com o mesmo identificador e cria um `dst-nat` na porta `33000 + ID do Pacswitch`, encaminhando para a porta 80 do equipamento.

O navegador abre esse destino dentro de um iframe HTTP. Políticas de conteúdo misto do navegador, bloqueio de iframe ou indisponibilidade da rota podem impedir a exibição mesmo quando o equipamento responde.

O código da página solicita o fechamento do relay ao sair, mas não há uma ação `FecharRelayWeb` implementada para Pacswitch no backend atual. A configuração padrão dos servidores cria um agendador Mikrotik que remove regras com comentário `lhrelay` a cada seis horas; confirme esse agendador e remova manualmente regras residuais quando necessário.

## Exclusão

A exclusão remove fisicamente o registro e não altera a configuração do equipamento. Como acessos e outros Pacswitches possuem chaves estrangeiras para ele, dependências normalmente impedem a operação.

Antes de apagar, migre ou remova:

- acessos associados às portas;
- Pacswitches que o utilizem como origem;
- o vínculo físico com a ONU.

Não use a exclusão para representar apenas uma indisponibilidade temporária.

## Diagnóstico de problemas

| Sintoma | Verificação recomendada |
|---|---|
| **Porta da ONU já está em uso** | Consulte as associações da ONU; ela pode atender diretamente um acesso ou ser a origem de outro Pacswitch. |
| **Porta do Pacswitch aparece ocupada** | A tela informa o contrato e o MAC do acesso associado. Migre o acesso antes de reutilizá-la. |
| **Porta parece livre, mas recebe outro switch** | A lista de ocupação não agrega Pacswitches descendentes. Revise manualmente os cascateamentos. |
| **PacSwitch não suportado** | O monitoramento SNMP atual suporta apenas o tipo FIT 7P, embora o FIT 14P possa ser cadastrado. |
| **Estado de todas as portas falha** | Verifique IP, comunidade SNMP, alcance de rede e ACL do equipamento. |
| **Acesso web não abre** | Confirme a porta 80, o servidor vinculado à OLT, acesso SSH ao Mikrotik, regra `lhrelay-ID`, bloqueio de conteúdo HTTP/iframe e rota até o Pacswitch. |
| **Não é possível excluir** | Verifique acessos e Pacswitches descendentes que ainda referenciam o registro. |

## Screenshot

![GePON Pacswitch no ambiente de demonstração](/assets/screenshots/rede-infra/gepon-pacswitch.png)
