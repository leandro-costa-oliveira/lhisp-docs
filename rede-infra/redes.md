---
title: Redes
published: true
editor: markdown
description: Consulta de redes, cadastro e transferência de acessos entre redes.
---

# Redes


## Objetivo

Cadastrar e revisar redes vinculadas a servidores, setorização e tecnologia de acesso no módulo de **Rede/Infra**.

## Quando usar

Use esta tela quando precisar:

- criar ou editar uma rede;
- associar uma rede a um servidor;
- revisar a tecnologia de acesso;
- definir prefixos IPv4/IPv6;
- controlar opções como NAT e exigência de POP;
- transferir acessos para a rede selecionada.

## Pré-requisitos

- Estar autenticado no LHISP.
- Ter permissão para acessar o fluxo **Redes**.
- Conhecer o servidor, setor e tecnologia da rede que será cadastrada.

## Passo a passo

1. Acesse **Rede/ Infra > Redes**.
2. Use a busca por descrição e a paginação para localizar a rede. A lista apresenta Id, Descrição, Servidor, Interface, Rede e Ações.
3. Clique na linha para abrir a edição ou use o cadastro de nova rede.
4. Revise tipo, setor, descrição, servidor e prefixos; siga [Cadastrar rede](/rede-infra/cadastrar-rede) para os campos e efeitos no equipamento.
5. Clique em **Salvar** para gravar ou **Cancelar** para voltar à página anterior.
6. Na coluna **Ações**, use **Transferir Acessos** para escolher a rede de destino, ou **Apagar** para excluir a rede após a confirmação.

## Transferência de acessos

O botão da linha identifica a **origem**. Na janela, selecione a **Rede de Destino**, diferente da origem, e clique em **Transferir**. A ação move todos os acessos da origem; não há seleção individual nessa janela.

A transferência pode remover e recriar configurações nos equipamentos e trocar prefixos quando o servidor muda. Ela é processada por acesso e pode terminar parcialmente se houver falha. Antes de repetir, confira quais clientes já foram transferidos. Veja os detalhes em [Cadastrar rede](/rede-infra/cadastrar-rede).

Os botões de transferência e exclusão dependem, respectivamente, de `rede_edit` e `rede_del`. A exclusão é recusada enquanto existirem acessos com serviço ativo ou bloqueado.

## Campos importantes

| Campo / ação | Descrição |
|---|---|
| **Tipo** | Define se a rede é de acesso ou administrativa. |
| **Limitar Quantidade de Acessos** | Quantidade máxima de acessos vinculados. |
| **Setor** | Setor associado à rede. |
| **Descrição** | Nome descritivo da rede. |
| **Servidor** | Servidor relacionado à rede. |
| **Interface** | Interface de conexão associada. |
| **Prefixo IPv4** | Prefixo IPv4 da rede. |
| **Prefixo IPv6** | Prefixo IPv6 da rede. |
| **Tecnologia** | Tipo de tecnologia: Wireless, GePON, GePON - Auth Mac, GPON ou Cabo UTP / Outros. |
| **Nat** | Indica se a rede usa NAT. |
| **Exigir Pop** | Exige POP para a rede. |
| **Transferir Acessos** | Ação para transferir acessos entre redes. |

## Resultado esperado

- A rede selecionada é exibida com seus campos principais.
- O setor, servidor e prefixos ficam visíveis para conferência.
- As opções de tecnologia e marcações da rede ficam consistentes com o cadastro.

## Problemas comuns

| Problema | Como tratar |
|---|---|
| Setor ou servidor não aparecem | Verifique se o cadastro existe e se o usuário tem permissão para consultá-lo. |
| Prefixos vazios | A rede pode ainda não ter sido vinculada a prefixos IPv4/IPv6. |
| Botão Transferir Acessos indisponível | Verifique a permissão `rede_edit`. |
| Parte dos acessos permaneceu na origem | Confira o erro, a capacidade e os prefixos do destino antes de repetir a transferência. |

## Observações

- A tela atual usa `/redeinfra/redes`; cada cadastro é aberto por seu ID. A rota `/lgc/redeinfra%7Credes` e a captura abaixo correspondem ao formulário legado.
- Mudanças de servidor, tecnologia, VLAN ou porta PON podem reprovisionar clientes. Revise os efeitos antes de salvar.


## Screenshots sugeridos

- Tela **Redes** no demo: `assets/screenshots/rede-infra/redes.png`

![Redes no demo](/assets/screenshots/rede-infra/redes.png)

> **Aviso:** Esta documentação foi gerada por inteligência artificial e pode conter erros.
