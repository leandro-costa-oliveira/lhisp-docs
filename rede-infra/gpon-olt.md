---
title: GPON OLT
published: true
editor: markdown
description: Cadastro, provisionamento e operação de OLTs GPON integradas ao LHISP
---

# GPON OLT

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.

A GPON OLT é o equipamento que concentra as ONUs de uma rede óptica GPON. No LHISP, seu cadastro define qual integração deve interpretar o chassi e executar comandos de criação de rede, autorização de ONU e configuração de acesso.

Esta funcionalidade não é equivalente à [GePON OLT](/rede-infra/gepon-olt). GPON possui cadastro próprio de OLTs, portas e ONUs, usa número de série para identificar a ONU e executa rotinas específicas por fabricante e modelo.

## Papel no funcionamento do sistema

A OLT se relaciona diretamente com:

- **Redes GPON:** a rede referencia OLT, porta PON, uplink e VLAN. Ao cadastrar ou alterar uma rede desse tipo, o LHISP também chama o configurador para criar ou atualizar os elementos correspondentes na OLT.
- **Acessos de clientes:** o acesso registra OLT, slot, PON, VLAN, número de série e modo da ONU. Ao criar um acesso, o LHISP autoriza a ONU e depois aplica a configuração do cliente.
- **Alterações e cancelamentos:** a troca da ONU pode desautorizar a anterior e autorizar a nova. A remoção do acesso tenta retirar sua configuração na OLT; alguns fluxos de cancelamento também desautorizam e removem o registro local da ONU.
- **Agenda técnica:** operações de liberação de acesso podem obter o configurador da OLT para concluir o provisionamento.
- **Monitoramento:** o banco aceita ocorrências de disponibilidade ligadas a uma GPON OLT, embora o daemon de monitoramento atual trate ativamente os servidores e apenas modele esse vínculo para OLT.

Uma inconsistência neste cadastro pode afetar vários clientes ao mesmo tempo. Mudanças de fabricante, modelo, IP ou credenciais devem ser tratadas como alteração de infraestrutura.

## Fabricantes, modelos e transporte

O fabricante e a versão selecionam a classe de integração; não são campos meramente informativos.

| Fabricante | Modelos/versões expostos | Caminho atual |
|---|---|---|
| **Fiberhome** | AN5000 RP0700, variações AN5000, AN6000 e AN5000 RP1200 | Configuradores PHP por versão, via Telnet. |
| **Huawei** | Sem seletor de versão específico | Configurador PHP via Telnet para várias operações; parte das operações também pode ser encaminhada ao daemon de OLT. |
| **Intelbras** | 8820i e G8/G08 | Configuradores PHP distintos, via SSH. |
| **ZTE** | C600/C610/C620/C650 e C300/C320 | Configuradores PHP distintos, via SSH. |
| **Datacom** | Sem seletor de versão específico | Configurador PHP via SSH. |
| **Nokia** | Sem seletor de versão específico | Integração por EventBus com o `lhisp-daemon-olt`, que atualmente implementa Nokia por conexão Telnet. |
| **VSOL** | V1600 com firmware V1.5 ou V2.3 | Configuradores PHP distintos, via SSH. |

Há identificadores legados de fabricante para Intelbras G8, ZTE C300 e VSOL V2.3. O código continua aceitando esses registros e os converte para o configurador equivalente. Em novos cadastros, use a marca consolidada e escolha o modelo em **Versão**.

O `lhisp-daemon-olt` possui configuradores somente para Huawei e Nokia. Para marcas encaminhadas ao EventBus sem implementação no daemon, a operação é registrada como fabricante não implementado. As demais marcas conhecidas são atendidas diretamente pelos configuradores PHP.

## Cadastro e credenciais

Acesse **Rede/ Infra > GPON OLT** e preencha:

