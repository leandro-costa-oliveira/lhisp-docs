---
title: Documentos
published: true
editor: markdown
description: Crie modelos versionados usados em contratos, aceite eletrônico, impressão e assinatura digital.
---

# Documentos

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.

Este cadastro mantém **modelos de documentos**, não arquivos já assinados por clientes. O texto do modelo é associado a planos e depois lançado na aba **Documentos** de cada contrato, onde passa a representar uma ocorrência própria para impressão, aceite ou assinatura.

Campos dinâmicos inseridos no texto são substituídos no momento da impressão com dados da empresa, do cliente, do endereço, do contrato e do serviço. Portanto, o resultado depende tanto da sintaxe do marcador quanto da qualidade dos cadastros de origem.

## Fluxo no sistema

1. Crie o modelo e valide sua pré-visualização.
2. Associe o modelo ao plano quando ele fizer parte da contratação daquele serviço.
3. Na aba **Documentos** do contrato, associe o modelo ao contrato e, quando aplicável, ao serviço contratado.
4. Imprima ou gere o PDF com os dados substituídos.
5. Conforme a configuração, colete aceite no portal/app ou envie o PDF à D4Sign.

Planos marcados para **Exigir aceite** impedem a criação do acesso até existir um documento vinculado ao serviço e seu aceite estar validado. O modelo, assim, participa diretamente da liberação técnica do cliente.

## Cadastrar e validar um modelo

1. Acesse **Cadastros > Administrativo > Documentos** e clique em **Novo**.
2. Informe uma **Descrição** única e reconhecível.
3. Escreva o **Texto** no editor e insira somente marcadores suportados pela tela.
4. Salve e use **Visualizar** para conferir conteúdo, substituições, quebras e paginação.
5. Teste com contrato fictício que possua todos os dados usados pelo documento.

Descrição e texto são obrigatórios. O sistema não permite duas descrições exatamente iguais entre os modelos ativos.

## Versionamento ao editar

Alterar um modelo não sobrescreve o registro anterior. O backend marca a versão atual como excluída e cria outro documento com novo ID. Os planos que apontavam para o modelo antigo são migrados para o novo ID.

Esse comportamento preserva os documentos já associados aos contratos, que continuam referenciando a versão usada naquela ocorrência. Consequências práticas:

- editar o modelo não reescreve automaticamente contratos ou PDFs anteriores;
- uma nova contratação usa a versão apontada pelo plano após a alteração;
- o novo ID deve ser considerado em integrações ou referências externas;
- para corrigir um documento já lançado, trate a ocorrência no contrato conforme o processo jurídico adotado.

## Documentos do contrato e assinatura

A associação no contrato registra uma ocorrência separada do modelo e pode guardar serviço, número, aceite, arquivo e estado D4Sign. Remover essa associação não apaga o modelo global. Se o documento estiver aguardando assinatura na D4Sign, a remoção também tenta cancelar o documento externo.

O envio à D4Sign gera um PDF A4 e exige ao menos um e-mail válido da pessoa. O aceite eletrônico pode armazenar comprovante próprio; aceitar ou rejeitar atualiza a ocorrência do contrato, não o texto-base.

## Cuidados

- Faça revisão jurídica antes de publicar nova versão.
- Não altere marcadores manualmente sem confirmar a sintaxe exibida pelo sistema.
- **Visualizar** o modelo não garante que todos os campos existam em todo contrato; teste cenários de pessoa física e jurídica quando aplicável.
- A exclusão do modelo é lógica: ele deixa de aparecer nas buscas usuais, mas versões já usadas podem permanecer referenciadas.
- Evite colocar credenciais, tokens ou dados pessoais fixos no texto do modelo.

## Campos dinâmicos (tags)

Esta seção lista as tags reconhecidas pelo motor de substituição do LHISP. A rotina central é `parseCamposDinamicos()`, aplicada a modelos de documento, boletos, notas fiscais, recibos, ordens de serviço, ordens de separação e mensagens de bloqueio/cobrança. Além dela, cada tela de impressão acrescenta um conjunto próprio de tags.

Regras gerais:

- A substituição é **literal e sem distinção de maiúsculas/minúsculas** na maior parte dos casos (`#CLIENTE#` e `#cliente#` funcionam igual). Algumas tags de telas específicas usam substituição sensível a maiúsculas — escreva sempre em caixa alta.
- Existem **três sintaxes** convivendo: `#TAG#` (padrão do LHISP), `{TAG}` e `<tag>` (formatos legados, oriundos de importação de outros sistemas). Prefira sempre `#TAG#` em modelos novos.
- Tag **não reconhecida no contexto permanece no texto final**, visível para o cliente. Sempre pré-visualize o modelo antes de publicar.
- Tags cujo dado de origem não existe são substituídas por **texto vazio**, e não por um aviso.
- Uma tag só é substituída se o contexto de impressão fornecer o objeto correspondente (empresa, contrato, pessoa, endereço, conta, nota fiscal etc.). Tags de boleto não funcionam em documento de contrato e vice-versa.

### Gerais e de formatação

Disponíveis em todos os contextos que passam por `parseCamposDinamicos()`.

| Tag | Conteúdo |
|---|---|
| `#DATA#` | Data atual do sistema |
| `#DATAHORA#` | Data e hora atuais do sistema |
| `#DIA#` | Dia atual (2 dígitos) |
| `#MES#` | Mês atual (2 dígitos) |
| `#ANO#` | Ano atual (4 dígitos) |
| `#MES_EXTENSO#` | Mês atual por extenso |
| `#NL#` | Quebra de linha (`<br/>`) |
| `#NOVALINHA#` | Quebra de linha (`<br/>`) |
| `#NOVAPAGINA#` | Quebra de página na geração do PDF |

Equivalentes legados: `{DIA_HOJE}`, `{MES_EXTENSO}`, `{ANO_ATUAL}`, `<date_now>`.

### Empresa / filial

Quando o contrato pertence a uma filial e a filial tem o dado preenchido, o valor da **filial** prevalece sobre o da empresa.

| Tag | Conteúdo |
|---|---|
| `#EMPRESA#` | Razão social (filial, se houver) |
| `#EMPRESA_RAZAOSOCIAL#` | Razão social (filial, se houver) |
| `#EMPRESA_CNPJ#` | CNPJ (filial, se houver) |
| `#EMPRESA_INSC#` | Inscrição estadual |
| `#EMPRESA_ENDERECO#` | Endereço completo formatado |
| `#EMPRESA_LOGRADOURO#` | Logradouro |
| `#EMPRESA_NUMERO#` | Número |
| `#EMPRESA_BAIRRO#` | Bairro |
| `#EMPRESA_CIDADE#` | Cidade |
| `#EMPRESA_UF#` | UF |
| `#EMPRESA_CEP#` | CEP |
| `#EMPRESA_TELEFONE1#` | Telefone principal |
| `#EMPRESA_TELEFONE2#` | Telefone secundário |
| `#EMPRESA_EMAIL#` | E-mail |
| `#EMPRESA_SITE#` | Site |
| `#EMPRESA_SLOGAN#` | Slogan |
| `#EMPRESA_ESLOGAM#` | Slogan (grafia antiga, mesmo valor) |
| `#LOGO#` | Logomarca como imagem pronta (`<img>`, 250 px) |
| `#LOGOURL#` | Apenas a URL da logomarca |

Equivalentes legados: `{PROVEDOR_NOME}`, `{PROVEDOR_CNPJ}`, `{PROVEDOR_ENDERECO}`, `{PROVEDOR_NUMERO}`, `{PROVEDOR_BAIRRO}`, `{PROVEDOR_CIDADE}`, `{PROVEDOR_ESTADO}`, `{PROVEDOR_ESTADO_EXTENSO}`, `{PROVEDOR_CEP}`, `{PROVEDOR_TELEFONE}`, `{PROVEDOR_TELEFONE1}`, `{PROVEDOR_TELEFONE2}`, `{PROVEDOR_WEBSITE}`, `<company>`, `<company_addr>`, `<company_city>`, `<company_state>`, `<company_cnpj>`, `<company_phone1>`, `<company_phone2>`.

`{PROVEDOR_ESTADO_EXTENSO}` devolve o nome do estado por extenso e em caixa alta (`RIO GRANDE DO SUL`), acompanhando o padrão dos demais campos de endereço, que o sistema grava em maiúsculas. Sigla desconhecida é reproduzida como está.

