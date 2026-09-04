---
title: Filiais
published: true
editor: markdown
description: Organize contratos e operações por unidade e configure a identidade fiscal usada na emissão de documentos.
---

# Filiais

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.

A filial é a unidade operacional e fiscal à qual contratos, usuários, planos, estoque, relatórios e diversas rotinas do LHISP são vinculados. Ela também limita o que usuários não administradores podem consultar e operar.

Não trate a filial apenas como nome e telefone. CNPJ, razão social, inscrições, regime tributário, alíquotas, redução de base, mensagens fiscais, endereço e logomarca podem compor documentos fiscais e comunicações emitidos em nome da unidade.

## Dados operacionais e fiscais

| Grupo | Uso principal |
|---|---|
| Nome, telefones e endereço | Identificação da unidade em cadastros, relatórios e atendimento. |
| Tarifa de mudança de endereço | Valor cobrado quando o endereço de instalação de um contrato da filial é alterado; se zero, a rotina pode usar o valor geral da empresa. |
| CNPJ e razão social | Identificação do emitente e agrupamento das configurações fiscais. |
| Inscrições e regime fiscal | Geração e transmissão de documentos fiscais. |
| ICMS, ISS e abatimento da base | Cálculos fiscais conforme o tipo de documento/serviço. |
| Observações da nota | Textos incorporados às notas geradas. |
| Logomarca | Identidade visual específica; sem arquivo próprio, os fluxos podem usar a marca geral. |

Use dados validados pela contabilidade. Uma alíquota ou inscrição incorreta pode afetar emissões futuras.

## Cadastrar ou alterar

1. Acesse **Cadastros > Administrativo > Filiais** e pesquise o CNPJ antes de criar.
2. Informe nome, razão social e CNPJ — os três são obrigatórios na SPA atual.
3. Complete telefones, endereço, número e ponto de referência.
4. Defina a tarifa de mudança de endereço.
5. Preencha regime, inscrições, alíquotas, abatimento e mensagens conforme orientação fiscal.
6. Selecione a logomarca da unidade e salve.
7. Confira o emitente na configuração LHNFE/NFCom e faça uma emissão de homologação quando houver mudança fiscal.

Inclusão, edição e exclusão exigem `filial_add`, `filial_edit` e `filial_del`.

## Propagação por CNPJ

Ao salvar pela SPA, o backend replica razão social, inscrições, regime, parâmetros fiscais, mensagens e caminho da logomarca para **todas as filiais com o mesmo CNPJ**. Se o CNPJ também for o da empresa matriz, os mesmos campos fiscais são atualizados no cadastro da empresa.

Essa sincronização é intencional para unidades que representam o mesmo emitente. Se duas operações precisam de configuração fiscal diferente, não cadastre ambas com o mesmo CNPJ.

Nome, telefones, endereço e tarifa de mudança permanecem específicos da filial.

## Relações com outros módulos

- O contrato pertence a uma filial e herda seu contexto operacional.
- Usuários comuns veem somente filiais às quais estão associados; administradores possuem visão mais ampla.
- Planos podem ser disponibilizados por filial.
- Funcionários/técnicos podem atender conjuntos específicos de filiais.
- Estoques, relatórios e filtros financeiros usam a filial como dimensão de segregação.
- A integração LHNFE pode exigir token e certificado próprios quando a filial possui CNPJ emissor distinto.

## Alteração e exclusão

Alterar uma filial afeta emissões e operações futuras, mas não deve ser usado para representar uma nova pessoa jurídica: nesse caso, crie outra unidade e migre os vínculos de forma controlada.

A exclusão remove a filial das consultas usuais. Há muitos registros que podem depender dela; valide contratos, usuários, planos, estoque, contas e integrações antes de apagar. O fluxo legado ainda desassocia planos e vínculos de usuários, enquanto a API usada pela SPA executa a exclusão lógica do registro. Por essa diferença, faça a operação somente após confirmar o procedimento de migração da empresa.

| Problema | Verificação |
|---|---|
| Usuário não vê a filial | Confira os vínculos de usuário/filial e o perfil administrativo. |
| Dados fiscais mudaram em outra filial | As unidades compartilham CNPJ; campos fiscais são sincronizados. |
| Taxa de mudança não foi a esperada | Valor positivo da filial prevalece; caso contrário pode ser usado o valor geral da empresa. |
| Logo não aparece | Confira formato, armazenamento de anexos/S3 e se a filial possui logo própria. |
| NFCom rejeitada | Valide CNPJ, inscrições, regime, alíquotas e credenciais da filial no LHNFE. |

![Filiais no demo](/assets/screenshots/cadastros/administrativo/filiais.png)