| Campo | Regra e efeito |
|---|---|
| **Fabricante** | Obrigatório. Define o configurador. Selecionar a marca incorreta envia comandos incompatíveis ao equipamento. |
| **Versão** | Define a família de CLI para Fiberhome, Intelbras, ZTE e VSOL. Quando não informada, o backend grava `0` e a fábrica aplica o fallback previsto para a marca. |
| **Gravar Configurações?** | Controla a persistência somente onde o configurador consulta essa opção. No código atual, Fiberhome condiciona o comando `save` ao campo; Huawei, ZTE e Datacom persistem por suas próprias rotinas sem essa condição, enquanto Intelbras e VSOL possuem método de gravação vazio. |
| **Descrição** | Obrigatória. Nome usado nas buscas e seleções de rede. |
| **IP** | Obrigatório. Endereço de gerenciamento; o backend não faz validação específica de formato nessa ação. |
| **Porta** | Porta da sessão de gerência. Se ficar vazia, o backend usa 23. Ao mudar o fabricante na tela, ela sugere 23 para Telnet ou 22 para SSH. |
| **Conexão** | Campo apenas informativo, calculado pelo fabricante. |
| **Usuário, Senha e Senha Enable** | Credenciais da CLI. Senhas vazias durante uma edição preservam os valores já gravados; preencher substitui o valor. A senha enable é usada apenas pelos configuradores que precisam de modo privilegiado. |

O cadastro exige `gpon_add`, a alteração `gpon_edit` e a exclusão `gpon_del`.

### Efeito ao salvar

Depois de gravar o registro, o LHISP chama `afterSave` no configurador:

- Huawei cria ou ajusta perfis DBA, service profile e OMCI;
- Datacom cria perfis GPON e persiste a configuração;
- Nokia recebe um evento de cadastro/alteração, mas o daemon atual não trata esses dois tópicos como uma ação de configuração;
- Fiberhome, Intelbras, ZTE e VSOL não executam ação adicional nesse gancho atual.

Portanto, **Salvar** pode se conectar imediatamente ao equipamento e alterar sua configuração, dependendo da marca.

## Abas operacionais

As abas são montadas conforme o fabricante. A disponibilidade e o formato dos dados dependem do configurador e da resposta da CLI.

### Chassi

Consulta slots, placas e portas PON/uplink. Algumas telas permitem confirmar uma placa detectada, ação que envia comando ao equipamento. A ação genérica **Deletar placa** chama um método inexistente no DAO base atual; não a considere funcional até correção e não use essa tentativa como confirmação de que uma placa foi removida.

### ONUs autorizadas

Lê as ONUs já autorizadas na OLT, com filtros por slot, PON, modelo e número de série quando suportados. Fora do ambiente de desenvolvimento, o resultado geral da OLT fica em cache por até dois minutos; uma alteração recente pode demorar a aparecer.

### ONUs não autorizadas

Mostra ONUs descobertas que ainda aguardam autorização. O resultado fica em cache por aproximadamente 30 segundos fora do desenvolvimento. A rotina impede duas consultas simultâneas com a mesma chave durante o processamento.

Autorizar ou desautorizar por essas abas altera diretamente a OLT. O fluxo genérico dessas ações apresenta inconsistências no código atual, inclusive na remoção do registro local após desautorizar: ele usa o ID da OLT onde seria necessário identificar a ONU. Use preferencialmente o fluxo de acesso do contrato, que mantém rede, ONU e cliente relacionados, e valide o banco e o equipamento após qualquer ação manual.

### Executar comandos

Envia texto livre para a CLI pelo configurador selecionado e exibe a resposta. Exige `gpon_exec`.

Essa função ignora as regras de negócio dos cadastros, não valida o conteúdo do comando e pode derrubar uma PON ou toda a OLT. Restrinja seu uso a operadores que conheçam a sintaxe exata do modelo, com janela e plano de retorno definidos.

### Scripts

Exibe, por evento, os comandos encontrados estaticamente no código do configurador. É possível consultar a OLT atual ou outra marca/versão, filtrar, expandir e recolher eventos.

Esta aba **não se conecta à OLT e não executa comandos**. Ela serve para auditoria e planejamento; condicionais e comandos formados dinamicamente podem aparecer de forma parcial, portanto não substitui a análise do configurador nem um backup do equipamento.

