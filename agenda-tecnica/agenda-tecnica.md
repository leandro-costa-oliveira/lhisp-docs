---
title: Agenda Técnica
published: true
editor: markdown
description: Organize atendimentos, ordens de serviço, filas, técnicos, materiais e rotas de campo.
---

# Agenda Técnica

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.

A Agenda Técnica coordena o caminho entre uma solicitação do cliente e sua execução pela equipe. Ela reúne atendimentos, ordens de serviço e ordens internas, permitindo distribuir a demanda, registrar o histórico, agendar técnicos e concluir o trabalho com seus efeitos em contrato, rede, estoque e financeiro.

O item atual do menu abre a interface legada em `/lgc/agenda_tecnica`. Partes do fluxo — como fila e otimização de rotas — já usam páginas do SPA. Os detalhes de atendimento e OS continuam compartilhando rotinas legadas.

## Atendimento e ordem de serviço

Um **atendimento** é o protocolo associado ao contrato. Ele registra canal e subcanal de origem, grupo, atendente, diagnóstico e observações. Pode estar aberto, com OS agendada, em atendimento, em pós-venda, concluído ou cancelado.

Uma **ordem de serviço (OS)** é uma atividade executável ligada ao atendimento e a um serviço contratado. Ela possui tipo, prioridade, técnico, data/período, resultado e materiais. Reparos, instalações, retiradas, cobranças, viabilidade, documentos e mudanças de endereço ou tecnologia usam o mesmo núcleo, mas podem produzir efeitos diferentes ao serem concluídos.

A **OS interna** usa o contrato da própria empresa para demandas que não pertencem a um cliente. Sua consulta separada evita misturar manutenção interna com serviços externos.

## Consultar e distribuir a demanda

Escolha **Atendimentos**, **Ordens de Serviço** ou **OS interna** e combine os filtros de filial, grupo, período, categoria do contrato e usuário que abriu o protocolo. Para atendimentos, filtre também situação e atendente. Para OS, estão disponíveis data de abertura/agendamento/conclusão/dispensa, situação, tipo, período, prioridade, técnico e estado do agendamento.

O filtro **Dispensadas** muda a referência de data para a dispensa. O tipo de observação controla se a grade mostra a primeira, a última ou todas as ocorrências. As cores das linhas identificam prioridade alta, normal e baixa.

A visibilidade das OS respeita as filiais do usuário não administrador. A lista de técnicos também é formada pelos funcionários habilitados para atender as filiais selecionadas.

## Fila de atendimento

A fila distribui protocolos ainda abertos. Ao solicitar o próximo atendimento, o backend:

1. considera somente as filiais atendidas pelo usuário;
2. restringe ao grupo de atendimento do usuário, quando definido;
3. seleciona o protocolo sem atendente mais antigo;
4. atribui o usuário e muda a situação para **Em atendimento**.

Sem vínculo com alguma filial, o usuário não pode iniciar uma tratativa. **Sair da fila** devolve todos os atendimentos em tratamento pelo usuário para a situação aberta e remove sua atribuição. Na agenda, **Liberar atendimentos** executa o mesmo tipo de devolução para os protocolos exibidos como em atendimento.

## Criar e agendar uma OS

A OS deve pertencer ao mesmo contrato e serviço contratado do atendimento. Ao criá-la, informe o tipo adequado; ele determina validações e automações posteriores.

O agendamento associa técnico, data e período. Não é permitido agendar em data anterior à atual. Quando a empresa proíbe sobreposição, o sistema recusa outro compromisso do mesmo técnico no horário já ocupado. O agendamento em lote aplica os mesmos dados às OS selecionadas dentro de uma transação.

Cancelar o agendamento não apaga a OS: apenas a devolve à condição de aguardando nova programação. Use a remoção somente para uma ordem criada indevidamente; ela exige `contrato_del_os`, exclui a OS logicamente e reabre o atendimento relacionado.

## Concluir atendimento ou OS

São ações diferentes:

- **Concluir atendimento** exige `contrato_fechar_atendimento`, registra a descrição e também encerra como realizadas todas as OS ainda abertas daquele protocolo.
- **Concluir OS** registra data, horas, descrição e resultado realizado/não realizado. Em baixa coletiva, cada OS é processada e confirmada separadamente; uma falha posterior não desfaz as anteriores.

Por isso, não conclua o atendimento para apenas retirá-lo da fila: essa ação pode encerrar trabalho de campo pendente. Libere ou transfira o protocolo quando a tratativa continuará com outra pessoa.

Na baixa pelo aplicativo do técnico, a OS precisa ter sido iniciada. Salvo a viabilidade concluída com sucesso, o aplicativo exige ao menos uma foto e localização GPS. A empresa também pode configurar tipos específicos de anexo obrigatórios. Operadores sem administração de filial não podem dar baixa retroativa.

