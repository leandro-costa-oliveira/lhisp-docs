---
title: CGNAT
published: true
editor: markdown
description: Mapeamento determinístico de endereços privados para IPs e portas públicas, com aplicação no concentrador e rastreabilidade.
---

# CGNAT

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.

O CGNAT permite que vários assinantes compartilhem endereços IPv4 públicos. No LHISP, cada endereço privado recebe uma combinação determinística de **IP público + faixa de portas**. O sistema gera a configuração compatível com o concentrador e registra o mapa para relacionar uma conexão pública ao acesso e ao contrato responsáveis.

Esse registro é importante para operação e rastreabilidade. Para identificar um assinante em uma solicitação externa, normalmente são necessários IP público, porta e data/hora. A aba mostra os mapeamentos atualmente válidos; o histórico de uso de IP preserva os períodos de associação ao contrato.

## Estrutura do cadastro

Na aba **CGNAT** de um [servidor](/rede-infra/servidores), cada linha de prefixo associa:

- um bloco IPv4 público, usado como origem na Internet;
- um bloco IPv4 privado, entregue aos acessos;
- a quantidade calculada de portas disponível por endereço privado.

O cálculo usa as portas de `1024` a `65535` e distribui `64.512` portas de cada IP público entre os IPs privados correspondentes. Por exemplo, `/29` público para `/22` privado representa 128 privados por público e resulta em 504 portas para cada privado.

O prefixo privado precisa conter mais endereços que o público. O backend aceita máscaras de `/8` a `/32`, valida os endereços e recusa o mesmo par público/privado duplicado no servidor. Isso não substitui o planejamento: confira sobreposição com pools, rotas e outros concentradores antes de salvar.

## Adicionar um bloco

1. Abra **Rede e Infraestrutura → Servidores** e selecione o equipamento correto.
2. Na aba **CGNAT**, informe os prefixos com máscara CIDR.
3. Confirme quantidade de IPs privados por público e portas por assinante.
4. Clique em **Adicionar**.
5. Revise a fila ou saída de configuração conforme o fabricante.
6. Valide uma tradução real e confira o mapeamento na tabela.

A inclusão exige `servidor_edit`. O backend grava o par e imediatamente reconfigura somente esse prefixo. Durante a geração, cria ou reaproveita os mapeamentos atuais e encerra os registros antigos daquele mesmo bloco que deixaram de existir.

## Efeito por fabricante

| Tipo do servidor | Comportamento implementado |
|---|---|
| **Mikrotik** | Remove regras anteriores daquele prefixo, gera cadeias e regras `netmap` TCP/UDP e envia os comandos à fila do servidor. |
| **Huawei** | Calcula seções, pools e `static-mapping`, produz a configuração Huawei e registra o mapa IP/portas. A aplicação deve ser validada no fluxo operacional do equipamento. |
| **Outros** | A geração automática nesta rotina não está implementada. Não presuma que apenas cadastrar o bloco configurou o equipamento. |

No Mikrotik atual, cada cadeia recursiva recebe nome derivado do subprefixo privado que atende, como `lhcgnat_100_64_200_0_23`. Isso evita colisões entre blocos diferentes. Servidores configurados por versões anteriores devem passar por **Atualizar Servidor → CGNAT** para uma reconstrução completa: a rotina remove as regras identificadas por `lhcgnat` e recria as cadeias com os nomes atuais.

No Huawei, a quantidade de portas precisa ser múltipla de 256. O backend sugere a proporção `/32` público para `/25` privado. A configuração gerada contém referências que precisam corresponder à instância, ACL e interface de saída reais; revise antes de aplicar.

## Mapeamentos e vínculo com contratos

Para cada endereço privado, a tabela registra:

| Dado | Uso |
|---|---|
| **Endereço IPv4 público** | IP observado na Internet. |
| **Faixa de portas** | Intervalo exclusivo atribuído ao privado naquele público. |
| **Endereço IPv4 privado** | IP usado pelo acesso dentro da rede do provedor. |
| **Mapeado em** | Início do uso relacionado quando existe associação vigente. |
| **Contrato e cliente** | Titular encontrado pelo uso atual do IP privado. |

Ao gerar um mapeamento, o backend procura acesso **ATIVO** ou **BLOQUEADO** que esteja usando o IP privado e registra também o uso do IP público e da faixa de portas para o contrato. Quando um uso de IP é criado posteriormente, a rotina consulta o mapa CGNAT pelo IP privado e faz a mesma associação.

O filtro **Somente com contrato associado** exclui faixas livres. A busca por porta localiza o intervalo que contém a porta informada; combine-a com o IP público para evitar resultados ambíguos. A tela carrega os dados em páginas de 512 e **Copiar Tabela (Markdown)** copia apenas as páginas já carregadas.

## Reaplicar toda a configuração

Use **Atualizar Servidor → CGNAT** quando precisar reconstruir todos os blocos, especialmente após atualização do LHISP ou correção manual das regras. A rotina:

1. remove no Mikrotik todas as regras comentadas como `lhcgnat`;
2. recalcula cada prefixo cadastrado;
3. recria regras e mapeamentos;
4. encerra mapeamentos que não fazem mais parte da configuração atual.

Essa é uma operação de impacto amplo. Faça backup, planeje janela e compare contagem de mapas antes e depois. Como os comandos Mikrotik passam pela fila, o banco pode refletir o novo mapa antes de todas as regras terem sido executadas no roteador.

## Apagar um prefixo

Ao apagar, o backend encerra os mapeamentos atuais daquele prefixo e remove seu cadastro. No Mikrotik, também enfileira a remoção das regras identificadas pelo ID do bloco. No Huawei, essa rotina não remove configuração do equipamento; a limpeza correspondente deve ser executada e validada separadamente.

Não apague um bloco que ainda fornece endereços a clientes. Primeiro migre os acessos, encerre os usos e confirme que não existem sessões ou traduções dependentes.

## Investigação de uma conexão

1. Obtenha IP público, porta, protocolo e data/hora com fuso.
2. Abra o servidor que anunciava aquele IP no período.
3. Filtre pelo IP público e pela porta.
4. Identifique o IP privado e a faixa retornados.
5. Confirme contrato e período no histórico de uso de IP; a tabela corrente, sozinha, não prova titularidade em uma data passada.
6. Preserve os dados consultados conforme os procedimentos de auditoria da empresa.

TCP e UDP recebem a mesma faixa no gerador Mikrotik, mas o protocolo continua importante para correlacionar logs externos.

## Problemas comuns

| Sintoma | Verificação |
|---|---|
| Prefixo é recusado | Confira IPv4, máscara `/8` a `/32` e se o privado possui mais endereços que o público. |
| Huawei recusa a proporção | Use uma relação que resulte em quantidade de portas múltipla de 256. |
| Bloco aparece, mas não há NAT | Verifique fabricante suportado, fila de comandos e regras efetivamente aplicadas. |
| Contrato não aparece | O IP privado pode estar livre ou sem uso atual; consulte o histórico pelo período do incidente. |
| Resultado por porta parece ambíguo | Informe também o IP público e confirme data/hora e servidor. |
| Mikrotik contém cadeias antigas ou conflitantes | Faça backup e execute reconstrução completa pela flag **CGNAT**. |
| Prefixo Huawei foi apagado, mas continua ativo | Remova manualmente a configuração correspondente do equipamento e valide as traduções. |

![CGNAT](/assets/screenshots/rede-infra/cgnat.png)
