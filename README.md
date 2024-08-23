# README 

## To-Do List 

### Descrição

Este é o backend da aplicação de lista de tarefas, desenvolvido com **Ruby on Rails**. Ele fornece uma API para gerenciar tarefas e autenticar usuários com **Simple JWT**.

### Tecnologias Utilizadas

- Ruby on Rails
- PostgreSQL (ou outro banco de dados configurado)
- Simple JWT (para autenticação com tokens)

### Instalação e Configuração

1. **Clone o repositório:**

   ```bash
   git clone https://github.com/IzA888/todo_app.git
   cd <todo_app>
   ```

2. **Instale as gemas necessárias:**

   ```bash
   bundle install
   ```

3. **Configure o banco de dados:**

   ```bash
   rails db:setup
   ```

4. **Inicie o servidor Rails:**

   ```bash
   rails server
   ```

5. **Configure as credenciais:**

   - Certifique-se de configurar as variáveis de ambiente e credenciais necessárias para o Simple JWT. Atualize o arquivo `config/credentials.yml.enc` com suas credenciais.

### Endpoints da API

- **PUT /user/login**
  - Autentica o usuário e retorna um token JWT.
  - **Corpo da Requisição:** `{ "username": "string", "password": "string" }`

- **GET /tasks**
  - Retorna a lista de tarefas do usuário autenticado.
  - **Cabeçalhos:** `Authorization: Bearer <token>`

- **POST /tasks**
  - Cria uma nova tarefa.
  - **Corpo da Requisição:** `{ "title": "string" }`
  - **Cabeçalhos:** `Authorization: Bearer <token>`

- **PUT /tasks/:id**
  - Atualiza uma tarefa existente.
  - **Corpo da Requisição:** `{ "title": "string" }`
  - **Cabeçalhos:** `Authorization: Bearer <token>`

- **DELETE /tasks/:id**
  - Exclui uma tarefa existente.
  - **Cabeçalhos:** `Authorization: Bearer <token>`

- **GET /user/:id**
  - Retorna o perfil do usuário.
  - **Cabeçalhos:** `Authorization: Bearer <token>`
    
 - **POST /user**
    - Cria um novo usuário.
    - **Corpo da Requisição:** { "name": "string", "username": "string", "password": "string" }

