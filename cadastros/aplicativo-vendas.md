---
title: Aplicativo de vendas
description: Acesso do vendedor, pré-vendas B2B/B2C, documentos, acompanhamento e confirmação pelo painel.
published: true
editor: markdown
---

# Aplicativo de vendas

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.

O aplicativo de vendas é a interface do vendedor, publicada em `/vendas` conforme a configuração do provedor. Ele registra **pré-vendas**; a confirmação de plano, filial, vencimento e condições comerciais acontece no [pré-cadastro do painel](/cadastros/pre-cadastros).

## Acesso

O cadastro da pessoa precisa estar marcado como vendedor e possuir senha de vendedor. O login usa o CPF formatado pela tela e essa senha específica; não utiliza a senha de um usuário administrativo. O backend emite sessão com duração de 12 horas.

A sessão é preservada no navegador. **Sair** remove a credencial local; uma resposta 403 também retorna o aplicativo ao estado sem autenticação. Use a instalação do provedor correto, que define o contexto de empresa.

## Registrar uma pré-venda

1. No dashboard, clique em **+**.
2. Escolha o segmento **B2C** ou **B2B** e informe o documento do cliente.
3. Confira os dados eventualmente encontrados e preencha identificação e contatos.
4. Preencha endereço, número e demais informações da instalação.
5. Adicione os arquivos dos documentos e comprovante de endereço.
6. Envie e aguarde **Pré-Venda Realizada com Sucesso**.
7. Confira o registro no dashboard e encaminhe a confirmação ao responsável pelo painel.

O segmento começa como B2C e é independente da escolha do documento do titular. CPF/CNPJ identifica a pessoa; B2B/B2C classifica a oportunidade.

A consulta pelo documento pode preencher dados existentes. Confira os campos antes de avançar: não interprete o preenchimento como autorização para substituir automaticamente todos os dados do titular no cadastro principal.

## Anexos

A tela aceita JPEG, PNG e PDF. Documento principal e comprovante de endereço são obrigatórios; o segundo documento é opcional no formulário. Os arquivos selecionados precisam ser diferentes. O envio usa os anexos junto com os dados da pré-venda; sair ou recarregar a página antes do envio pode perder o formulário.

Depois da confirmação pelo painel, os anexos podem ser sincronizados com os documentos do contrato. Consulte o guia de [Pré-cadastros](/cadastros/pre-cadastros) para reenvio de anexos faltantes e falha parcial no faturamento da instalação.

## Acompanhar

O dashboard consulta os pré-cadastros vinculados ao vendedor autenticado e mostra identificador, contrato, pessoa, telefone, segmento, estágio, situação do pré-cadastro e situação do contrato.

**Estágio** e **situação** são campos distintos. Uma oportunidade pode estar em orçamento e continuar pendente. Confirmado indica avanço do pré-cadastro no painel; não comprova que o acesso foi provisionado ou a instalação executada.

A tela carrega a lista ao entrar, sem atualização periódica configurada nesse componente. Se o painel mudou o registro, reabra/recarregue a consulta. Não há fluxo de confirmação da venda nem escolha de condições financeiras nessa interface do vendedor.

## Problemas comuns

| Sintoma | Conferência |
|---|---|
| Vendedor não encontrado | CPF e empresa da instalação. |
| Vendedor inválido/acesso negado | Marcação de vendedor e senha própria no cadastro da pessoa. |
| Selecione arquivos diferentes | Documento e comprovante não podem repetir o mesmo conteúdo selecionado. |
| Pré-venda não aparece | Sessão do vendedor, retorno do envio e atualização da lista. |
| Contrato ainda não existe | A pré-venda precisa ser confirmada pelo fluxo do painel. |

Não foi identificada uma fila offline de envio neste aplicativo. Em erro de rede, confira se o pré-cadastro já foi criado antes de reenviar. Veja também [Dashboard comercial](/dashboards/dashboard-comercial).
