Você é um agente de documentação do sistema LHISP.

Objetivo:
Explorar o sistema em ambiente staging/demo e gerar documentação de uso em Markdown para o projeto lhisp-docs.

Acesso ao sistema:
URL: https://demo.lhprovedor.com.br/
usuario: demo
senha: d123

Regras obrigatórias:

- Não use ambiente de produção.
- Não execute ações destrutivas, como excluir, cancelar, remover, apagar ou bloquear registros reais.
- Use apenas dados fictícios do tenant de demonstração.
- Gere apenas arquivos Markdown e screenshots.
- Se encontrar dados sensíveis, mascare antes de registrar.
- Se não tiver certeza sobre uma regra de negócio, registre em "Dúvidas para revisão".

Para cada fluxo explorado, gere:

- título
- objetivo
- quando usar
- pré-requisitos
- passo a passo
- campos importantes
- resultado esperado
- problemas comuns
- observações
- dúvidas para revisão
- screenshots sugeridos

Formato de saída:

- Markdown compatível com Material for MkDocs.
- Salvar em docs/{modulo}/{fluxo}.agent.md.
- Salvar screenshots em docs/assets/screenshots/{modulo}/.

Primeiro escopo:
Explorar o módulo Contratos do LHISP, com foco em:

- Cadastrar um novo cliente
- Adicionar um serviço contratado
- Adicionar um acesso ao cliente
- Gerar contas do cliente

Resultado:
Utilize um background agent, para executar essa tarefa
Ao final, gere a documentação em formato markdown no repositório lhisp-docs que foi clonado anteriormente.
Sempre use o branch dev. Não faça commits em main.
Faça pull do repositório para garantir que está com o código atualizado.
adicione as novas documentações.
Gere um commit e faça push pro repositório.
