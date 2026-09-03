---
title: Integração LHNFE e emissão de NFCom
published: true
editor: markdown
description: Configure certificados, ambientes, filiais, cClass, NF-e de compra e NFS-e na integração LHNFE.
---

# Integração LHNFE e emissão de NFCom

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.

A integração **Sistema > Integrações > LHNFE** conecta o cadastro fiscal do LHISP ao serviço emissor. Ela é usada principalmente na emissão e no cancelamento da NFCom modelo 62, mas a mesma configuração também controla a manifestação de NF-e de compra e a emissão de NFS-e pelo ambiente nacional.

Cada CNPJ emissor é cadastrado como uma empresa no LHNFE e recebe um token. A matriz guarda o token na integração; filiais com CNPJ próprio guardam token individual. Certificado e senha são enviados ao LHNFE e removidos da configuração persistida no LHISP.

## Preparação

Antes de salvar, confira:

- razão social, nome fantasia, CNPJ, inscrição estadual e regime tributário da empresa;
- endereço completo, CEP e código IBGE da cidade;
- telefone e e-mail, quando utilizados;
- alíquota de ICMS, redução da base e demais parâmetros fiscais;
- e-CNPJ A1 da matriz em `.pfx`, dentro da validade, e sua senha; para filiais, o seletor também aceita `.p12`;
- habilitação do CNPJ para NFCom no ambiente escolhido;
- códigos cClass definidos formalmente pela contabilidade.

Cadastros incompletos são enviados ao LHNFE e podem impedir a criação ou atualização do token.

## Configurar a matriz

1. Abra **Sistema > Integrações > LHNFE**.
2. No primeiro cadastro, envie o **eCNPJ (A1)** da matriz e informe sua senha.
3. Escolha **Ambiente NFCom**:
   - **Desativado**: não permite transmissão/cancelamento NFCom;
   - **Homologação**: testes sem valor fiscal;
   - **Produção**: documentos com efeito fiscal.
4. Informe, se necessário, o texto de **Informações complementares** que será incluído em todas as NFCom.
5. Configure filiais com CNPJ diferente.
6. Revise e confirme cClass SCM e SVA.
7. Revise as opções de NF-e de compra e NFS-e.
8. Clique em **Salvar** e aguarde a resposta. O token é criado/atualizado pelo LHNFE e aparece somente para leitura.

Depois do primeiro cadastro, certificado e senha não voltam para a tela. Para renovar ou trocar o certificado, envie o novo arquivo e a senha; o token existente é usado para atualizar o cadastro remoto.

## Filiais e certificados

| Situação da filial | Comportamento |
|---|---|
| Mesmo CNPJ da matriz | Usa certificado e token da matriz; não aceita certificado separado. |
| CNPJ diferente, ainda sem token | Exige certificado A1 e senha para gerar o token. |
| CNPJ diferente, já configurado | O salvamento atualiza os dados fiscais usando o token; envie certificado somente para substituí-lo. |
| Mais de uma filial com o mesmo CNPJ | Compartilha o mesmo cadastro/token no LHNFE. |

O token da filial é o efetivamente usado ao emitir suas notas. O painel mostra **Configurada**, data da última atualização ou a mensagem de erro recebida.

Quando a assinatura-base do LHISP tem valor fixo, filiais de outra raiz de CNPJ são recusadas. Na cobrança que acompanha a quantidade de contratos, outra raiz pode ser aceita. Se surgir essa mensagem, valide a estrutura empresarial e a assinatura com o comercial; não altere CNPJ apenas para contornar a validação.

Falha em uma filial não desfaz necessariamente as filiais já processadas. O sistema salva resultados individuais e relata o conjunto de erros no final. Após corrigir, confirme os tokens mostrados antes de repetir.

## cClass SCM e SVA

O cClass classifica cada item da NFCom:

- **cClass SCM**: obrigatório; aplicado ao valor de Serviço de Comunicação Multimídia.
- **cClass SVA**: aplicado à parcela de Serviço de Valor Adicionado. Pode ficar vazio somente se a operação não emitir planos com SVA.