## Materiais e patrimônio

Os produtos usados na OS devem estar no estoque do técnico e possuir saldo suficiente. Na conclusão bem-sucedida:

- a quantidade sai do estoque individual do técnico;
- o material é registrado como locado no serviço/contrato;
- produtos com controle patrimonial exigem exatamente os patrimônios correspondentes à quantidade;
- cada patrimônio precisa pertencer ao produto, estar com o técnico e não estar previamente locado, vendido ou vinculado;
- o patrimônio é movido para a locação e para o contrato.

Materiais retirados seguem o fluxo inverso definido na baixa. Produtos Intelbras Mibo têm tratamento específico e devem ser associados antes da conclusão; a alocação do equipamento pode publicar sincronização para a integração.

## Efeitos por tipo e resultado

A conclusão não altera apenas a situação da OS. O backend possui ramificações específicas, entre elas:

- **Viabilidade:** resultado positivo ou negativo direciona a continuidade da instalação e exige justificativa quando não há viabilidade;
- **Documentos:** diferencia assinatura realizada ou não realizada;
- **Retirada:** pode remover ONU da OLT FiberHome, encaminhar mudança de endereço ou abrir nova OS de negativação/retirada conforme adimplência e materiais locados;
- **Instalação e ativação B2B:** avançam etapas próprias de infraestrutura e provisionamento;
- **Serviços diversos ou OS improdutiva:** podem gerar conta a receber com vencimento em três dias, conforme valores e conta bancária configurados pela empresa.

Leia a descrição e confira tipo, serviço, técnico, resultado e materiais antes da baixa. Escolhas incorretas podem afetar rede, estoque, endereço do contrato e cobrança.

## Rotas e integrações

Quando Cobli ou Traccar estiver configurado, a agenda exibe **Otimização de rotas**. A tela trabalha com OS abertas e agendadas para o técnico e período escolhidos. Ela usa a posição do veículo quando disponível, geolocaliza contratos sem coordenadas pelo Google Maps e exige pelo menos duas OS localizadas para calcular a rota.

A ordem sugerida pode ser rearranjada manualmente e é persistida de forma transacional. O atalho individual da Cobli aparece apenas quando a OS possui técnico e dispositivo associado.

### Consulta e PDF por integração

A [API de Parceiros](/sistema/api-parceiros) pode consultar as ordens de serviço de um cliente pelo identificador da pessoa ou pelo CPF/CNPJ. A consulta aceita filtros de situação, período e intervalo da data agendada, retorna 25 registros por página por padrão e apresenta primeiro os agendamentos mais recentes.

A integração também pode gerar uma URL temporária para o PDF de uma OS. O documento usa o mesmo conteúdo cadastral e operacional da impressão do painel e é limitado à empresa e à ordem informadas no token. O link é válido por 12 horas e abre sem uma sessão do painel porque a própria URL contém a credencial assinada. Trate-o como informação confidencial: não publique, não encaminhe fora do destinatário e gere outro link após a expiração.

Consultar ou imprimir o PDF não agenda, inicia, conclui nem altera a OS. São operações de leitura; qualquer mudança operacional deve ocorrer pelas ações próprias da agenda ou pela rota de integração correspondente.

## Operação segura

1. Filtre a filial, situação e período corretos.
2. Abra os detalhes e confira contrato, serviço e histórico.
3. Para trabalho de campo, crie a OS com tipo e prioridade coerentes.
4. Agende somente após confirmar técnico e disponibilidade.
5. Na execução, registre diagnóstico, horas, resultado, fotos e localização.
6. Confira materiais e patrimônios antes da baixa.
7. Valide no contrato, estoque e financeiro os efeitos esperados.

| Problema | Verificação |
|---|---|
| Usuário não recebe atendimento da fila | Associe filiais atendidas e confira o grupo de atendimento do usuário. |
| OS não pode ser agendada | A data não pode ser retroativa; valide período, técnico e conflito de horário. |
| Baixa recusa material | O produto ou patrimônio precisa estar em posse do técnico e com saldo disponível. |
| Aplicativo não conclui a OS | Inicie a OS e forneça fotos, GPS e tipos de anexo obrigatórios. |
| Cobrança surgiu após a baixa | Verifique as configurações de OS improdutiva ou serviços diversos e o resultado informado. |
| Rota não é calculada | Selecione técnico com veículo e ao menos duas OS com coordenadas ou endereço geolocalizável. |
| Link do PDF não abre | Confirme se a URL está completa, se ainda está dentro das 12 horas e se a OS pertence à mesma empresa que emitiu o token. |

![Agenda Técnica](/assets/screenshots/agenda-tecnica/agenda-tecnica.png)