## Teste, senha e atualização de acessos

- **Visualizar Senha:** aparece apenas para administrador de filial e mostra a senha armazenada em texto visível. Evite compartilhar capturas e feche a janela após o uso.
- **Testar Conexão:** também é restrito a administrador de filial. Usa o configurador da marca e mostra a resposta e o tempo gasto.
- **Atualizar:** escolhe slot/PON e abre uma rotina de reconciliação. Ela percorre todos os acessos vinculados à OLT e à porta, inclusive sem limitar por filial; quando a ONU existe no banco mas não no equipamento, tenta autorizá-la novamente e reaplicar a configuração do acesso. Exige `servidor_update`.

A atualização não é uma simples sincronização de leitura: ela pode provisionar várias ONUs. A rotina considera como ausência uma mensagem específica da CLI (`The required ONT does not exist`), de modo que seu resultado depende do fabricante e do texto retornado. Execute-a somente após conferir o filtro de slot/PON.

No caminho Nokia/EventBus, o daemon atual não trata o tópico `testConnection`; por isso, o teste pode retornar “sem resposta” mesmo quando outras consultas da OLT funcionam.

## Provisionamento pelo contrato

Ao criar um acesso GPON, o LHISP exige número de série e porta PON. O configurador:

1. autoriza a ONU com o perfil derivado da rede e da VLAN;
2. grava a ONU local com OLT, slot, PON, índice e número de série;
3. grava o acesso e seu vínculo com essa ONU;
4. aplica a configuração de acesso conforme o modo escolhido, como bridge, router ou VEIP, dentro do suporte do fabricante.

Na remoção, as chamadas ao equipamento são protegidas por tratamento de erro em parte dos fluxos. Assim, o registro do LHISP pode ser removido mesmo que a limpeza na OLT falhe. Sempre confirme os dois lados após cancelamentos ou migrações.

## Exclusão da OLT

A exclusão é física e emite um evento de remoção. As portas registradas e ocorrências de monitoramento possuem exclusão em cascata, mas as ONUs possuem chave estrangeira sem cascata e normalmente bloqueiam a operação enquanto existirem.

As tabelas de redes e acessos guardam o ID da GPON OLT sem uma chave estrangeira equivalente no esquema atual. Se a exclusão ocorrer após remover as ONUs, esses registros podem permanecer apontando para um ID inexistente. Antes de apagar:

1. liste redes, acessos e ONUs vinculados;
2. migre ou remova os clientes e valide a desautorização no equipamento;
3. altere ou remova as redes GPON;
4. só então exclua a OLT e confira os consumidores do evento.

## Diagnóstico de problemas

| Sintoma | Verificação recomendada |
|---|---|
| **Falha no teste de conexão** | Confirme IP, porta, transporte esperado pelo fabricante, usuário, senha, senha enable, rota e ACL. |
| **Chassi ou ONUs não carregam** | Verifique modelo/versão, disponibilidade do configurador e, para Nokia, RabbitMQ e `lhisp-daemon-olt`. Aguarde também o vencimento do cache. |
| **Comandos incompatíveis ou saída não interpretada** | Confirme fabricante e versão; famílias da mesma marca podem ter CLIs diferentes. |
| **ONU continua visível após autorização/desautorização** | Aguarde o cache, atualize a aba e confira diretamente a OLT e o registro `GPONONU`. |
| **Acesso foi removido, mas a ONU permanece configurada** | A limpeza no equipamento pode ter falhado sem impedir a exclusão local. Faça a conferência e correção controlada na OLT. |
| **Atualizar não reprovisiona** | A rotina depende da ONU local, da rede correta e do texto de ausência retornado pela CLI. Consulte o resultado detalhado da janela. |
| **Fabricante não implementado no daemon** | O caminho EventBus atual aceita apenas Huawei e Nokia; confirme se a marca deveria usar um configurador PHP ou se falta suporte no serviço. |

## Screenshot

![GPON OLT no ambiente de demonstração](/assets/screenshots/rede-infra/gpon-olt.png)
