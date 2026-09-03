---
title: Impressão de carnês
published: true
editor: markdown
description: Filtre contas a receber em aberto, confira os boletos e controle sua marcação de impressão.
---

# Impressão de carnês

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.

Esta tela prepara boletos de mensalidades já geradas. Ela **não cria contas a receber** e não registra cobranças no banco: transforma os títulos em aberto no modelo de boleto da conta bancária ou incorpora o PDF fornecido pelo gateway.

O processamento agrupa itens pelo número do documento (`NRDOC`). Quando várias contas do mesmo contrato, banco e documento compõem uma cobrança, o boleto soma os valores e reúne as descrições, evitando imprimir o mesmo documento mais de uma vez.

## Fluxo recomendado

1. Informe o período de faturamento. Por padrão, a tela abre com o primeiro e o último dia do mês atual.
2. Aplique somente os filtros necessários.
3. Use **Exibir** para carregar a prévia sem alterar o controle de impressão.
4. Clique em **Imprimir** para abrir a impressão do navegador sobre o conteúdo exibido.
5. Depois de confirmar que a impressão ocorreu, clique em **Confirmar** e aceite a pergunta. O sistema recarrega o mesmo conjunto e incrementa o contador de impressão de suas contas.

**Confirmar** não imprime nem valida a impressora. Ele apenas marca os títulos encontrados como impressos. Não confirme antes de concluir a impressão física ou salvar o PDF.

## Filtros

| Campo | Efeito |
|---|---|
| **Filial** | Restringe os contratos à filial. |
| **Conta bancária** | Mantém somente títulos da conta escolhida. Também determina banco, carteira, instruções e modelo do boleto. |
| **Setor de rede / Rede** | Restringe os contratos pela estrutura de rede. A lista de redes é carregada após escolher o setor. |
| **Vencimento** | Filtra pelo dia de vencimento. A lista vem dos vencimentos permitidos na empresa. |
| **Imprimir** | Seleciona títulos **Não impressos**, **Impressos** ou **Todos**. O padrão é **Não impressos**. |
| **UF, Cidade, Bairro e Logradouro** | Filtram pelo endereço dos contratos. Os campos usam as pesquisas de endereço do sistema. |
| **Plano** | Restringe aos contratos associados ao plano selecionado. |
| **Faturamento** | Intervalo obrigatório usado para localizar contas em aberto. |
| **Contratos** | Quantidade de contratos processada na página: 2, 10, 50 ou 100. Não é quantidade de boletos. |
| **Página** | Página do conjunto de contratos; começa em 1. |

Filtros em branco não restringem a consulta. Para lotes grandes, percorra todas as páginas e confirme cada uma separadamente.

## Como o boleto é montado

- Apenas contas a receber **em aberto** entram nessa listagem.
- O valor é recalculado para a data efetiva usada pelo título, considerando as regras financeiras da conta bancária.
- O endereço de cobrança do contrato tem preferência; sem ele, usa-se o endereço principal.
- A conta bancária pode incluir o ponto de referência no endereço do boleto.
- Quando existe URL de boleto e a cobrança está configurada para imprimir PDF externo, a tela incorpora o arquivo do gateway.
- Nos demais casos, o LHISP renderiza o boleto com cedente, sacado, endereço, descrições e parâmetros da conta bancária.
- A quebra de página depende da quantidade de boletos por página configurada no meio de cobrança.

## Controle de impressão

O filtro **Impressos/Não impressos** usa o contador gravado em cada conta. A ação **Confirmar** incrementa esse contador para todos os componentes do documento exibido. Assim, um boleto confirmado deixa de aparecer no filtro padrão de não impressos.

Use **Todos** ou **Impressos** para localizar uma segunda via. Imprimir pelo navegador sem confirmar mantém o título como não impresso; confirmar sem imprimir produz o efeito oposto.

## Diagnóstico

| Situação | Verificação |
|---|---|
| Nenhum boleto aparece | Confirme datas válidas, situação em aberto, página, filial e o filtro **Imprimir**. |
| Há menos boletos que contas | Contas com o mesmo `NRDOC` são consolidadas em um documento. |
| Rede não aparece | Selecione primeiro o setor de rede. |
| Endereço ou cedente está incorreto | Revise os endereços do contrato e da conta bancária e os dados da filial. |
| Valor difere do valor nominal | Confira prorrogação, desconto, juros, multa e composição de contas do mesmo documento. |
| PDF externo não abre | Verifique a URL salva no título, a integração do gateway e o suporte do navegador a PDF incorporado. |
| Título sumiu de **Não impressos** sem impressão | Ele provavelmente foi confirmado; procure em **Impressos** ou **Todos**. |

Para criar mensalidades ausentes, use [Gerar carnês](/financeiro/gerar-carnes). Para inspecionar ou corrigir o título antes da impressão, use [Gerência financeira](/financeiro/gerencia-financeira).

![Tela Impressão de carnês](/assets/screenshots/financeiro/impressao-de-carnes.png)
