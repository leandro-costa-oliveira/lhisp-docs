---
title: Relatório de Usuários Voip
published: true
editor: markdown
description: Relação de usuários ou números VoIP vinculados aos contratos, com filtro de filial.
---

# Relatório de Usuários Voip

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.

A tela `/relatorios/voip` tem o título **Relatório de Clientes com Números VoIP**. Lista os registros de `ContratoVoip`, seus contratos e pessoas, apresentando o campo de **usuário** como **Número**.

## Consultar

1. Selecione **Filial**, ou deixe sem seleção para consultar o escopo disponível.
2. Aguarde a atualização.
3. Confira **Contrato**, **Cliente** e **Número**.
4. Clique em **Imprimir**.

Não há período, filtro de servidor VoIP nem seletor de situação nessa tela. A consulta não exige explicitamente serviço ativo ou registro provisionado; não use a lista como inventário certificado de ramais ativos no servidor externo. Registros excluídos logicamente seguem o comportamento padrão do modelo.

Uma linha corresponde a um cadastro VoIP, não necessariamente a um cliente único. Um contrato pode aparecer várias vezes quando possui mais de um usuário/número. O rodapé conta registros retornados. O campo exibido pode conter o identificador de login cadastrado, e não um número telefônico público homologado.

## Limites e diagnóstico

O BI aplica a restrição de filial por contrato, e o filtro adicional de filial é aplicado no vínculo do contrato. Registros sem vínculo válido podem ter dados cadastrais incompletos; confira-os na área VoIP do contrato.

A página não exibe senha, saldo, consumo, chamadas ou resultado da integração, e não oferece CSV próprio. Para status de provisionamento ou divergência de número, verifique o cadastro do contrato e os retornos do serviço VoIP. Imprimir o relatório não consulta o servidor de telefonia nem envia comandos para ele.
