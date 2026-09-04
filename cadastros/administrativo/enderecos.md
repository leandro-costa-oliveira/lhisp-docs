---
title: Endereços
published: true
editor: markdown
description: Mantenha logradouros reutilizados por contratos, pessoas, filiais, cobranças, notas fiscais e operações técnicas.
---

# Endereços

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.

O endereço é um cadastro compartilhado de **UF, cidade, bairro, logradouro, CEP e tipo urbano/rural**. Número, complemento, ponto de referência e condomínio ficam nos cadastros que usam o logradouro, como contrato ou filial. Assim, vários clientes da mesma rua reutilizam um único endereço.

Esse registro alimenta instalação e cobrança dos contratos, ordens de serviço, boletos e gateways, notas fiscais, pessoas, fornecedores, funcionários, filiais e contas bancárias. Alterá-lo pode modificar a representação do endereço em todos esses contextos.

## Regras e normalização

- UF, cidade, bairro, rua, CEP e tipo são obrigatórios.
- O CEP precisa estar no formato mascarado esperado pelo backend, com 10 caracteres.
- UF, cidade, bairro, rua, CEP e tipo são armazenados em maiúsculas.
- Cidade e UF precisam corresponder à tabela interna de municípios; sem código IBGE válido o cadastro é rejeitado.
- O tipo é **U** para urbano ou **R** para rural.
- A combinação UF + cidade + bairro + rua + CEP identifica duplicidade.

Ao tentar cadastrar uma combinação já existente, o LHISP reutiliza o registro. Se ele havia sido excluído logicamente, o cadastro o restaura em vez de criar outro ID.

## Cadastrar e pesquisar

1. Acesse **Cadastros > Administrativo > Endereços**.
2. Pesquise por rua, UF, cidade, bairro ou CEP antes de incluir.
3. Clique em **Cadastrar** somente se o logradouro correto não existir.
4. Informe UF e cidade conforme a denominação oficial, depois bairro, rua, CEP e tipo.
5. Salve e confirme o código/município retornado.

Sem texto de pesquisa, a busca usada pelos seletores limita o resultado aos primeiros 50 registros. Use termos específicos em empresas com muitos logradouros. A planilha exporta a listagem disponível na tela.

## Instalação, cobrança e fiscal

O contrato exige endereço de instalação e pode ter endereço de cobrança distinto. Gateways e remessas geralmente usam o endereço de cobrança quando informado e recorrem ao de instalação caso contrário.

Na geração fiscal, a escolha varia com o tipo de pessoa e o fluxo da nota. O código IBGE do município é obrigatório para vários documentos fiscais; erro no nome da cidade pode impedir a emissão mesmo quando o endereço parece legível na tela.

Ordens de serviço normalmente usam o endereço do contrato, mas podem guardar endereço próprio. Integrações de equipes externas também recebem esses dados.

## Alteração e exclusão

Editar um endereço compartilhado não cria versão histórica. Antes de corrigir rua, bairro, cidade ou CEP, verifique quantos clientes e cadastros reutilizam o registro. Se o cliente mudou de local, selecione/cadastre outro endereço no contrato em vez de renomear a rua existente.

A exclusão exige `endereco_del` e é recusada quando há contrato usando o registro como endereço de instalação ou cobrança. O backend faz exclusão lógica; cadastros futuros da mesma combinação podem restaurá-lo. Outras referências, como condomínio, pessoa ou filial, também devem ser verificadas antes da tentativa.

| Problema | Verificação |
|---|---|
| Cidade ou código IBGE inválido | Use o nome oficial do município e a UF correta. |
| Endereço já existe | Pesquise a combinação completa; o sistema evita duplicidade. |
| Endereço não aparece no seletor | Informe parte da rua/CEP; buscas vazias retornam no máximo 50 itens. |
| Exclusão bloqueada | Há contrato usando o endereço de instalação ou cobrança. |
| Boleto ou nota com endereço errado | Confirme qual endereço de cobrança/instalação o fluxo utiliza antes de editar o cadastro compartilhado. |

![Endereços no demo](/assets/screenshots/cadastros/administrativo/enderecos.png)
