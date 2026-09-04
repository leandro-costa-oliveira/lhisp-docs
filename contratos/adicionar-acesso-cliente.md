---
title: Adicionar um acesso ao cliente
published: true
editor: markdown
description: Configure a autenticação e o vínculo físico/lógico que entregam o serviço de internet ao cliente.
---

# Adicionar um acesso ao cliente

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.

O acesso é o vínculo técnico entre um serviço contratado e a infraestrutura que entrega conectividade ao cliente. Ele reúne autenticação PPPoE ou IP fixo, servidor/NAS, rede, endereçamento, velocidade, MAC, portas físicas e, conforme a tecnologia, ONU, OLT, CTO, PON, VLAN e Wi-Fi.

O plano define que o serviço admite acesso e fornece as velocidades; o serviço contratado representa a oferta vendida; o acesso materializa essa oferta na rede. Cada serviço contratado admite somente um acesso ativo no cadastro.

## Quando o serviço pode receber um acesso

O campo **Serviço** lista apenas itens do próprio contrato que:

- usam um plano marcado como serviço de acesso;
- estão **Ativos**, **Pendentes** ou **Bloqueados**;
- ainda não possuem acesso cadastrado.

Quando o plano exige aceite, o LHISP só libera o cadastro depois que existir um documento para o serviço e o aceite do cliente estiver validado. Um serviço cancelado ou suspenso não pode receber um novo acesso.

É necessário ter a permissão `contrato_add_acesso`. Alteração e exclusão usam permissões próprias.

## Como cadastrar

1. Abra **Contratos**, localize o contrato e acesse a aba **Acessos**.
2. Clique em **Adicionar Acesso**.
3. Selecione o **Serviço**. Confirme que é o item correto, pois ele determina o plano e a velocidade inicial.
4. Selecione o **Setor** para filtrar e depois a **Rede**.
5. Confira servidor, POP/CTO, porta e os campos técnicos exibidos para a tecnologia da rede.
6. Informe um MAC válido. Para PPPoE, marque **PPPoE** e revise usuário e senha; desmarcado, o acesso é tratado como IP fixo.
7. Selecione os prefixos IPv4 e IPv6 quando disponíveis.
8. Preencha ONU/PON/VLAN, Wi-Fi e portas de acesso ao equipamento quando aplicáveis.
9. Salve e confira o acesso na tabela, seu IP/prefixo, estado PPPoE e velocidade.

Salvar não é apenas registrar um formulário: o LHISP também configura o acesso no servidor de rede, reserva subprefixos e pode autorizar/provisionar a ONU.

## Rede, servidor e endereçamento

- **Setor** organiza e limita as redes apresentadas para a filial.
- Uma rede comum já pertence a um servidor; o backend rejeita outra combinação. Em rede **Global**, o servidor pode ser escolhido.
- A rede pode exigir POP/CTO. Essa exigência é adiada quando a empresa está configurada para o técnico definir o POP ao concluir a OS de instalação.
- Redes com limite de acessos recusam novas inclusões quando atingem sua capacidade.
- Ao selecionar um prefixo, o sistema associa ao acesso o próximo subprefixo livre no servidor. No cadastro inicial não há campo para escolher manualmente um IP específico; esse campo aparece na edição.
- **Porta WEB** e **Porta Router** são usadas pelos atalhos de acesso direto ou por redirecionamento ao equipamento do cliente. Os padrões do backend são 80 e 8080.

O MAC é convertido para maiúsculas e validado. Dependendo da configuração da empresa, do uso de RADIUS e do perfil administrativo, o preenchimento pode aceitar automação; mesmo assim, o valor enviado precisa respeitar o formato reconhecido pelo sistema.

## PPPoE e IP fixo

Com **PPPoE** marcado, usuário e senha são obrigatórios e sanitizados antes da gravação. A tela sugere um usuário automático e permite gerar senha aleatória. A unicidade do usuário é verificada globalmente ou no servidor da rede, conforme a configuração **Bloquear usuário duplicado global**.

Com **PPPoE** desmarcado, o registro é classificado como **IP fixo** e não usa as credenciais PPPoE. A coluna PPPoE mostra o estado da sessão; clicar no estado solicita a desconexão da sessão atual, não o bloqueio do serviço.

## Regras conforme a tecnologia

