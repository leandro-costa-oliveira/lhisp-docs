---
title: Pré-cadastros
published: true
editor: markdown
description: Acompanhe oportunidades comerciais e converta uma solicitação em pessoa, contrato e serviço contratado.
---

# Pré-cadastros

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.

O pré-cadastro registra uma oportunidade antes de ela se tornar cliente. Ele reúne identificação, contato, endereço, interesse comercial, vendedor e documentos recebidos por canais de venda. A equipe pode acompanhar a negociação e, quando houver aceite, converter os dados no fluxo operacional do LHISP.

O registro pode chegar pelas APIs internas e de vendas — usadas por canais externos — ou ser incluído no próprio sistema. Ele também alimenta o **Dashboard de Pré-cadastros**, que consolida volume e conversões por período, estágio, segmento e vendedor.

## Situação, estágio e segmento

São classificações diferentes:

| Classificação | Valores | Uso |
|---|---|---|
| **Situação** | Pendente, Confirmado ou Cancelado | Indica se a oportunidade ainda está aberta, virou cliente ou foi encerrada. A lista abre filtrada por pendentes. |
| **Estágio** | Inicial, Orçamento, Aguardando fechamento ou Cancelado | Representa o avanço comercial. Ao selecionar Cancelado, o motivo passa a ser obrigatório. |
| **Segmento** | B2C ou B2B | Separa vendas para consumidor e para empresas nos filtros e indicadores. |

Mantenha o estágio atualizado mesmo enquanto a situação estiver pendente. Isso evita que oportunidades em orçamento ou aguardando decisão sejam tratadas como novos contatos.

## Dados necessários

Nome, CPF/CNPJ, telefone principal, data de nascimento, nomes do pai e da mãe, UF, cidade, bairro e logradouro são exigidos pelo backend. A interface também exige o número do endereço. Esses dados são usados posteriormente para formar a pessoa e o contrato; corrija-os antes de confirmar.

O campo **Plano desejado** é texto livre para registrar o interesse inicial. Ele não substitui o plano real: na confirmação é obrigatório escolher um plano cadastrado e disponível para a filial selecionada.

Filial, plano, vendedor e dia de vencimento têm efeito direto na contratação:

- a filial define onde o novo contrato será operado;
- o plano origina o serviço contratado;
- o vendedor fica associado à contratação para acompanhamento e relatórios;
- o dia de vencimento passa à cobrança do serviço.

## Acompanhar oportunidades

1. Acesse **Cadastros > Pré-cadastros**.
2. Pesquise pelo nome ou filtre por situação, segmento, estágio e vendedor.
3. Abra o registro para atualizar a negociação, o plano desejado, a observação e os contatos.
4. Use a exportação quando precisar trabalhar a carteira em planilha.

A busca textual atual consulta o nome. Os resultados são paginados em grupos de dez. Para analisar o funil consolidado, use o dashboard de marketing em vez da listagem operacional.

## Confirmar e gerar a contratação

O botão **Confirmar cadastro** aparece apenas para uma oportunidade pendente. Antes de confirmar, escolha filial, plano, vendedor quando aplicável e vencimento.

Na confirmação, o backend executa este encadeamento:

1. cria ou reutiliza o endereço correspondente;
2. procura uma pessoa da empresa pelo CPF/CNPJ;
3. cria a pessoa somente se ela ainda não existir;
4. cria um novo contrato para essa pessoa e endereço;
5. contrata o plano escolhido, com vendedor e vencimento;
6. vincula contrato e serviço ao pré-cadastro;
7. muda a situação para **Confirmado**;
8. copia os anexos para os documentos do contrato.

Se o documento já pertencer a uma pessoa, os dados dessa pessoa são preservados e um novo contrato é criado para ela. Portanto, valide se o documento identifica realmente o titular antes de confirmar.

A confirmação cria o contrato e o serviço, mas não significa que o acesso de internet já foi provisionado ou ativado. Continue o atendimento nos módulos de **Contratos**, **Serviços contratados** e **Acessos** conforme o processo da empresa.

## Anexos

Os canais de integração podem enviar imagens e PDFs em base64. Os arquivos ficam associados ao pré-cadastro, em armazenamento local ou S3 conforme a configuração da empresa. Na confirmação, são copiados para os documentos do contrato e identificados pela origem do pré-cadastro.

A cópia é repetível e usa o nome do arquivo para evitar duplicação. Uma falha isolada de leitura não cancela a venda: ela é registrada e os demais arquivos continuam. Em pré-cadastros já confirmados, use **Sincronizar com o contrato** para copiar arquivos ausentes ou restaurar um documento removido do contrato. O comando não funciona enquanto não houver contrato vinculado.

Imagens podem ser visualizadas na tela; PDFs usam o visualizador do navegador. Para outros formatos, faça o download.

## Alteração e exclusão

Inclusão e edição exigem, respectivamente, `pre_cadastros_add` e `pre_cadastros_edit`. A exclusão é lógica: o registro deixa de aparecer nas consultas normais, mas permanece armazenado para rastreabilidade.

Evite apagar um pré-cadastro confirmado. Ele mantém a referência que explica a origem do contrato, do serviço e dos documentos; apagar o pré-cadastro não desfaz essas entidades. Para corrigir uma contratação já criada, trate diretamente o contrato e o serviço conforme as regras desses módulos.

| Problema | Verificação |
|---|---|
| Confirmar cadastro não aparece | A situação precisa ser Pendente. |
| Confirmação é recusada | Informe filial, plano válido para a filial e dia de vencimento; revise também os campos obrigatórios do cadastro. |
| Documento já existe | O sistema reutiliza a pessoa existente; confirme se é o mesmo titular. |
| Anexo não chegou ao contrato | Execute **Sincronizar com o contrato** e verifique a mensagem de arquivos copiados, existentes ou com falha. |
| Registro não aparece na abertura da lista | O filtro inicial mostra apenas pendentes; selecione outra situação ou Todos. |
| Cancelamento não salva | Informe o motivo exigido pelo estágio Cancelado. |

![Lista de pré-cadastros](/assets/screenshots/cadastros/pre-cadastros.png)