> **⚠️ Atenção** Até a correção aplicada em setembro de 2026, essa tag devolvia a **sigla** da UF, e não o nome do estado.

### Cliente (pessoa)

| Tag | Conteúdo |
|---|---|
| `#CLIENTE#` | Nome completo |
| `#NOME#` | Nome completo (sinônimo de `#CLIENTE#`) |
| `#PRIMEIRO_NOME#` | Primeiro nome |
| `#CONHECIDOPOR#` | Apelido / nome fantasia |
| `#CLIENTE_ID#` | ID interno da pessoa |
| `#DOC1#` | CPF ou CNPJ |
| `#DOC2#` | RG ou inscrição estadual |
| `#TIPOPESSOA#` | Rótulo `CPF` ou `CNPJ` conforme física/jurídica |
| `#TIPODOCUMENTO#` | Mesmo valor de `#TIPOPESSOA#` |
| `#TELEFONE1#` | Telefone 1 |
| `#TELEFONE2#` | Telefone 2 |
| `#TELEFONE3#` | Telefone 3 |
| `#TELEFONE4#` | Telefone 4 |
| `#EMAIL#` | E-mail |
| `#NOMEMAE#` | Nome da mãe |
| `#NOMEPAI#` | Nome do pai |
| `#NATURALIDADE#` | Naturalidade |
| `#DATANASCIMENTO#` | Data de nascimento |

Equivalentes legados: `{CLIENTE_NOME}`, `{CLIENTE_CPF/CNPJ}`, `{CLIENTE_RG/IE}`, `{CLIENTE_TELEFONE_RESIDENCIAL}`, `{CLIENTE_TELEFONE_CELULAR}`, `<client_name>`, `<client_cpf_cnpj>`, `<client_ident>`.

> **⚠️ Atenção** `#TIPOPESSOA#` e `#TIPODOCUMENTO#` devolvem apenas o rótulo do documento (`CPF`/`CNPJ`), não o valor. O número está em `#DOC1#`.

### Endereço de instalação

| Tag | Conteúdo |
|---|---|
| `#ENDERECO#` | Endereço completo formatado, com condomínio e complemento |
| `#LOGRADOURO#` | Logradouro |
| `#NUMERO#` | Número |
| `#BAIRRO#` | Bairro |
| `#CIDADE#` | Cidade |
| `#UF#` | UF |
| `#CEP#` | CEP |
| `#PONTODEREFERENCIA#` | Ponto de referência do contrato |
| `#CLIENTE_COMPLEMENTO#` | Complemento do contrato |

Equivalentes legados: `{CLIENTE_ENDERECO}`, `{CLIENTE_NUMERO}`, `{CLIENTE_BAIRRO}`, `{CLIENTE_CIDADE}`, `{CLIENTE_ESTADO}`, `{CLIENTE_CEP}`, `{CLIENTE_COMPLEMENTO}`, `<client_addr>`.

### Endereço de cobrança

Se o cliente não tiver endereço de cobrança separado, estas tags usam o endereço de instalação.

| Tag | Conteúdo |
|---|---|
| `#ENDERECOCOBRANCA#` | Endereço de cobrança formatado |
| `#LOGRADOUROCOBRANCA#` | Logradouro de cobrança |
| `#NUMEROCOBRANCA#` | Número de cobrança |
| `#BAIRROCOBRANCA#` | Bairro de cobrança |
| `#CIDADECOBRANCA#` | Cidade de cobrança |
| `#UFCOBRANCA#` | UF de cobrança |
| `#CEPCOBRANCA#` | CEP de cobrança |
| `#PONTODEREFERENCIACOBRANCA#` | Ponto de referência (mesmo valor de `#PONTODEREFERENCIA#`) |

### Contrato

| Tag | Conteúdo |
|---|---|
| `#CONTRATO#` | Número do contrato |
| `#CONTRATACAO#` | Data de cadastro do contrato |
| `#CONTRATACAO_EX#` | Data de cadastro por extenso |

Equivalente legado: `{CONTRATO_NUMERO}`, `<date_active>`.

### Documento do contrato

Só funcionam na impressão de documentos do contrato (**Contratos > aba Documentos**) e na pré-visualização do modelo.

