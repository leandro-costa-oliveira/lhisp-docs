---
title: Notas Fiscais
published: true
editor: markdown
description: ''
---

# Notas Fiscais

## Objetivo

Consultar, emitir e administrar notas fiscais, incluindo NFCom, arquivos fiscais, lotes RPS e exportações.

## Pré-requisitos

- Estar autenticado no LHISP.
- Ter permissão para acessar **Financeiro > Notas Fiscais**.
- Ter grupo empresarial e filial configurados.
- Para emissão ou cancelamento, possuir as permissões específicas da operação.

## Passo a passo

1. Acesse **Financeiro > Notas Fiscais**.
2. Selecione **Filial**, **Mês**, **Ano** e **Situação NFCom**.
3. Se necessário, abra **Mais filtros** e informe grupo, plano, séries, situação da nota ou fatura, tipo, finalidade, período de geração, ordenação e quantidade por página.
4. Clique no botão de pesquisa para aplicar os filtros.
5. Confira os cartões **Notas normais**, **NFCom por cClass** e **Canceladas**.
6. Abra as ações de uma nota ou marque linhas para imprimir, enviar por e-mail ou cancelar, conforme as permissões.

## Filtros

| Campo | Descrição |
|---|---|
| **Filial** | Filtra a filial emissora. |
| **Mês / Ano** | Define a referência da consulta. |
| **Situação NFCom** | Todas, pendente, transmitida, substituída ou com erro. |
| **Grupo** | Grupo de CNPJ usado na consulta; o primeiro grupo disponível é selecionado inicialmente. |
| **Plano** | Restringe as notas ao plano informado. |
| **Série inicial / final** | Define a faixa do número de série. |
| **Situação da nota** | Todas, normal ou cancelada. |
| **Situação da fatura** | Todas, pagas ou em aberto. |
| **Tipo da NF / Finalidade** | Restringe o tipo fiscal e a finalidade NFCom. |
| **Data de geração** | Intervalo adicional de criação das notas. |
| **Ordenação** | Crescente ou decrescente. |
| **Resultados/página** | De 10 a 5.000 registros. |

## Ações

- **Emitir** abre o emissor legado em nova página.
- **Baixar arquivos** oferece arquivos fiscais e o pacote de XMLs NFCom; as opções dependem da configuração e do período.
- **Lotes RPS**, **Imprimir**, **Baixar planilha** e **Unificar XML** abrem os respectivos fluxos.
- O botão final da barra abre a tela legada de notas fiscais.
- Por nota, podem aparecer detalhes, log de integração, reenvio, DANFE na SEFAZ e download do XML.
- Para notas selecionadas, a barra inferior oferece impressão, envio por e-mail e cancelamento. O cancelamento exige motivo com ao menos 15 caracteres e pode desassociar a conta a receber.

## Listagem

A tabela apresenta **Ações**, **Gerado por**, **Contrato**, **Cliente**, **Emissão**, **Referência**, **CFOP**, **Número**, **Tipo**, **Finalidade**, **Valor**, **Fatura**, **Baixa** e **Situação**. O rodapé mostra a quantidade de notas e o valor selecionado.

## Problemas comuns

| Problema | Como tratar |
|---|---|
| Pesquisa não é executada | Verifique se existe um grupo de CNPJ disponível. |
| Nenhuma nota encontrada | Revise filial, referência, situação NFCom e os filtros adicionais. |
| Ação não aparece | Confirme a situação/tipo da nota e a permissão do usuário. |
| Cancelamento bloqueado | Informe um motivo com pelo menos 15 caracteres e confirme a permissão `notafiscal_cancel`. |

## Validação

- Tela e rota atuais validadas no staging: `/financeiro/notafiscal`.
- Os filtros, cartões, colunas e ações foram confrontados com `lhisp-frontend/src/paginas/financeiro/notafiscal/NotasFiscais.tsx`.
- O menu **Importar Xml NFCom** aponta atualmente para uma rota legada sem o arquivo JavaScript correspondente. A tela implementada está disponível em `/financeiro/notafiscal/importar_nfcom_xml`.

## Captura de tela

![Notas Fiscais](/assets/screenshots/financeiro/notas-fiscais.png)

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.
