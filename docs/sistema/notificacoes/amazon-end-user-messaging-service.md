---
title: SMS via AWS End User Messaging SMS
---

# SMS via AWS End User Messaging SMS

!!! warning "Rascunho gerado por agente"
    Esta página foi migrada a partir da wiki do LHISP. Não foi localizada uma tela equivalente no demo para captura de screenshot limpa, então a documentação foi baseada no conteúdo da wiki.

## Objetivo

Documentar a configuração do envio de mensagens SMS via **AWS End User Messaging SMS** no LHISP.

## Quando usar

Use este fluxo quando for necessário:

- habilitar o envio de SMS no sistema;
- configurar o gateway da Amazon para notificações;
- criar/validar credenciais de acesso na AWS para integração com o LHISP.

## Pré-requisitos

- Acesso ao menu **Sistema > Empresa > Preferências**.
- Conta AWS com permissão para **End User Messaging SMS**.
- Usuário IAM exclusivo para a integração.
- Chave de acesso e chave secreta geradas na AWS.

## Passo a passo

1. Abra a wiki da página **SMS via AWS End User Messaging SMS**.
2. No LHISP, vá em **Sistema > Empresa** e abra a aba **Preferências**.
3. Localize o grupo **Configurações de Envio de SMS**.
4. Selecione o gateway **AMAZON END USER MESSAGING SERVICE**.
5. Informe a região da AWS usada na conta, normalmente `sa-east-1` para o Brasil.
6. Solicite acesso à produção no painel da AWS, se a conta ainda estiver em sandbox.
7. Crie um usuário IAM dedicado para notificações.
8. Gere uma nova chave de acesso na aba de credenciais de segurança.
9. Preencha no LHISP a **chave de acesso** e a **chave de acesso secreta**.
10. Salve e valide o envio de SMS em um contrato de teste.

## Campos importantes

| Campo / informação | Descrição |
|---|---|
| **Gateway SMS** | Deve ser definido como **AMAZON END USER MESSAGING SERVICE**. |
| **Região** | Região da AWS usada na conta; a wiki cita `sa-east-1` como referência para o Brasil. |
| **Chave de acesso** | Credencial pública gerada na AWS. |
| **Chave de acesso secreta** | Credencial secreta gerada na AWS. |
| **Configurações de Envio de SMS** | Grupo de preferências onde a integração é configurada. |

## Resultado esperado

- O LHISP fica configurado para enviar SMS pela AWS.
- As credenciais da integração ficam separadas por usuário IAM.
- A equipe consegue disparar mensagens de teste e ver o resultado no contrato.

## Problemas comuns

| Problema | Como tratar |
|---|---|
| Conta ainda em sandbox | Solicitar acesso à produção no painel da AWS. |
| Região incorreta | Conferir a região da conta AWS antes de salvar. |
| Chaves inválidas | Gerar novas credenciais IAM e atualizar no LHISP. |
| SMS não envia no teste | Validar as permissões da conta e o status da integração na AWS. |

## Observações

- A wiki organiza este conteúdo em **Sistema > Notificações**.
- A página inclui orientações de configuração e links para documentação oficial da AWS.
- A wiki mostra imagens ilustrativas, mas não foi possível capturar uma tela equivalente limpa no demo.

## Dúvidas para revisão

- O nome de exibição deve permanecer como **SMS via AWS End User Messaging SMS** ou ser simplificado na navegação?
- A documentação precisa incluir um passo a passo mais detalhado do painel AWS ou o resumo atual é suficiente?
- Existe tela equivalente no demo para esse fluxo de configuração?

## Screenshots sugeridos

- **Não localizado**: nenhum screenshot de demo foi encontrado para esta página.
