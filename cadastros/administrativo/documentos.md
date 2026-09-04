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

![Documentos no demo](/assets/screenshots/cadastros/administrativo/documentos.png)
