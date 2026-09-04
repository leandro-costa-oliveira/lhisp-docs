---
title: Contas Bancárias
published: true
editor: markdown
description: Configuração das carteiras usadas para cobrança, boletos, Pix, remessas e baixas.
---

# Contas Bancárias

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.

No LHISP, uma conta bancária é a configuração operacional de uma carteira de cobrança. Ela reúne os dados do beneficiário, o padrão CNAB, regras de multa e juros, credenciais de API/Pix, tarifas e opções de automação. Contratos e contas a receber apontam para esse cadastro para gerar e registrar cobranças.

Não basta informar agência e conta. A **Carteira de Cobrança** selecionada define o banco ou gateway e, consequentemente, as validações, os arquivos de remessa/retorno e os campos de integração usados pelo sistema.

## Efeitos no ciclo de cobrança

- **Carnês e mensalidades:** serviços contratados usam a conta bancária para criar as contas a receber e registrar boletos/cobranças.
- **Geração automática:** cada conta pode impedir sua participação na geração automática de carnês. A rotina financeira respeita essa opção por conta bancária.
- **Remessa bancária:** o padrão CNAB e os dados de cedente, agência, conta e carteira formam o arquivo enviado ao banco.
- **Remessa automática:** ao salvar um valor maior que zero em **Dias para Gerar Remessa**, o backend ativa a geração automática e usa essa antecedência para alcançar vencimentos futuros.
- **Retorno, API e webhook:** pagamentos podem ser identificados por arquivo de retorno, consulta periódica ou notificação do provedor e então baixar a conta a receber.
- **Pix e boleto:** credenciais, certificado, ambiente e chave Pix determinam como o provedor registra e consulta cobranças.
- **Tarifas:** valores de registro, liquidação e Pix participam do processamento financeiro das cobranças quando o fluxo correspondente os utiliza.
- **Caixa:** para bancos suportados pela tela, a conta pode ser vinculada ao caixa que representa sua movimentação.

## Cadastro

1. Acesse **Cadastros > Financeiro > Contas Bancárias**.
2. Clique em **Cadastrar** ou abra uma conta existente.
3. Selecione primeiro a **Carteira de Cobrança**; os campos e rótulos dependem dela.
4. Informe titular, CPF/CNPJ, moeda e dados bancários ou do gateway.
5. Configure cobrança, remessa, Pix/API, tarifas e notificações aplicáveis.
6. Escolha **Homologação** enquanto estiver validando a integração. Use produção somente após liberação do provedor.
7. Salve e valide uma cobrança controlada antes de associar a conta a contratos em massa.

## Grupos de configuração

| Grupo | Campos e finalidade |
|---|---|
| Identificação | Carteira de cobrança, titular, CPF/CNPJ, moeda, endereço e número. |
| Dados bancários | Convênio/cedente, agência, conta, variação e CNAB 240, 400 ou 750. Obrigatórios para bancos tradicionais, exceto a carteira **LOJA**. |
| Cobrança | Multa por atraso, juros ao mês, local de pagamento e observações impressas/enviadas conforme o emissor. |
| Automação | Dias para baixa, dias para gerar remessa e geração automática de carnês. |
| API/Pix | Cliente, segredo, chave da aplicação, token, webhook secret, certificado, senha, ambiente e chave Pix. A exigência varia por carteira. |
| Tarifas | Pix percentual ou fixo, limite de tarifa Pix, registro e liquidação de boleto. |
| Notificações | Para carteiras compatíveis, envio por e-mail, SMS e WhatsApp. |

## Validações por carteira

O backend sempre exige titular, CPF/CNPJ, moeda e uma carteira existente. Também aplica regras específicas:

- **Juno:** cliente, segredo e token;
- **ModoBank e Gerencianet/Efi:** cliente e segredo;
- **Asaas e Boleto Fácil:** token;
- **Cora:** certificado quando ele é alterado;
- bancos tradicionais: CNAB, cedente, agência e conta.

Outras carteiras podem exigir combinações próprias durante o registro da cobrança. Use somente credenciais emitidas para a empresa e para o ambiente selecionado.

## Segurança e permissões

- Certificados, senhas, tokens e segredos são credenciais. Não os inclua em chamados, capturas ou documentação.
- O certificado e sua senha só são substituídos quando a interface marca explicitamente a alteração; abrir e salvar o cadastro não deve sobrescrevê-los.
- O download do certificado armazenado aparece somente para administrador na SPA.
- Usuários que não sejam master ou administrador veem apenas contas bancárias às quais estejam vinculados.
- Alterações no cadastro geram um alerta interno com os campos modificados; datas de consulta são excluídas desse comparativo.

## Cuidados antes de editar ou excluir

Uma alteração pode afetar contratos, boletos ainda não registrados, Pix, remessas, retornos e baixas automáticas. Antes de trocar carteira, cedente, CNAB ou credenciais:

1. identifique contratos e contas abertas que usam o cadastro;
2. interrompa apenas a automação necessária;
3. valide a nova configuração em homologação quando o provedor permitir;
4. confira remessa, registro, consulta e retorno antes de produção.

A exclusão é lógica e não remove contas a receber ou histórico já vinculados, mas pode impedir novas operações que dependam da configuração.

## Captura da tela

![Listagem de contas bancárias](/assets/screenshots/cadastros/financeiro/contas-bancarias.png)