| Tag | Conteúdo |
|---|---|
| `#NUMERO_DOCUMENTO#` | Número do documento; se vazio, a ordem do documento dentro do contrato |
| `#DATA_DOCUMENTO#` | Data do documento |
| `#DATAHORA_DOCUMENTO#` | Data e hora do documento |
| `#DATA_CONTRATO#` | Mesmo valor de `#DATA_DOCUMENTO#` |
| `#DATAHORA_CONTRATO#` | Mesmo valor de `#DATAHORA_DOCUMENTO#` |
| `#DATAACEITE_EXTENSO#` | Data do aceite por extenso; se não houver aceite, a data atual |
| `#SERVICOSCONTRATADOS#` | Tabela HTML dos serviços contratados |
| `#PRODUTOSLOCADOS#` | Tabela HTML dos produtos locados |
| `#TABELA_SVA_PLANO#` | Tabela HTML dos SVAs dos planos contratados |
| `#DATA_VENCIMENTO_EM_ABERTO#` | Vencimento da primeira conta em aberto do contrato |

Equivalentes legados: `{CONTRATO_ITENS}`, `<client_table_service>`.

> **⚠️ Atenção** `#DATA_VENCIMENTO_EM_ABERTO#` depende de existir conta em aberto. Em contrato sem pendências a impressão pode falhar; evite essa tag em modelos de uso geral.

### Serviço contratado

Disponíveis na impressão de documento do contrato. Existem na forma simples e na forma **numerada**, para modelos que listam vários serviços — o índice começa em `1` e segue a ordem dos serviços ativos do contrato.

| Tag | Conteúdo |
|---|---|
| `#DATAATIVACAO#` | Data de ativação do serviço |
| `#DATAATIVACAO_EXTENSO#` | Data de ativação por extenso |
| `#DIA_ATIVACAO#` | Dia da ativação |
| `#MES_ATIVACAO#` | Mês da ativação |
| `#ANO_ATIVACAO#` | Ano da ativação |
| `#DATAATIVACAO1#`, `#DATAATIVACAO2#`, … | Data de ativação do n-ésimo serviço |
| `#DATA_ATIVACAO_SERVICO1#`, `…2#`, … | Data de ativação do n-ésimo serviço |
| `#DESCRICAO_SERVICO1#`, `…2#`, … | Descrição do n-ésimo serviço |
| `#VALOR_SERVICO1#`, `…2#`, … | Valor do n-ésimo serviço |
| `#VENCIMENTO_SERVICO1#`, `…2#`, … | Dia de vencimento do n-ésimo serviço |

Quando nenhum serviço é encontrado, `#DATAATIVACAO#` e `#DATAATIVACAO_EXTENSO#` caem para a data de cadastro do contrato.

### Acesso (conexão)

Na forma simples assumem os dados do **último** acesso processado; na forma numerada, o n-ésimo acesso, com índice começando em `1`.

| Tag | Conteúdo |
|---|---|
| `#USUARIO#` / `#USUARIO1#`, `…2#` | Login do acesso |
| `#MAC#` / `#MAC1#`, `…2#` | Endereço MAC |
| `#IPV4#` / `#IPV41#`, `…2#` | IP IPv4 |
| `#IPV6#` / `#IPV61#`, `…2#` | Prefixo IPv6 delegado |
| `#DOWNLOAD#` / `#DOWNLOAD1#`, `…2#` | Velocidade de download em kbps |
| `#DOWNLOADM#` / `#DOWNLOADM1#`, `…2#` | Velocidade de download em Mbps |
| `#UPLOAD#` / `#UPLOAD1#`, `…2#` | Velocidade de upload em kbps |
| `#UPLOADM#` / `#UPLOADM1#`, `…2#` | Velocidade de upload em Mbps |

### Boleto

Disponíveis apenas no modelo de boleto.