A tela sugere valores iniciais (`0100401` para SCM e `0600601` para SVA), mas eles não são uma recomendação fiscal. Escolha os códigos definidos pela contabilidade e confira a tabela oficial vinculada na própria tela.

Os botões **Confirmar** não transmitem nota. Eles registram que o operador revisou cada escolha e são obrigatórios em todo salvamento, inclusive a confirmação consciente de deixar o SVA vazio. A confirmação volta a ser exigida ao recarregar a tela.

Sem cClass SCM ou ambiente ativo, a emissão NFCom é rejeitada. Sem cClass SVA, planos que possuam parcela SVA não podem ser emitidos corretamente pelo fluxo.

## Informações complementares

O texto configurado é incorporado automaticamente a todas as NFCom futuras. Use conteúdo estável e aprovado; dados específicos de um cliente, competência ou ocorrência não devem ser gravados aqui.

## Ciência automática de NF-e de compra

Ao ativar **Dar ciência automática nas NF-e de compra**, o sistema consulta documentos destinados ao CNPJ, registra a manifestação **Ciência da Operação** e baixa o XML completo com os itens. Desativada, a consulta mantém inicialmente apenas o resumo e a ciência é feita nota a nota na área de notas fiscais de compra.

A ciência é irreversível perante a SEFAZ. Ative somente com processo interno definido para revisar documentos desconhecidos e dar a manifestação definitiva adequada depois.

## NFS-e pelo ambiente nacional

**Emitir NFS-e pelo ambiente nacional** muda o destino das notas de serviço: em vez de gerar lote RPS para envio manual à prefeitura, o LHISP tenta transmiti-las ao Sistema Nacional NFS-e.

Ative somente se o município aderiu ao **Emissor Nacional**. A simples adesão ao Ambiente de Dados Nacional não significa que o município aceita emissão por esse endpoint; nesse caso, continue usando o sistema próprio da prefeitura/lotes RPS.

## Homologação e produção

1. Cadastre e valide empresa, filiais e certificados em homologação.
2. Emita casos com SCM, SVA, descontos, pessoa física/jurídica e filiais diferentes.
3. Confira cClass, CFOP, endereço, valores, chave, XML e DANFE.
4. Teste rejeição, correção, reenvio e cancelamento.
5. Só então mude para produção, salve novamente e faça uma emissão controlada.

Ambiente selecionado no LHISP também é enviado ao cadastro remoto. Não reutilize uma validação de homologação como prova de autorização em produção.

## Erros frequentes

| Mensagem/sintoma | Verificação |
|---|---|
| Certificado ou senha inválidos | Formato A1, validade, senha e correspondência do CNPJ. |
| Filial sem endereço | Complete endereço, número, CEP, UF, cidade e código IBGE. |
| Filial não configurada | Envie certificado e senha; confirme se o token retornou. |
| CNPJ com raiz diferente | Confira regra da assinatura e estrutura empresarial com o comercial. |
| Erro 203 — emissor não habilitado | Confirme credenciamento do CNPJ na SEFAZ e ambiente correto. Trocar cClass não habilita o emissor. |
| NFCom sem cClass | Confirme SCM; para planos com SVA, confirme também SVA. |
| Nota continua pendente/erro | Abra o log na tela de [Notas fiscais](/financeiro/notas-fiscais), corrija a causa e use **Tentar reenviar**. |
| Token existe, mas certificado venceu | Faça a rotação enviando novo A1 e senha e salve novamente. |

## Segurança

- Restrinja o acesso à integração a administradores autorizados.
- Não compartilhe certificado, senha ou token por mensagens e chamados sem canal seguro.
- O LHISP não mantém o PFX e a senha nessa configuração após o envio; o LHNFE conserva a credencial necessária à emissão.
- Revogue/substitua o certificado comprometido e atualize matriz e filiais afetadas.
- Códigos fiscais e ativação em produção são responsabilidade da empresa emissora e de sua contabilidade.
