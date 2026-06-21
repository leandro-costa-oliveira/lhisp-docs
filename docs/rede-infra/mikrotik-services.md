---
title: Mikrotik: Services
---

# Mikrotik: Services

!!! warning "Rascunho gerado por agente"
    Este documento foi produzido a partir da exploração da wiki do LHISP. Portas, serviços e ajustes de rede devem ser validados pela equipe técnica antes de qualquer uso em produção.

## Objetivo

Registrar como desativar serviços não utilizados no Mikrotik e como alterar as portas dos serviços expostos ao sistema.

## Quando usar

Use este fluxo quando for necessário:

- reduzir a superfície de exposição do Mikrotik;
- desativar serviços que não serão usados;
- trocar portas padrão de serviços;
- manter SSH e Winbox conforme a política do ambiente.

## Pré-requisitos

- Acesso ao Mikrotik pelo **Winbox**.
- Permissão administrativa para alterar serviços.
- Conhecimento das portas que serão utilizadas.
- Cuidado para não remover o acesso de administração ao equipamento.

## Passo a passo

### 1. Abrir a tela de serviços

1. Acesse o Mikrotik pelo **Winbox**.
2. Vá em **IP > Services**.
3. Revise a lista de serviços e as portas exibidas.

### 2. Desativar serviços não utilizados

1. Selecione o serviço que não será usado.
2. Clique no botão com o **X vermelho** para desativá-lo.
3. Confirme que o serviço ficou em cinza e com **X** na primeira coluna.
4. Se necessário, reative-o pelo botão com o **V azul**.

### 3. Trocar a porta de um serviço

1. Dê **duplo clique** sobre o serviço desejado.
2. No campo **Port**, informe a nova porta.
3. No caso do **SSH**, a porta configurada no Mikrotik deve ser igual à cadastrada no servidor do sistema.

## Campos importantes

| Campo / ação | Descrição |
|---|---|
| **IP > Services** | Tela onde os serviços do Mikrotik são administrados. |
| **X vermelho** | Desativa o serviço selecionado. |
| **V azul** | Reativa um serviço desativado. |
| **Port** | Campo usado para trocar a porta do serviço. |
| **SSH** | Serviço necessário para a comunicação do sistema com o Mikrotik. |
| **Winbox** | Serviço que deve permanecer habilitado se o acesso administrativo depender dele. |

## Resultado esperado

- Serviços desnecessários ficam desativados.
- Portas de serviços podem ser ajustadas para reduzir exposição.
- SSH permanece habilitado para integração com o LHISP.
- Winbox pode permanecer habilitado para facilitar a administração.

## Problemas comuns

| Problema | Como tratar |
|---|---|
| Perda de acesso ao equipamento | Não desative o serviço **Winbox** se ele for usado para administração. |
| Integração com o sistema falha | Verifique se o serviço **SSH** está ativo e se a porta corresponde ao cadastro do servidor. |
| Serviço continua aparecendo ativo | Confirme se a alteração foi aplicada e salva no Mikrotik. |

## Observações

- A wiki recomenda desativar tudo o que não for utilizado para reduzir riscos.
- O SSH é tratado como obrigatório para a comunicação do sistema com o Mikrotik.
- A wiki reforça que Winbox deve continuar habilitado quando for o meio de acesso administrativo.
- Não foi encontrada no demo uma tela equivalente 1:1 para essa página; por isso a migração foi feita diretamente a partir da wiki.

## Dúvidas para revisão

- Quais serviços devem permanecer obrigatoriamente habilitados em produção?
- A porta do SSH pode variar livremente ou existe faixa/padrão recomendado?
- A mudança de porta deve ser replicada em algum cadastro interno além do servidor?
- Há política padronizada para desativar Telnet, FTP e Web em todos os clientes?

## Screenshots sugeridos

- A wiki não fornece uma captura operacional 1:1 e o demo não expõe essa mesma tela.
- Se surgir uma tela equivalente no demo, ela poderá ser adicionada em `docs/assets/screenshots/rede-infra/mikrotik-services.png`.