| Tag | Conteúdo |
|---|---|
| `#TITULAR#` | Cedente / beneficiário |
| `#ENDERECO_TITULAR#` | Reservado; hoje sempre vazio |
| `#LOCALDEPAGAMENTO#` | Local de pagamento da conta bancária |
| `#AGENCIA#` | Agência |
| `#CONTA#` | Conta |
| `#CONVENIO#` | Convênio |
| `#DIV_AGENCIA_CONVENIO#` | Separador entre agência e convênio (padrão `/`) |
| `#CARTEIRA#` | Carteira |
| `#CODIGOBANCO#` | Código do banco |
| `#LOGOBANCO#` | Logotipo do banco (`<img>`) |
| `#LOGOEMPRESA#` | Logomarca do cedente (`<img>`) |
| `#URL_LOGOEMPRESA#` | URL da logomarca do cedente |
| `#NOSSONUMERO#` | Nosso número |
| `#NUMERODOCUMENTO#` | Número do documento da conta |
| `#ESPECIEDOC#` | Espécie do documento |
| `#ACEITE#` | Aceite; fixo em `N` |
| `#VENCIMENTO#` | Vencimento da conta |
| `#DATADOC#` | Data do documento |
| `#DATAPROC#` | Data de processamento |
| `#VALOR#` | Valor do título |
| `#SIMBOLOMOEDA#` | Símbolo da moeda |
| `#ABATIMENTO#` | Valor de abatimento |
| `#CODIGOBARRAS#` | Código de barras |
| `#LINHADIGITAVEL#` | Linha digitável |
| `#BLOCKCODEBAR#` | Imagem do código de barras |
| `#QRCODE_PIXCOBRANCA#` | QR Code Pix da cobrança |
| `#DOC#` | Documento do sacado, já rotulado (`CPF:` ou `CNPJ:`) |
| `#TABLESERVICOS#` | Tabela HTML dos serviços da conta |
| `#MSG_MULTA_JUROS#` | Texto automático de multa e juros |
| `#OBSERVACAO1#` | Descrição da conta |
| `#OBSERVACAO2#` a `#OBSERVACAO4#` | Observações 1 a 3 da conta bancária |
| `#OBSERVACAO5#` | Descrição complementar |
| `#PAGEBREAK#` | CSS de quebra de página entre vias |
| `#BORDERBOTTOM#` | CSS da linha de corte entre vias |

No boleto, as tags de endereço (`#ENDERECO#`, `#LOGRADOURO#`, `#NUMERO#`, `#BAIRRO#`, `#CIDADE#`, `#UF#`, `#PONTODEREFERENCIA#`) referem-se ao **sacado**.

### Nota fiscal

| Tag | Conteúdo |
|---|---|
| `#NOTAFISCAL_NRSERIE#` | Número e série formatados |
| `#NOTAFISCAL_SERIE#` | Série (padrão `001`) |
| `#NOTAFISCAL_EMISSAO#` | Data de emissão |
| `#NOTAFISCAL_VENCIMENTO#` | Vencimento |
| `#NOTAFISCAL_MES#` | Mês de competência |
| `#NOTAFISCAL_ANO#` | Ano de competência |
| `#NOTAFISCAL_CFOP#` | CFOP |
| `#NOTAFISCAL_CNPJ#` | CNPJ do emitente na nota |
| `#NOTAFISCAL_RAZAO_SOCIAL#` | Razão social do emitente na nota |
| `#NOTAFISCAL_INSC#` | Inscrição estadual do emitente |
| `#NOTAFISCAL_TOTAL#` | Valor total |
| `#NOTAFISCAL_BASECALCULO#` | Base de cálculo |
| `#NOTAFISCAL_VALORBASEDECALCULO#` | Valor da base de cálculo |
| `#NOTAFISCAL_ALIQUOTA#` | Alíquota |
| `#NOTAFISCAL_VALORALIQUOTA#` | Valor da alíquota |
| `#NOTAFISCAL_AUTHDIGIT#` | Dígito autenticador |
| `#NOTAFISCAL_OBSERVACAO#` | Observação da nota |
| `#NOTAFISCAL_OBSERVACAO_SVA#` | Observação referente a SVAs |
| `#NOTAFISCAL_INFORMACAO_ADICIONAL#` | Informações adicionais |
| `#NOTAFISCAL_SERVICOS#` | Tabela HTML dos serviços |
| `#NOTAFISCAL_ITENS#` | Tabela HTML dos itens |
| `#NOTAFISCAL_TRIBUTOS#` | Bloco de tributos |
| `#NOTAFISCAL_MENSAGEM_FISCAL#` | Mensagem fiscal |
| `#NOTAFISCAL_CHAVE_ACESSO#` | Chave de acesso formatada (NFCom) |
| `#NOTAFISCAL_PROTOCOLO#` | Protocolo de autorização |
| `#NOTAFISCAL_URL_CONSULTA#` | URL de consulta pública da NFCom |
| `#NOTAFISCAL_QR_CODE#` | QR Code da NFCom |
| `#NF_ENDERECO#` | Endereço registrado na nota |
| `#NFLOGOURL#` | URL da logomarca usada na nota |
| `#FATURA#` | Número do documento da fatura |
| `#PERIODO_FATURAMENTO#` | Período de faturamento |
| `#MENSAGEM_FUSTEL#` | Mensagem do FUST/FUNTTEL |
| `#CANCELADO#` | Selo "CANCELADA" sobre a nota; vazio se ativa |

