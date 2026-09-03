---
title: Contratos
published: true
editor: markdown
description: Localize clientes e opere o ciclo cadastral, comercial, técnico, financeiro e de atendimento do contrato.
---

# Contratos

O contrato é o eixo operacional do LHISP. Ele vincula uma pessoa e uma filial aos serviços vendidos, acessos de rede, cobranças, notas fiscais, atendimentos, OTT, telefonia, produtos e documentos. A situação do contrato resume o conjunto; cada serviço mantém também sua própria situação.

## Localizar um contrato

A listagem permite filtrar por filial, situação, endereço e registros apagados. A pesquisa principal aceita:

- cliente ou número do contrato;
- e-mail, apelido, CPF/CNPJ, website ou telefones;
- MAC, IPv4, IPv6, usuário PPPoE, serial GPON ou EPON;
- ramal telefônico;
- ID da importação;
- protocolo de atendimento.

Sem texto, a tela carrega dez contratos por chamada; com texto, consulta até cem. Se uma pesquisa executada retornar exatamente um contrato, o sistema abre seu cadastro automaticamente.

As cores ajudam na triagem: cancelados aparecem em vermelho, pendentes em azul-claro e contratos com algum serviço bloqueado em amarelo. A coluna **Situação** lista o ID e o estado de cada serviço, não apenas o estado geral do contrato.

Para incluir um cliente, use o botão **Novo**. Consulte [Cadastrar novo cliente](/contratos/cadastrar-novo-cliente).

## Cabeçalho do cadastro

- Digite o número no campo do cabeçalho e pressione `Enter` para abrir outro contrato.
- **Anterior** e **Próximo** navegam pela sequência disponível.
- **Editar** habilita a alteração; **Salvar** envia a aba ativa e **Cancelar** descarta a edição não salva.
- **Apagar** exige confirmação e remove o contrato pelo fluxo administrativo. Trate como irreversível na interface.
- Os selos informam inclusão em SPC/Serasa, lista negra e bloqueio da Central do Assinante.

O cabeçalho reflete a situação geral: **Pendente**, **Ativo**, **Cancelado**, **Suspenso** ou **Desativado**. Bloquear um serviço por inadimplência pode mudar o resumo do contrato sem cancelar os demais serviços.

## Abas

| Aba | Responsabilidade |
|---|---|
| **Dados** | Pessoa, filial, categoria, origem, contatos, endereços, localização, histórico, alarmes, notificações, crédito e acesso ao LHSAC. |
| **Serviços** | Planos contratados, valores, vencimento, fidelidade, situação e regras de cobrança/fiscal. |
| **Acessos** | Autenticação e endereçamento de rede vinculados ao serviço, incluindo PPPoE, IP, ONU e velocidade. |
| **Financeiro** | Contas a receber, pagamentos, carnês, negociação e relatório de quitação. |
| **NF** | Notas fiscais relacionadas ao contrato. |
| **Atendimentos** | Protocolos e ordens de atendimento do cliente. |
| **OTT** | Assinaturas e provisionamento de serviços de conteúdo vinculados. |
| **Telefonia** | Ramais, portabilidade, recargas, faturas e ações do provedor VoIP. |
| **Produtos** | Equipamentos/produtos associados ao contrato. |
| **Documentos** | Modelos, arquivos, aceite e anexos do contrato. |
| **Observações** | Registro cronológico de observações internas. |

Parte dessas abas é React e parte incorpora telas do backend PHP. Na aba **Dados**, o botão de ambulância alterna entre as interfaces atual e legada. A aba **Documentos** também pode variar conforme a preferência local `newTabDocs`.

## Ordem operacional recomendada

1. Cadastre ou selecione a pessoa e salve os dados do contrato.
2. Adicione o serviço contratado com plano, valor, cobrança e regras corretas.
3. Crie o acesso técnico e associe-o ao serviço.
4. Ative/provisione os recursos de rede, OTT ou telefonia aplicáveis.
5. Confira a primeira mensalidade, descontos, proporcionalidade e registro no gateway.
6. Gere documentos e notas conforme o processo comercial/fiscal.
7. Registre ocorrências nas abas de atendimento, documentos ou observações.

## Situação do contrato e dos serviços

Não trate contrato e serviço como o mesmo estado. Um contrato pode conter serviços ativos, bloqueados e cancelados simultaneamente. Rotinas financeiras normalmente selecionam o serviço vinculado à conta; rotinas de rede atuam sobre os acessos desse serviço.

Antes de bloquear, cancelar, excluir ou trocar um plano, confira:

- contas em aberto e remessas;
- acessos e equipamentos vinculados;
- OTT/telefonia associados;
- fidelidade, promoção e histórico;
- notas fiscais e documentos;
- atendimentos em andamento.

## Diagnóstico

| Situação | Verificação |
|---|---|
| Contrato não aparece | Confira filial, situação, endereço, tipo de pesquisa e opção de exibir apagados. |
| Pesquisa por rede não retorna | Verifique se MAC/IP/ONU/usuário está realmente vinculado a um acesso do serviço. |
| Situação parece divergente | Compare a situação geral com os estados individuais na aba **Serviços**. |
| Aba não salva | Entre em **Editar**, corrija campos obrigatórios e aguarde o processamento do formulário atual/legado. |
| Ação não aparece | Confirme permissão e situação do contrato/serviço. |
| Dados diferem entre interfaces | Recarregue o contrato e confronte o histórico; não salve simultaneamente nas telas atual e legada. |

Rotas atuais: listagem `/contratos`, cadastro `/contratos/:contrato_id` e novo contrato `/contratos/add`.
