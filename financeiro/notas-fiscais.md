---
title: Notas fiscais
published: true
editor: markdown
description: Consulte, transmita, exporte, imprima e cancele documentos fiscais vinculados aos contratos e cobranças.
---

# Notas fiscais

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.

Esta área centraliza documentos fiscais gerados pelo LHISP: comunicação modelo 21, SVA, locação, serviço, venda, multas, NFCom modelo 62 e provimento. A tela principal é de consulta e operação; a geração continua no emissor legado aberto pelo botão **Emitir**.

Uma nota registra a competência, o emitente, o destinatário, os itens, os valores fiscais e, quando aplicável, sua conta a receber. Para NFCom, o registro local também acompanha a transmissão ao LHNFE/SEFAZ por status, chave, XML assinado e logs.

## Consultar

1. Selecione **Filial**, **Mês**, **Ano** e **Situação NFCom**.
2. Abra **Mais filtros** para limitar grupo de CNPJ, plano, série, situação da nota, situação da fatura, tipo, finalidade NFCom ou data de geração.
3. Clique na lupa. Alterar campos sem aplicar a pesquisa não muda a tabela.
4. Confira os cartões de notas normais, NFCom por cClass e canceladas.
5. Use paginação e quantidade por página para navegar; a seleção de linhas é limpa quando a página consultada muda.

O **Grupo** é obrigatório e representa o CNPJ emissor. O primeiro grupo disponível é aplicado inicialmente. Sem grupo cadastrado, a consulta não é habilitada.

## Filtros e referências

| Campo | Uso |
|---|---|
| **Mês / Ano** | Competência fiscal da nota; não é necessariamente sua data de criação ou pagamento. |
| **Situação NFCom** | Pendente, transmitida, substituída ou erro de integração. Aplica-se ao modelo 62. |
| **Série inicial / final** | Faixa do número fiscal. Para NFCom, o número é extraído da chave autorizada. |
| **Situação da nota** | Separa documentos normais e cancelados no LHISP. |
| **Situação da fatura** | Filtra pela conta associada: paga ou em aberto. |
| **Tipo da NF** | Restringe o modelo/natureza do documento. |
| **Finalidade** | Normal, substituição ou ajuste de débito para NFCom. |
| **Geração** | Intervalo da criação do registro, distinto da competência e emissão. |

Os cartões são totalizadores do conjunto filtrado, não apenas da página visível. O resumo NFCom detalha valores pelos códigos cClass presentes nos itens.

## Emitir

O botão **Emitir** abre o processamento legado. Ele exige a configuração de emissão fiscal da empresa e permite duas origens:

- **Boletos pagos**: usa cobranças liquidadas e pode restringir conta bancária, tipo de baixa, plano, pessoa e inclusão de baixas manuais.
- **Serviços contratados**: usa os serviços do contrato e pode limitar aos marcados para gerar nota fiscal.

Sempre execute **Visualizar** antes de **Gerar**. Revise competência, grupo de CNPJ, valor máximo aproximado, origem, tipo de pessoa, banco e plano. Para usuários sem administração de filial, o backend força a competência atual.

A nota não pode ter valor zero. A emissão também depende de endereço válido do cliente/contrato, dados fiscais da empresa e dos planos, CFOP e demais parâmetros do tipo escolhido. Notas que não são NFCom devem manter data de emissão na competência informada; o sistema evita emissão retroativa anterior à última nota do mesmo grupo/tipo.

## Ações por nota

- **Cancelar**: disponível com `notafiscal_cancel` para notas ainda não canceladas.
- **Logs de integração**: NFCom; mostra a resposta acumulada da transmissão/cancelamento.
- **Tentar reenviar**: NFCom pendente ou com erro, com permissão `notafiscal_add`.
- **DANFE na SEFAZ**: NFCom transmitida com chave.
- **Imprimir**: abre a representação do documento pelo backend legado.
- **Detalhes**: autoria, criação, integração e dados de cancelamento.
- **Enviar por e-mail**: usa os dados de envio fiscal cadastrados para o cliente.
- **Baixar XML**: baixa o XML assinado armazenado para NFCom.

Na barra inferior, imprimir, enviar e cancelar atuam somente nas notas marcadas na página atual. O cancelamento em lote é sequencial: pode haver sucessos e falhas no mesmo processamento; o resumo final identifica cada falha.

## Cancelar com segurança

1. Selecione a nota e clique em **Cancelar**.
2. Informe motivo específico com pelo menos 15 caracteres.
3. Em cancelamento individual, decida se deseja **Liberar a Conta a Receber para permitir outra Nota Fiscal**. A opção inicia marcada.
4. Confirme e aguarde a atualização da tela.

O cancelamento fiscal é irreversível no fluxo comum. O LHISP marca a nota como cancelada, registra usuário, data e motivo e, para NFCom com chave, solicita o cancelamento à integração. Liberar a conta remove o vínculo inverso da conta para que outra nota possa ser emitida. Sem essa liberação, a conta continua bloqueada para nova emissão.

Em cancelamento de várias notas, a interface não apresenta a opção: todas são enviadas com liberação da conta habilitada. Revise esse efeito antes de confirmar.

## NFCom: estados operacionais

| Estado | Significado / ação |
|---|---|
| **Pendente** | Registro local ainda não autorizado. Pode ser reenviado. |
| **Transmitida** | Integração registrou sucesso e deve existir chave/XML. Não pode ser reenviada como emissão. |
| **Substituída** | Documento foi sucedido por NFCom de substituição. |
| **Erro** | A integração falhou. Abra os logs, corrija cadastro/configuração e só então reenvie. |

O botão DANFE monta atualmente a consulta do portal com ambiente de produção (`tpAmb=1`). Para documentos de homologação, use o XML/log ou o ambiente apropriado do portal se o atalho não localizar a chave.

## Arquivos e obrigações acessórias

- **XMLs NFCom (ZIP)** divide grandes competências em lotes, por padrão de até mil documentos.
- **Arquivo Mestre, Itens e Dados** gera os arquivos normais ou de substituição do leiaute fiscal configurado.
- **Lotes RPS** agrupa documentos de ISS, SVA ou locação e gera o XML correspondente.
- **Clientes — Prefeitura de Fortaleza** produz o arquivo específico disponível no sistema.
- **Baixar planilha** exporta CSV da competência e filtros principais.
- **Unificar XML** combina os arquivos aceitos pelo fluxo próprio.

Valide arquivos no programa fiscal pertinente antes de transmitir. Download não equivale a entrega ao fisco.

## Diagnóstico

| Situação | Verificação |
|---|---|
| Pesquisa desabilitada | Não existe grupo de CNPJ ou o grupo ainda não foi carregado. |
| Nota não aparece | Revise competência, grupo, filial, situação, tipo e data de geração. |
| Emissão não abre | Confira pop-ups, permissão e configuração `emissaoNotasFiscais` da empresa. |
| NFCom em erro | Abra **Logs de integração**; confira certificado, token da filial/matriz, ambiente, cadastro fiscal, cClass e endereço. |
| Reenvio não aparece | A nota precisa ser NFCom pendente/erro e o usuário precisa de `notafiscal_add`. |
| Nova nota não pode usar a conta | A nota cancelada pode ter mantido o vínculo da conta a receber. |
| E-mail não chega | Verifique destinatário, configuração de e-mail e log do serviço; a ação para em erro se uma nota do lote não existir. |

Para preparar a integração modelo 62, consulte [Configurar emissão de NFCom no LHNFE](/financeiro/nf-com).

![Tela Notas fiscais](/assets/screenshots/financeiro/notas-fiscais.png)
