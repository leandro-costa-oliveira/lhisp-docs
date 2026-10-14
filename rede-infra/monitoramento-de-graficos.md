---
title: Monitor de Gráficos
published: true
editor: markdown
description: Montagem e visualização de painéis com gráficos existentes de vários servidores.
---

# Monitor de Gráficos

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.

O Monitor de Gráficos reúne gráficos já cadastrados em um painel para acompanhamento contínuo. **Descrição** é o nome do painel, não um filtro da tabela. A composição associa gráficos de um ou vários servidores; não cria novas coletas SNMP.

O cadastro e a visualização desse monitor permanecem em páginas PHP legadas. O cadastro de cada gráfico também está disponível na aba **Gráficos** do [Servidor](/rede-infra/servidores).

## Pré-requisitos

- Acesso autenticado e permissão para o cadastro.
- Gráficos cadastrados nos servidores que serão acompanhados.
- SNMP acessível e coleta ativa para produzir o histórico dos gráficos.

## Montar o painel

1. Abra **Rede e Infraestrutura → Monitor de Gráficos** e selecione **Novo**, ou **Editar** para um painel existente.
2. Informe a **Descrição** que identificará o painel.
3. Defina **Exibir por linha**, de 1 a 4 na interface.
4. Clique em **Adicionar Gráfico** (`+`) e selecione um gráfico existente.
5. Repita para os demais gráficos. A tabela apresenta ID, servidor e descrição de cada um.
6. Para retirar um item, use **Remover Gráfico da Composição** e confirme.
7. Salve o painel com pelo menos um gráfico.
8. Em modo de consulta, clique em **Visualizar Monitoramento** para abrir o painel em outra janela.

O backend valida os IDs dos gráficos e a quantidade por linha, e salva a descrição em maiúsculas. Retirar um item da composição não apaga o gráfico do servidor nem seu histórico. Ao editar e salvar, a relação de gráficos do painel é substituída pela composição enviada.

## Acompanhar o painel

A visualização apresenta servidor, IP e título de cada gráfico. Em **Exibir**, selecione o período de 15 minutos a um dia; o padrão é **Último Dia**.

Sem alternância, a página atualiza as imagens a cada 60 segundos. Com **Alterar entre os gráficos** habilitado, passa ao próximo painel cadastrado, voltando ao primeiro ao terminar; nessa navegação usa contagem de 10 segundos. Essa opção alterna os painéis, não as séries de um único gráfico.

Atualizar a imagem consulta o histórico já coletado. Isso não força nova coleta SNMP nem garante um ponto por minuto: a menor resolução do histórico é de cinco minutos.

A página tenta manter a sessão autenticada e renovar a credencial quando uma imagem falha. Se a renovação for recusada, exibe **Sessão expirada, faça login novamente no sistema.** Reautentique-se e reabra o monitor.

## Coleta e retenção

A coleta ocorre por padrão a cada 60 segundos, e o histórico usa resolução mínima de cinco minutos. Atrasos prolongados sem atualizações geram lacunas no gráfico. Coleta, atualização da imagem e resolução do gráfico são intervalos diferentes.

Alterar apenas a frequência de coleta sem revisar o heartbeat dos arquivos existentes pode aumentar os buracos no gráfico. A configuração `RRD_AUTO_TUNE` é desativada por padrão; não presuma que mudar `RRD_HEARTBEAT` no ambiente modificou os RRDs já gravados. Consulte a operação responsável antes de ajustar esses parâmetros.

Um gráfico vazio pode indicar ausência de coleta ou falha de imagem/sessão. O painel não diagnostica a causa sozinho. Consulte [Operação dos serviços de rede](/rede-infra/operacao-servicos-rede) e [Central de Alertas](/rede-infra/central-de-alertas).

## Problemas comuns

| Sintoma | Verificação |
|---|---|
| Não permite salvar | Informe descrição e ao menos um gráfico válido; confira quantidade por linha. |
| Não aparece o botão de visualização | Salve e saia do modo de edição. |
| Janela não abre | Autorize o popup para o LHISP e tente novamente. |
| Painel aparece sem dados recentes | Confira SNMP e data da última coleta; se persistir, encaminhe o caso ao suporte. |
| Gráficos desaparecem depois de algum tempo | Verifique a mensagem de sessão e faça login novamente se a renovação falhar. |
| Lacunas no histórico | Compare duração do ciclo, falhas SNMP e heartbeat; não preencha lacunas sem preservar evidência do incidente. |
| Não encontro o gráfico no painel | Confira a composição salva e o cadastro original no servidor. |

![Cadastro do Monitor de Gráficos legado](/assets/screenshots/rede-infra/monitoramento-de-graficos.png)