### Recibo

| Tag | Conteúdo |
|---|---|
| `#VENCIMENTO#` | Vencimento, ou prorrogação quando houver |
| `#REFERENTE#` | Descrição da conta |
| `#VALOR#` | Valor pago ou valor a pagar |
| `#VALOREXT#` | Mesmo valor de `#VALOR#` |
| `#NRDOC#` | Número do documento |
| `#VIA#` | Identificação da via impressa |

> **⚠️ Atenção** `#VALOREXT#` recebe o valor numérico formatado, e não o valor por extenso.

### Ordem de serviço

| Tag | Conteúdo |
|---|---|
| `#PROTOCOLO#` | Protocolo do atendimento |
| `#OS_NUMERO#` | Número da OS |
| `#OS_ABERTURA#` | Data de abertura |
| `#OS_AGENDAMENTO#` | Data e período do agendamento |
| `#OS_TECNICO#` | Técnico responsável |
| `#OS_MONTADOR#` | Montador |
| `#OS_VEICULO#` | Veículo (fabricante, modelo, placa, descrição) |
| `#OS_DESCRICAO#` | Descrição da OS |
| `#OS_PRODUTOS#` | Produtos da OS |
| `#TABLEACESSOS#` | Tabela HTML dos acessos do contrato |

### Ordem de separação (estoque)

| Tag | Conteúdo |
|---|---|
| `#TITULO_ORDEM_SEPARACAO#` | Título conforme o tipo (separação ou transferência) |
| `#ALMOXARIFADO#` | Almoxarifado de origem |
| `#ALMOXARIFE#` | Usuário responsável pela separação |
| `#TIPO_RESPONSAVEL#` | Rótulo do responsável conforme o tipo |
| `#RESPONSAVEL#` | Técnico, ou almoxarifado de destino em transferências |
| `#VEICULO#` | Veículo |
| `#ITEMS#` | Tabela HTML dos itens |
| `#SOMA_QTD#` | Soma das quantidades |
| `#TOTAL#` | Valor total |

### Notificações e mensagens

Mensagens de cobrança, de bloqueio e de envio de boleto por e-mail aceitam todas as tags de empresa, cliente, endereço e contrato. As notificações automáticas de cobrança acrescentam:

| Tag | Conteúdo |
|---|---|
| `#VENCIMENTO#` | Vencimento da conta |
| `#NRDOC#` | Número do documento da conta |
| `#CODIGODEBARRAS#` | Código de barras do boleto |
| `#CODIGODEBARRRAS#` | Código de barras (grafia legada com três letras R; mesmo valor) |
| `#QRCODEPIX#` | Link do QR Code Pix da cobrança |

> **⚠️ Atenção** Até a correção aplicada em setembro de 2026, o sistema lia o código de barras de um campo inexistente e a tag era sempre substituída por texto vazio. Mensagens antigas com `#CODIGODEBARRRAS#` continuam funcionando, mas prefira `#CODIGODEBARRAS#` em textos novos.

### Envio de comandos a equipamentos

Na ferramenta de envio de comandos em massa (**Rede/Infra > Ferramentas**), o texto do comando aceita tags próprias, resolvidas por servidor:

| Tag | Conteúdo |
|---|---|
| `#ID#` | ID do servidor |
| `#EMPRESA_ID#` | ID da empresa do servidor |
| `#IP#` | IP do servidor |
| `#NOME#` | Nome do servidor |

![Documentos no demo](/assets/screenshots/cadastros/administrativo/documentos.png)
