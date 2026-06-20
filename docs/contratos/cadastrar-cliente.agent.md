# Cadastrar Novo Cliente

## Objetivo
Registrar um novo cliente no sistema LHISP para que ele possa ter contratos de serviços vinculados.

## Quando Usar
Sempre que um novo interessado ou empresa contratar os serviços do provedor e precisar ser inserido na base de dados.

## Pré-requisitos
- Acesso ao módulo **Contratos**.
- Dados básicos do cliente (Nome, CPF/CNPJ, Endereço).

## Passo a Passo Detalhado

1. No menu principal, acesse o módulo **Contratos**.
2. Na tela de listagem de contratos, clique no botão **Cadastrar** (botão com ícone de adição ou texto "Cadastrar").
3. A tela de cadastro será aberta. Por padrão, a aba **Dados** estará selecionada.
4. Preencha as informações do cliente:
    - **Nome**: Insira o nome completo da pessoa ou razão social da empresa (Campo Obrigatório).
    - **Tipo de Pessoa**: Selecione entre "Pessoa Física" ou "Pessoa Jurídica".
    - **CPF/CNPJ**: Informe o número do documento (Campo Obrigatório).
    - **Endereço da Instalação**: Preencha o logradouro, número e complemento.
5. Revise os dados inseridos.
6. Clique no botão **Salvar** localizado no topo ou rodapé do formulário para confirmar a criação do cliente.

## Campos Importantes

| Campo | Descrição | Obrigatoriedade | Observação |
|---|---|---|---|
| Nome | Nome completo ou Razão Social | Sim | Principal identificador do cliente. |
| Tipo de Pessoa | PF ou PJ | Sim | Define quais campos fiscais serão exibidos. |
| CPF/CNPJ | Documento de identificação fiscal | Sim | Validado pelo sistema para evitar duplicidade. |
| Logradouro | Nome da rua/avenida da instalação | Sim | Essencial para a viabilidade técnica. |

## Resultado Esperado
O cliente é cadastrado com sucesso e um número de contrato é gerador automaticamente, permitindo a adição de serviços e acessos.

## Problemas Comuns
- **CPF/CNPJ Duplicado**: O sistema impede o cadastro de dois clientes com o mesmo documento.
- **Campo Obrigatório Vazio**: O botão salvar não processa a requisição se campos marcados como `required` estiverem vazios.

## Observações
- É possível adicionar apelidos ao cliente para facilitar a busca rápida no dia a dia.
- A aba de "Observações" pode ser usada para anotar detalhes específicos do local da instalação.

## Dúvidas para Revisão
- O fluxo de validação automática de CPF via API externa está ativo neste ambiente?

## Screenshots Sugeridos
- ![Tela de Cadastro de Cliente](/assets/screenshots/contratos/cadastrar-cliente.png)
