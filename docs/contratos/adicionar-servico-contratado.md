---
title: Adicionar um serviço contratado
---

# Adicionar um serviço contratado

## Objetivo
Adicionar um serviço/plano contratado a um contrato de cliente dentro do módulo **Contratos**.

## Quando usar
- Após cadastrar/selecionar um **contrato já existente**.
- Quando precisar **vincular um novo plano/serviço** ao contrato (independente de o contrato já ter serviços **ATIVOS** ou **CANCELADOS**).

## Pré-requisitos
- Contrato do cliente criado e disponível na lista de **Contratos**.
- Plano/serviço previamente cadastrado no LHISP.
- Permissão para alterar contratos e serviços contratados.

## Passo a passo
1. Acesse **Contratos** (menu lateral).
2. Pesquise e abra o contrato desejado.
3. Na tela do contrato, clique na aba **Serviços**.
4. Revise a grade de **serviços contratados**.
5. Clique em **Novo Serviço**.
6. Preencha o modal **Contratação de Serviço**:
   - **Plano** (combo)
   - **Quantidade** (spin)
   - **Observação** (texto)
   - **Tipo de IP**: *IP PRIVADO* / *IP PÚBLICO* / *NÃO APLICÁVEL*
   - **Tipo de Equipamento**: *PRÓPRIO* / *COMODATO* / *LOCAÇÃO* / *NÃO APLICÁVEL*
   - **Conta Bancária [Boleto]** e **Conta Bancária [Pix]** (combos)
   - **Vendedor** / **Promoção** / **Fidelidade** (combos)
   - **Regras de cobrança/automação** (checkboxes), incluindo:
     - *Não Enviar Mensagens de Cobrança?*
     - *Não Efetuar Bloqueio Automático?*
     - *Não Efetuar Cancelamento Automático?*
     - *Enviar Boletos por Email?*
     - *Enviar Boletos por WhatsApp?*
     - *Cancelar Contas Automaticamente?*
   - **Valor**, **Desconto [%]** e **Vencimento**
   - Opções adicionais observadas no modal (conforme regra do sistema), por exemplo:
     - *Gerar Nota Fiscal?*
     - *Enviar Notas Fiscais por Email?*
     - *Exigir OTT para gerar SVA?* / *Exigir OTT para gerar ISS?*
7. Clique em **Salvar**.
8. Confirme que a nova linha foi incluída na tabela da aba **Serviços** (coluna **Situação** pode aparecer como **ATIVO** ou **CANCELADO**, dependendo da regra do contrato/serviço).

## Campos importantes
Na aba **Serviços**, a grade exibe colunas observadas:

| Campo/coluna | Descrição |
|---|---|
| **Ações** | Ações do serviço (ex.: **Editar** e outras opções conforme status/fluxo). |
| **Id** | Identificador interno do serviço contratado. |
| **Plano** | Plano/serviço vinculado ao contrato. |
| **Contratação** | Data/hora de contratação do serviço. |
| **Ativação** | Data/hora de ativação do serviço. |
| **Ultimo Reajuste** | Data do último reajuste. |
| **Ultimo Renovação** | Data da última renovação. |
| **Venc.** | Vencimento associado ao ciclo do serviço/cobrança. |
| **Valor** | Valor contratado (conforme configuração do plano e descontos). |
| **Desc [%]** | Desconto percentual aplicado. |
| **Situação** | Status do serviço (observado **ATIVO** e **CANCELADO**; podem existir outros). |

## Resultado esperado
- O serviço/plano fica vinculado ao contrato.
- A linha do serviço aparece na aba **Serviços**.
- O serviço passa a integrar os fluxos seguintes (por exemplo, acessos/cobrança), conforme as regras do sistema.

## Problemas comuns
| Problema | Como tratar |
|---|---|
| Botão **Novo Serviço** não está disponível | Confirme se você está na aba **Serviços** do contrato (e não em outra aba). Verifique também permissão do usuário. |
| Modal **Contratação de Serviço** não aceita o salvamento / não persiste | No demo, o salvamento não foi validado até a persistência da linha. Como prática, revise principalmente: **Plano**, **Valor**, **Desconto [%]** e **Vencimento**, além das **Contas (Boleto/Pix)** e **Forma de pagamento**. |
| Plano/Conta Bancária indisponíveis na lista do modal | Confirme parametrizações do sistema (filial/categoria/provedor, além de contas cadastradas). |
| Linhas não aparecem após salvar | Atualize/reaqueça a tela do contrato e verifique se o serviço está no status esperado. |

## Observações
- A aba **Serviços** utiliza uma tabela embutida (iframe) com a grade e o botão **Novo Serviço**.
- A coluna **Ações** oferece opções por serviço (ex.: **Editar** e, dependendo do caso, ações adicionais como **Alteração de Plano**).

## Dúvidas para revisão
- Quais são *obrigatórios* no modal **Contratação de Serviço** para que o salvamento persista (especialmente campos relacionados a **Valor**, **Desconto [%]**, **Vencimento** e **Contas/Forma de pagamento**)?
- Quais valores fazem o serviço iniciar como **ATIVO** vs **CANCELADO** (regra do contrato/serviço)?

## Screenshots sugeridos
- Aba **Serviços** do contrato: `docs/assets/screenshots/contratos/servicos-aba.png`

![Aba Serviços](../assets/screenshots/contratos/servicos-aba.png)

- Modal **Contratação de Serviço**: `docs/assets/screenshots/contratos/contratacao-servico-modal.png`

![Modal Contratação de Serviço](../assets/screenshots/contratos/contratacao-servico-modal.png)
