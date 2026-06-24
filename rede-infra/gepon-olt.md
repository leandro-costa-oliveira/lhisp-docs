---
title: GePON OLT
published: true
editor: markdown
description: ''
---

# GePON OLT

> **⚠️ Rascunho gerado por agente**
>
> Este documento foi produzido a partir da tela observada no ambiente de demonstração do LHISP. A captura usada nesta página foi validada visualmente e mostra o formulário principal da OLT GePON.

## Objetivo

Registrar a tela de **GePON OLT** do módulo **Rede/ Infra**, que concentra o cadastro do equipamento, parâmetros de comunicação e a navegação para informações/ONUs.

## Quando usar

Use este fluxo para:

- cadastrar ou revisar uma OLT GePON;
- vincular a OLT a um ponto de presença;
- definir o tipo de equipamento;
- informar parâmetros de comunicação SNMP e IP;
- navegar para a aba de informações/ONUs quando necessário.

## Pré-requisitos

- Acesso ao módulo **Rede/ Infra**.
- Permissão para consultar ou manter cadastros de OLT.
- Dados do ponto de presença e parâmetros de comunicação da OLT.
- Tela carregada no demo com o formulário acessível.

## Passo a passo

1. Acesse **Rede/ Infra > GePON OLT**.
2. Use **Anterior** e **Próximo** para navegar entre registros.
3. Clique em **Novo**, **Editar** ou **Apagar** conforme a necessidade do cadastro.
4. Preencha os campos do formulário principal.
5. Use **Salvar** ou **Cancelar** para concluir a operação.
6. Se precisar localizar um registro, utilize **Procurar**.
7. Consulte a aba **Informações / ONUs** para dados complementares.

## Campos importantes

| Campo / elemento | Observação |
|---|---|
| **Ponto de Presença** | Associa a OLT ao POP correspondente. |
| **Tipo** | Seletor de tipo do equipamento; a tela exibiu opções como **FIT FNL 1000**, **FIT FNL 2000**, **FIT FNL 5000**, **CIANET CTS2720**, **V-Solutions** e **Intelbras EPON**. |
| **Conectar por** | Define o modo de conexão/associação do equipamento. |
| **IP** | Endereço de gerenciamento da OLT. |
| **Comunidade SNMP** | Comunidade usada para monitoramento. |
| **Porta SNMP** | Porta SNMP do equipamento. |
| **Timeout SNMP(s)** | Tempo de espera da consulta SNMP. |
| **Descrição** | Campo livre para identificação do registro. |
| **Informações / ONUs** | Aba secundária para dados relacionados às ONUs. |

## Resultado esperado

- A OLT GePON fica associada ao ponto de presença correto.
- Os parâmetros de comunicação ficam registrados.
- A tela permite navegar para informações complementares do equipamento.
- O cadastro pode ser consultado e mantido a partir da barra de ações.

## Problemas comuns

| Problema | Como tratar |
|---|---|
| Não encontro o POP desejado | Use a busca do campo **Ponto de Presença** ou revise o cadastro base. |
| O tipo correto não aparece | Confirme se o perfil do equipamento está disponível na lista. |
| O IP não responde | Revise conectividade, máscara, gateway e parâmetros SNMP. |
| Não consigo salvar | Verifique se os campos obrigatórios foram preenchidos. |

## Observações

- A tela tem cabeçalho próprio do módulo.
- A captura validada estava limpa, sem marcações ou anotações visuais.
- O formulário principal exibe os campos de cadastro e uma aba complementar de **Informações / ONUs**.
- A rota observada no demo é `https://demo.lhprovedor.com.br/lgc/redeinfra%7Colt`.

## Dúvidas para revisão

- A lista de tipos é compartilhada entre **GePON OLT** e **GPON OLT**?
- A aba **Informações / ONUs** é apenas consulta ou também permite manutenção?
- O campo **Conectar por** define protocolo, origem da conexão ou outro relacionamento?
- O fluxo salva a OLT diretamente no LHISP ou apenas registra a integração?

## Screenshots sugeridos

- Tela principal de **GePON OLT** no demo: `assets/screenshots/rede-infra/gepon-olt.png`

![GePON OLT no demo](/assets/screenshots/rede-infra/gepon-olt.png)
