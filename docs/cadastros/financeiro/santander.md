---
title: Santander
---

# Santander

!!! warning "Rascunho gerado por agente"
    Esta página foi migrada a partir da wiki do LHISP. Não foi localizada uma tela equivalente no demo para captura de screenshot limpa, então a documentação foi baseada no conteúdo da wiki.

## Objetivo

Documentar o procedimento para configurar o certificado A1 e a comunicação bancária do Santander no LHISP.

## Quando usar

Use este fluxo quando for necessário:

- adicionar o certificado A1 da empresa ao LHISP;
- preparar a comunicação com a API bancária do Santander;
- consultar a orientação oficial da wiki sobre o certificado e a chave pública.

## Pré-requisitos

- Acesso ao menu **Cadastro > Financeiro > Contas Bancárias**.
- Certificado digital **A1** da empresa.
- Senha do certificado.
- Acesso à conta bancária Santander configurada no sistema.

## Passo a passo

1. Abra a página **Santander** na wiki.
2. Na seção **Adicionando A1 ao LHISP**, acesse o menu `Cadastro > Financeiro > Contas Bancárias`.
3. Edite a conta do Santander.
4. Clique no ícone de lupa no campo **Certificado**.
5. Selecione o arquivo do certificado A1 no computador.
6. Informe a **Senha do Certificado**.
7. Na seção **Adicionando A1 ao Santander**, extraia a **chave pública** do certificado A1.
8. Utilize a chave pública na configuração exigida pelo Santander.

## Campos importantes

| Campo / informação | Descrição |
|---|---|
| **Certificado** | Arquivo A1 da empresa usado na integração bancária. |
| **Senha do Certificado** | Senha do certificado A1. |
| **chave pública** | Informação solicitada pelo Santander para validar a comunicação. |
| **Conta Santander** | Conta bancária que recebe a configuração do certificado. |

## Resultado esperado

- O certificado A1 fica vinculado ao LHISP.
- A comunicação com o Santander fica preparada para uso.
- A equipe consegue seguir a configuração descrita na wiki sem depender de instruções soltas.

## Problemas comuns

| Problema | Como tratar |
|---|---|
| Certificado não localiza | Conferir o arquivo A1 selecionado. |
| Senha inválida | Validar a senha do certificado antes de salvar. |
| Comunicação não valida no Santander | Revisar a chave pública extraída e a configuração da conta. |
| Conta errada editada | Confirmar que a conta selecionada é a do Santander. |

## Observações

- A wiki organiza esta página dentro de `cadastros > financeiro > Contas Bancárias`.
- O texto orienta a configuração do certificado A1 para uso na API bancária do Santander.
- A wiki inclui um vídeo explicativo sobre extração da chave pública.
- Não foi localizada uma tela equivalente no demo para captura de screenshot limpa.

## Dúvidas para revisão

- A configuração deve permanecer sob **Santander** ou merece uma página mais genérica de **Contas Bancárias**?
- A documentação operacional precisa incluir o passo do vídeo ou apenas o resumo textual?
- Existe uma tela equivalente no demo que permita uma captura limpa dessa configuração?

## Screenshots sugeridos

- **Não localizado**: nenhum screenshot de demo foi encontrado para esta página.
