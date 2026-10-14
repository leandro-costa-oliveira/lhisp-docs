---
title: Aplicativo técnico Expo
description: Seleção do provedor, acesso às ordens, baixa, materiais e limites do armazenamento offline no aplicativo Expo.
published: true
editor: markdown
---

# Aplicativo técnico Expo

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.

Este guia trata do aplicativo técnico para dispositivos móveis. Selecione a empresa antes de entrar. O [LHTEC web](/agenda-tecnica/lhtec-web), publicado em `/lhtec`, é outra aplicação e tem fila de baixa própria.

## Entrar

1. Na seleção de empresa, localize o provedor e confira sua identificação.
2. Informe **Usuário** e **Senha** no login.
3. Aguarde o carregamento da lista de OS e abra o protocolo desejado.

A empresa e o usuário autenticado são preservados no armazenamento do aplicativo. Uma resposta HTTP 401 invalida o usuário local; faça login novamente na empresa correta. A instalação pode buscar uma atualização do aplicativo antes de abrir a interface.

## Consultar e executar

A lista apresenta as ordens devolvidas pela API do técnico. Os detalhes incluem contrato, cliente, filial, endereço, acessos e materiais locados. A consulta de estoque é uma área própria.

Use **Iniciar** para enviar o início ao servidor quando conectado. **Adicionar observação** registra o acompanhamento; a ação de dispensa possui confirmação no fluxo. Não use uma ordem de outro contrato para registrar materiais ou fotos da visita atual.

Para baixar:

1. Abra a ordem e a opção de baixa.
2. Informe a descrição, obtenha a localização e confira latitude/longitude.
3. Adicione ao menos um anexo; a tela oferece captura pela câmera.
4. Selecione materiais utilizados e recolhidos com suas quantidades.
5. Informe situação de conclusão quando apresentada e envie.
6. Aguarde a mensagem de sucesso e confira a lista atualizada.

O formulário exige coordenadas numéricas e um conjunto não vazio de anexos. Isso não substitui as validações adicionais da API. A baixa só é confirmada pelo retorno do servidor; exibir um formulário preenchido não altera estoque, locação ou situação da OS.

## Consulta offline e início local

O aplicativo persiste o cache de consultas por até 24 horas. A versão do aplicativo compõe a identificação desse cache; atualização de versão pode invalidar os dados anteriores.

A rota offline encontra a OS na **lista já carregada** e permite registrar um horário de início no armazenamento local. O rótulo **Horário armazenado local** não comprova registro no servidor.

O horário registrado localmente não é enviado ao iniciar a OS no servidor. Não use esse registro local como comprovação de que o painel preservou automaticamente o horário original da visita. Após reconectar, confira o início no painel e trate divergências pelo fluxo administrativo.

Não foi localizada neste aplicativo a mesma rotina de restauração/retomada de baixas registrada no LHTEC web. As mutações também não usam repetição automática por padrão. Mantenha conexão para concluir baixas e confira o resultado antes de repetir uma tentativa com resposta incerta. Cache persistido não equivale a uma fila homologada de todas as operações offline.

## Problemas comuns

| Sintoma | Conferência |
|---|---|
| Empresa não localizada | Nome usado na busca e cadastro do provedor na gerência. |
| Autenticação expirou | Novo login na empresa selecionada, com as credenciais previstas pela API técnica do provedor. |
| OS não disponível offline | Carregue a lista com conexão antes da visita; confira idade e versão do cache. |
| Início local difere do painel | O horário local não é enviado pela chamada de início atual. |
| Baixa sem retorno | Confira a ordem e os materiais no servidor antes de reenviar. |

Os dois aplicativos possuem comportamentos distintos; confirme os recursos disponíveis na versão instalada. Consulte [Agenda técnica](/agenda-tecnica/agenda-tecnica) para regras administrativas.
