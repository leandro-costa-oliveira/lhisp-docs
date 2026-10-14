---
title: Registro.BR
published: true
editor: markdown
description: Estado do relatório legado denominado Registro.BR e cuidados com a saída de acessos.
---

# Registro.BR

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.

O menu legado **Relatório de Clientes para o Registro.BR** abre uma listagem de acessos e dados cadastrais. O código examinado **não implementa envio ao Registro.br, protocolo de entrega ou geração de um arquivo de formato oficial**. O título do menu, sozinho, não certifica adequação a uma solicitação externa.

## O que a consulta faz

1. Abra **Relatórios → Registro.BR** no menu legado.
2. Clique em **Exibir**.
3. Confira o conteúdo antes de usar **Imprimir**.

O formulário visível não apresenta filtros. A listagem percorre serviços contratados **ATIVOS ou BLOQUEADOS**, depois os acessos vinculados a cada serviço. Mostra contrato, cliente, plano, CPF/CNPJ, usuário, **senha do acesso**, IP, data/hora da conexão e indicador PPPoE ON/OFF.

Sem datas recebidas, utiliza o último histórico de sessão para preencher a conexão. O indicador ON/OFF continua vindo do estado atual do acesso; não significa que o cliente estava online na data de uma requisição histórica. Total de acessos não equivale a total de pessoas ou contratos únicos.

## Limites do código legado

A página de resultado aceita parâmetros de rede/setor, datas e estado em alguns trechos, mas o formulário não os oferece. A lista de redes construída também não é usada no laço principal, que percorre os serviços. Não presuma filtro geográfico ou de rede porque essas variáveis existem no arquivo.

Não há colunas de porta CGNAT ou protocolo de conexão neste relatório. Para investigar titularidade em um instante, é necessário cruzar o histórico apropriado de uso de IP e, quando aplicável, o mapeamento de portas, com horário e fuso da solicitação. Para sessões, consulte [Bilhetagem dos Acessos](/relatorios/bilhetagem-dos-acessos).

A saída expõe senha e dados pessoais. Restrinja sua circulação e prepare somente os campos necessários à finalidade autorizada. O relatório não mascara essas colunas automaticamente.

## Fontes conferidas

Comportamento confrontado com os checkouts locais em 14/10/2026. Não comprova a versão instalada nem execução com dados reais.

- `lhisp-php/web/form/relatorios/rel_registro_br.php:16`
- `lhisp-php/web/form/relatorios/rel_registro_br_listagem.php:73`
- `lhisp-php/web/form/relatorios/rel_registro_br_listagem.php:91`
