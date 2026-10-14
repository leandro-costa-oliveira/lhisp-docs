---
title: Planos
published: true
editor: markdown
description: Catálogo comercial que define cobrança, velocidade, fiscal, fidelidade e integrações dos serviços.
---

# Planos

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.

O plano é o modelo comercial e técnico usado na contratação de um serviço. Ele não define apenas preço: concentra contas de cobrança, velocidade, tecnologia, fidelidade, divisão fiscal, regras de desconto, tipos de serviço e recursos integrados. Ao adicionar o plano a um contrato, o LHISP cria um **serviço contratado** com uma cópia dos parâmetros aplicáveis.

Essa distinção é essencial: o plano é o catálogo; o serviço contratado é a condição efetiva do cliente. Salvar uma mudança no plano normalmente não recalcula contratos existentes. Quando a alteração também deve alcançar a base atual, use conscientemente as ferramentas em massa disponíveis no próprio cadastro.

## Relações no sistema

- **Contratos:** recebem plano, valor, quantidade, contas bancárias, fidelidade e regras fiscais.
- **Financeiro:** a conta de boleto e a conta Pix direcionam mensalidades; uma conta separada pode cobrar instalação.
- **Rede e acesso:** download, upload, burst, redução de velocidade, tipo de IP, equipamento e tecnologia orientam o provisionamento.
- **Fiscal:** percentuais SCM, SVA, provedor, ISS e locação detalham a composição usada na geração fiscal.
- **OTT/SVA e VoIP:** recursos associados ao plano participam da contratação e do ciclo de ativação/cancelamento das integrações.
- **Documentos e aceite:** o plano pode exigir aceite de um documento antes de determinadas etapas do contrato.
- **Filiais:** somente filiais vinculadas oferecem o plano nos fluxos correspondentes.
- **Hotspot, Intelbras Mibo e módulos:** opções aparecem e são aplicadas conforme as integrações/configurações habilitadas para a empresa.

## Configuração principal

| Grupo | Impacto |
|---|---|
| Descrição e situação | O nome identifica o plano; inativar retira-o das seleções que filtram planos ativos, sem cancelar serviços já contratados. |
| Cobrança | Define valor, tipo de precificação, descontos máximos e contas bancárias para boleto, Pix e instalação. |
| Instalação e fidelidade | Define preço/desconto da instalação e período de fidelidade sugerido ao contratar. |
| Acesso | Define velocidades, burst, redução por inadimplência, tecnologia, IP e equipamento. |
| Serviços | Habilita acesso, e-mail, VoIP, OTT, hotspot ou Intelbras Mibo conforme disponibilidade. |
| Fiscal | Divide o valor entre SCM, SVA, provedor, ISS e locação; opções podem condicionar SVA/ISS à existência de OTT. |
| Filiais | Controla onde o plano pode ser contratado ou escolhido. Pelo menos uma filial é exigida pela SPA. |
| Integrações | Relaciona gateways/recursos OTT, produtos Mibo, provedor de cartão e módulos do LHISP Manager. |

O backend exige nome, valor não negativo e conta bancária de cobrança válida. A SPA também exige ao menos uma filial e valida configurações de faixa e produtos de integrações antes de salvar.

## Tipos de cobrança

| Tipo | Cálculo do serviço contratado |
|---|---|
| **Fixo** | Cobra o valor do plano; quantidade não altera o preço. |
| **Fracionado** | Multiplica a quantidade pelo valor unitário do plano. |
| **Fracionado por faixa** | A quantidade seleciona a faixa e multiplica pelo valor unitário dessa faixa. |
| **Escalonado** | A quantidade seleciona a faixa, mas o valor da faixa já é o total e não é multiplicado. |

Nas tabelas por faixa, a primeira faixa deve começar em 1, não pode haver lacunas ou sobreposições e somente a última pode ficar sem limite. O valor do plano atua como mínimo em partes do cálculo legado; simule quantidades antes de liberar o plano.

> **Atenção:** alterar uma tabela de faixas não recalcula os serviços contratados. Depois de salvar, use **Atualizar valores dos contratos** somente se a mudança tiver de ser propagada.

## NFS-e Fortaleza — notas de serviço

O cadastro possui uma seção própria para os códigos usados em notas de serviço:

