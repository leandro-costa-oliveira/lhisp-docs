---
title: Relatório de Uso de Banda
published: true
editor: markdown
description: Totais de bytes e rankings por acesso a partir das sessões iniciadas no período.
---

# Relatório de Uso de Banda

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.

A tela `/relatorios/rel_uso_de_banda` apresenta consumo acumulado e quantidade de sessões. Não mede velocidade instantânea nem gera série de ocupação de um enlace.

## Gerar

1. Informe **Período**, **Filial**, **Servidor** e **Número de Registros**.
2. O padrão é mês corrente, sem filial/servidor específico e dez registros; o campo de N apresenta limites de 2 a 25.
3. Clique em **Visualizar**. A consulta só é habilitada depois dessa ação.
4. Confira sumário e rankings; depois use **Imprimir**.

Ao mudar filtros, a página oculta os dados anteriores até nova aplicação, evitando apresentá-los como resultado do filtro editado. Não há exportador CSV próprio nesta tela.

## Cálculo

O endpoint consulta bilhetagem cuja **DATAHORAENTRADA** esteja entre os limites enviados. Soma `BYTESIN` como upload e `BYTESOUT` como download. O sumário mostra quantidade de conexões e consumo de todo o recorte; não se limita às N linhas do ranking.

Há dois rankings independentes, agrupados por **acesso**:

- **Clientes por uso de banda:** ordena pela soma de download, não por upload nem upload + download.
- **Clientes por número de conexões:** ordena pela quantidade de registros de sessão.

O contrato e o nome são buscados depois pelos IDs dos acessos. Um contrato com vários acessos pode aparecer em mais de uma linha. A contagem de conexões não comprova quantidade de quedas involuntárias.

## Unidades e período

Os contadores são **bytes**, embora o formatador se chame `formatarVelocidade`. A tela abrevia por potências de 1024 em K/M/G etc., sem acrescentar B nem bps. Interprete como volume acumulado, não Mbps; zero pode aparecer em branco pelo formatador.

O endpoint usa diretamente as datas enviadas, sem expandir explicitamente o final para `23:59:59`. Confira sessões no último dia ao fechar o período. Também seleciona pela entrada: uma sessão iniciada antes do intervalo e encerrada nele pode ficar fora, e não há rateio de bytes apenas pelo tempo dentro do período.

Para sessões individuais, consulte [Bilhetagem dos Acessos](/relatorios/bilhetagem-dos-acessos). Divergência de total exige conferir accounting, início de sessão, filtros e retenção do histórico; a consulta não recupera contadores que não foram gravados.