| Tecnologia da rede | Vínculos e efeitos principais |
|---|---|
| Wireless | Pode associar AP e POP; depois oferece consulta de sinal e informações wireless. |
| Fibra/GePON | Exige ONU e porta. Porta já ocupada só pode ser usada quando a associação permite subdivisão; se ela leva a um Pacswitch, também é obrigatório escolher o Pacswitch e uma porta livre. |
| GePON com autenticação | Pode usar ONU existente ou cadastrar uma descoberta pelo serial. Para ONU nova, exige CTO e porta PON; ao salvar, o sistema provisiona a ONU na OLT. |
| GPON/FiberHome | Exige serial e porta PON. Autoriza a ONU, grava slot/uplink/VLAN, modo **Bridge**, **Router** ou **Veip** e configura o acesso na OLT. Em equipamentos compatíveis, também aceita VLAN tag. |

Na configuração GPON, **Wireless** envia SSID e WPA para o provisionamento. A tela sugere SSID a partir da empresa/contrato e senha a partir do documento da pessoa; revise esses valores conforme a política de segurança antes de salvar.

## Ativação e relacionamento financeiro

Se o serviço estiver **Pendente**, a criação bem-sucedida do acesso o ativa automaticamente. O backend também atualiza o estado de remessa das contas a receber vinculadas ao serviço pendente. Portanto, incluir o acesso pode alterar a situação do contrato e a elegibilidade financeira das mensalidades; não use a operação apenas para testar credenciais.

Serviços já **Bloqueados** permanecem bloqueados. O cadastro do acesso não baixa dívidas nem ignora o bloqueio financeiro.

## Acompanhamento e operação

A linha do acesso combina dados do serviço e da rede:

- a cor acompanha a situação do serviço contratado: cancelado, suspenso, bloqueado ou ativo;
- **Up/Down** mostra a velocidade efetiva. Valor em vermelho indica redução aplicada; usuários autorizados podem alterar a velocidade ou remover a redução;
- o IP abre a ferramenta de ping; IPv6 aparece abaixo quando associado;
- **Bilhetagem**, **Uso de Banda** e **Registro de Alterações** ajudam a investigar autenticação, consumo e mudanças;
- conforme NAS e tecnologia, aparecem tráfego em tempo real, informações do BRAS, Wireless, EPON ou GPON e reinício da ONU;
- **Rotas** administra os CIDRs associados e o menu permite associar um gráfico de monitoramento.

O botão geral **Utilização de Banda** consolida o consumo do contrato. **Hotspot**, quando habilitado na empresa, é um cadastro separado e não substitui o acesso PPPoE/IP fixo.

## Alteração e exclusão

Editar um acesso pode reconfigurar servidor, endereçamento e equipamento. Use o **Registro de Alterações** para conferir os principais campos modificados.

Excluir é uma operação irreversível disponível somente com permissão e com a configuração empresarial correspondente. Ela:

- desassocia os prefixos IPv4 e IPv6;
- remove a configuração do acesso no Mikrotik;
- libera os IPs registrados para o contrato;
- remove o acesso local e registra a operação no histórico do contrato;
- em GePON autenticada, desprovisiona e exclui a ONU; em FiberHome, tenta remover a configuração da ONU na OLT.

Excluir o acesso não equivale a cancelar o serviço contratado.

## Falhas durante provisionamento

O cadastro executa validações, gravações e chamadas a equipamentos sem uma transação única envolvendo todo o fluxo. Em redes GPON/GePON, a ONU pode ter sido autorizada ou provisionada antes de uma falha posterior. Antes de repetir a operação, verifique a OLT, a lista de ONUs, o acesso no contrato e os prefixos reservados para evitar duplicidade ou configuração órfã.

Erros comuns:

| Mensagem/sintoma | Verificação |
|---|---|
| Serviço não aparece | Confirme tipo do plano, situação do serviço, aceite exigido e se já existe acesso. |
| Rede lotada | Confira o limite e os acessos já associados à rede. |
| Rede não pertence ao servidor | Use o servidor configurado na rede ou uma rede global adequada. |
| Usuário já cadastrado | Verifique a abrangência da regra de duplicidade antes de alterar a credencial. |
| MAC inválido | Informe endereço no formato aceito; não use valor zerado quando a configuração o proibir. |
| Porta já em uso | Revise ONU, Pacswitch, CTO e suas associações físicas. |
| Falha ao autorizar/configurar ONU | Confirme OLT, PON, serial, VLAN e o estado real do equipamento antes de tentar novamente. |

![Aba Acessos](/assets/screenshots/contratos/acessos-aba.png)