| Campo | Preenchimento no sistema |
|---|---|
| **Item da lista de serviços** | Seleção do item; a tela apresenta a descrição e preserva um valor anterior fora do recorte de opções para provedores. |
| **Código NBS**, **INDOP**, **CST IBS/CBS** e **cClassTrib** | Seletores relacionados pelo catálogo fiscal incluído na versão do sistema. |
| **Código de tributação municipal** | Até 20 caracteres, com dígitos e separadores ponto, barra ou hífen. Os separadores são preservados. |
| **CNAE para o XML** | Opcional, com sete dígitos; não corresponde ao código da atividade municipal. |

É possível salvar a configuração incompleta e completá-la depois. Códigos informados precisam ter formato válido; o backend recusa códigos ausentes no catálogo e combinações incompatíveis entre item, NBS, INDOP, CST e classificação tributária. Se o catálogo não carregar, os seletores ficam indisponíveis e a tela oferece **Tentar novamente**.

Confirme os códigos com o responsável contábil. O catálogo da aplicação e seus avisos auxiliam o preenchimento; salvar o plano não comprova autorização da nota pelo município.

Esses parâmetros são usados por **novas notas de serviço**, inclusive em planos com outras divisões fiscais. Notas existentes preservam os valores já gravados; campos ainda vazios podem ser complementados na exportação ou impressão. Quando houver vários serviços na composição da nota, o plano registrado no primeiro item determina a origem desses parâmetros; não se escolhe automaticamente o item mais completo.

SVA, locação e NFCom não usam esse conjunto. O botão **Atualizar divisão fiscal dos contratos** também não propaga esses códigos: ele trata percentuais e regras de divisão, que são outra configuração.

## Ferramentas que afetam contratos existentes

As ações abaixo pedem dupla confirmação e são tratadas como irreversíveis pela interface:

- **Atualizar valores dos contratos:** percorre serviços do plano, ignora cancelados e valores VIP/zerados, recalcula por tipo/quantidade/faixa e registra a alteração. Falhas são isoladas por serviço.
- **Atualizar contas bancárias dos contratos:** copia as contas de boleto e, quando configurada, Pix para todos os serviços não cancelados do plano.
- **Atualizar divisão fiscal dos contratos:** copia percentuais e regras fiscais para serviços não cancelados e com valor maior que zero.
- **Migrar contratos em massa:** por filial, troca serviços ativos, bloqueados ou suspensos para outro plano. Por padrão ignora clientes com valor zero; **Listar Clientes VIP** inclui esses serviços e mantém valor zero.

Salvar o plano antes dessas ações garante que os valores de origem sejam os recém-configurados. Revise a prévia, especialmente diferenças de preço na migração.

## Reajuste

O cadastro armazena a opção **Reajuste Automático**, tipo percentual ou valor fixo, valor e quantidade de meses de carência. Também existe o fluxo separado [Reajuste de Serviços Contratados](/financeiro/reajuste-servicos-contratados), que permite selecionar e confirmar a aplicação.

> **Limitação verificada:** nos repositórios revisados foi encontrada a persistência dessas opções e os métodos de aplicação de reajuste, mas não uma tarefa agendada que consuma automaticamente a configuração do plano. Valide o processo operacional implantado antes de depender apenas dessa marcação.

## Cadastro seguro

1. Defina público, filial, preço e modelo de cobrança.
2. Configure contas bancárias e política de instalação/fidelidade.
3. Valide velocidades e parâmetros de provisionamento com a equipe de rede.
4. Valide a divisão fiscal com o responsável contábil.
5. Associe apenas integrações já configuradas e homologadas.
6. Salve, faça uma contratação controlada e confira serviço, cobrança, rede e fiscal.
7. Só então aplique ferramentas em massa, se necessário.

## Exclusão e clonagem

A exclusão é lógica e não cancela contratos nem serviços que já usam o plano. Prefira inativar quando houver histórico ativo. A clonagem cria um novo plano a partir da configuração carregada, com novo nome e novas associações persistidas ao salvar; revise contas, filiais, preços e integrações antes de disponibilizá-lo.

## Captura da tela

![Listagem de planos](/assets/screenshots/cadastros/financeiro/planos.png)
