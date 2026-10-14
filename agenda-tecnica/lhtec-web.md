---
title: LHTEC web — operação e baixa offline
description: Login, consulta, execução, materiais, anexos e acompanhamento de baixas pendentes no aplicativo web do técnico.
published: true
editor: markdown
---

# LHTEC web — operação e baixa offline

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.

O LHTEC web é a aplicação técnica publicada em `/lhtec` na instalação do provedor. O [aplicativo Expo](/agenda-tecnica/app-tecnico) possui outro fluxo; suas regras offline não são equivalentes.

## Entrar e localizar a OS

1. Abra o endereço do provedor terminado em `/lhtec` e informe usuário e senha do aplicativo técnico.
2. Na lista, escolha **Até hoje**, **Somente hoje** ou **Todos**, além do tipo de OS.
3. Abra o cartão para conferir cliente, endereço, agendamento, acesso e observações.
4. Use o mapa para localizar o atendimento e **Iniciar** ao começar a execução.

No login PHP utilizado pela aplicação, o usuário é normalizado como CPF e a senha é a credencial de aplicativo técnico do cadastro da pessoa. Essa credencial é diferente da senha do painel administrativo.

Os filtros de data/tipo são aplicados na lista recebida. **Até hoje** inclui ordens sem agendamento; **Somente hoje** exige agendamento no dia. Se a empresa habilitar a exibição de somente uma OS por vez, o aplicativo mostra a primeira do recorte e desabilita o filtro de tipo. Isso não significa que exista apenas uma OS atribuída ao técnico.

## Baixar a ordem

1. Abra **Baixar** na OS correta.
2. Permita a localização e confira latitude/longitude. Sem coordenadas a baixa é recusada.
3. Descreva o serviço realizado.
4. Informe POP quando exigido. Na tela atual, a obrigatoriedade combina OS de instalação, exigência do acesso e preferência da empresa; outros tipos podem exibir o campo sem torná-lo obrigatório.
5. Selecione materiais utilizados e recolhidos com suas quantidades.
6. Para material utilizado com unidades patrimoniais disponíveis, selecione a quantidade exata de patrimônios correspondente à quantidade do produto.
7. Adicione os anexos, classifique-os pelos tipos exigidos e confira as validações apresentadas.
8. Revise a confirmação e envie. Aguarde o resultado ou acompanhe a pendência local.

| Tipo reconhecido pela tela | Validação adicional de anexos |
|---|---|
| Instalação | Pelo menos duas fotos, para sinal e instalação/equipamentos. |
| Viabilidade | Selecione com/sem viabilidade; sem viabilidade exige ao menos um anexo. |
| Demais tipos | O validador padrão exige ao menos um anexo. |

As preferências da empresa podem exigir **tipos específicos de anexo** além dessas quantidades. A configuração visual de reparo/mudança de endereço se assemelha à de instalação, mas isso não significa que o validador de duas fotos seja aplicado a esses nomes. Confira a mensagem da própria OS; o backend ainda valida os requisitos operacionais e de estoque.

O material utilizado é baseado no estoque do técnico; o material recolhido considera as locações do serviço. Uma seleção local não reserva saldo nem comprova devolução antes da confirmação pelo servidor.

## Trabalhar sem conexão

Abra e carregue as ordens, estoque, patrimônios e configurações **antes** de perder a conexão. O aplicativo persiste consultas e mutações no armazenamento do navegador, com janela de cache de 24 horas; dados nunca carregados não ficam disponíveis apenas por instalar a PWA.

Ao confirmar uma baixa sem conexão, o aplicativo mostra que a OS entrou na fila. **Pendente Baixa** indica envio pausado localmente, não conclusão no servidor. Ao recuperar conexão, a aplicação retoma as mutações pausadas; após reabrir, restaura o cache e tenta retomá-las. A baixa tem função de retomada registrada para esse caso.

**Erro na Baixa** indica que a tentativa falhou. Abra a OS, leia o erro e confira a situação no painel antes de repetir. O servidor pode ter recebido uma operação mesmo que a resposta tenha se perdido; não há garantia geral de execução única fornecida pela fila do navegador.

Enquanto a baixa está pendente, outras ações dessa OS ficam bloqueadas na interface. A integração Mibo exige conexão. Não limpe os dados do navegador, reinstale a PWA ou troque de perfil com baixas pendentes: o armazenamento local participa da recuperação. **Sair** remove a autenticação, mas não limpa explicitamente todo o cache e as mutações; use um dispositivo/perfil próprio do técnico e confira pendências antes de trocar de usuário.

## Observações, dispensa e Mibo

- **Adicionar observação** exige texto preenchido; anexos complementam o registro sem concluir a OS.
- **Dispensar** exige motivo com mais de 25 caracteres e ao menos um anexo na tela atual. Remove técnico e agendamento da OS, registra quem dispensou e adiciona a observação/anexos; não substitui a conclusão da OS nem cancela o serviço contratado.
- A ação Mibo aparece conforme a integração e os produtos da OS. Não pode ser usada offline nem enquanto há baixa pendente.

## Diagnóstico

| Sintoma | Conferência |
|---|---|
| Login recusado | CPF e senha do aplicativo técnico, cadastro da pessoa e domínio do provedor. |
| Poucas ordens na lista | Filtro de dia/tipo e preferência de uma OS por vez. |
| Falta localização | Permissão do navegador/dispositivo e nova obtenção das coordenadas. |
| Anexo obrigatório ausente | Quantidade mínima e tipos requeridos pela empresa para a OS. |
| Patrimônio/quantidade recusados | Posse atual do técnico, unidade selecionada e saldo efetivo no servidor. |
| Pendente Baixa | Mantenha os dados locais e retome com conexão; depois confirme a situação no servidor. |
| Erro na Baixa | Leia o erro persistido e confira a OS antes de reenviar. |

Para o fluxo administrativo e os efeitos de conclusão, consulte [Agenda técnica](/agenda-tecnica/agenda-tecnica). Não foram geradas capturas novas nem executado um cenário autenticado nesta revisão.
