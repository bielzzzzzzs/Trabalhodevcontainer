# AgendeJá+ - Dev Container

## 📋 Sobre o Projeto

**AgendeJá+** é um aplicativo de agendamento de serviços multisserviços desenvolvido para empreendedores que trabalham com horários marcados. O sistema permite que profissionais organizem suas agendas e que clientes reservem horários de forma simples, rápida e prática.

### Tema
Aplicativo de agendamento multisserviços

### Integrantes
* Projeto de PI - Relações Públicas

## 🚀 Dev Container Setup

Este repositório está configurado com um **Dev Container** completo que fornece um ambiente de desenvolvimento padronizado e pronto para uso.

### O que está incluído:

- **Node.js 20** - Runtime para aplicações JavaScript/TypeScript
- **Python 3.11** - Suporte para scripts e ferramentas auxiliares
- **PostgreSQL 15** - Banco de dados relacional
- **Git & GitHub CLI** - Controle de versão e integração com GitHub
- **Ferramentas de desenvolvimento**:
  - TypeScript & ts-node
  - Nodemon (desenvolvimento com hot-reload)
  - Prisma ORM
  - NestJS CLI
  - React tools (Create React App, Vite)
  - ESLint & Prettier

### Extensões do VS Code incluídas:

- ESLint & Prettier - Formatação e lint de código
- Tailwind CSS IntelliSense - Suporte para Tailwind
- Docker - Gerenciamento de containers
- SQLTools - Conexão e queries ao PostgreSQL
- Prisma - Suporte para Prisma ORM
- React snippets - Snippets para desenvolvimento React
- Python & Pylance - Suporte completo para Python
- Auto Rename Tag - Renomeia tags HTML automaticamente
- Markdown All in One - Edição avançada de Markdown

## 🔧 Como Usar

### Pré-requisitos

- [Visual Studio Code](https://code.visualstudio.com/)
- [Docker Desktop](https://www.docker.com/products/docker-desktop)
- [Remote - Containers extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)

### Iniciando o Dev Container

1. Clone este repositório:
   ```bash
   git clone https://github.com/bielzzzzzzs/Trabalhodevcontainer.git
   cd Trabalhodevcontainer
   ```

2. Abra o projeto no VS Code:
   ```bash
   code .
   ```

3. Quando solicitado, clique em **"Reopen in Container"** ou use o Command Palette (`F1`) e execute:
   ```
   Remote-Containers: Reopen in Container
   ```

4. Aguarde a construção do container (primeira vez pode levar alguns minutos)

5. Após a inicialização, você terá um ambiente completo de desenvolvimento!

### Portas Expostas

O Dev Container expõe as seguintes portas:

- **3000** - Frontend (React/Vue/Angular)
- **3001** - Backend API (Node.js/NestJS)
- **5432** - PostgreSQL Database
- **8080** - Serviços Adicionais

### Estrutura do Projeto (Sugerida)

```
Trabalhodevcontainer/
├── .devcontainer/          # Configuração do Dev Container
│   ├── devcontainer.json   # Configuração principal
│   ├── docker-compose.yml  # Orquestração de serviços
│   └── Dockerfile          # Imagem do ambiente
├── backend/                # API Backend (NestJS/Express)
├── frontend/               # Aplicação Frontend (React/Vue)
├── database/               # Scripts e migrations do banco
├── docs/                   # Documentação do projeto
└── README.md              # Este arquivo
```

## 🗄️ Banco de Dados

O PostgreSQL está pré-configurado com:
- **Host**: `db` (dentro do container) ou `localhost` (do host)
- **Porta**: `5432`
- **Database**: `agendeja_db`
- **Usuário**: `postgres`
- **Senha**: `postgres`

### Conectar ao banco via SQLTools

A extensão SQLTools já está configurada. Basta:
1. Abrir a aba SQLTools no VS Code
2. Selecionar a conexão "PostgreSQL - Local"
3. Começar a executar queries!

## 📦 Desenvolvimento

### Criar um projeto Backend (NestJS)

```bash
nest new backend
cd backend
npm install
npm run start:dev
```

### Criar um projeto Frontend (React com Vite)

```bash
npm create vite@latest frontend -- --template react-ts
cd frontend
npm install
npm run dev
```

### Usar Prisma ORM

```bash
cd backend
npx prisma init
# Edite o schema.prisma
npx prisma migrate dev --name init
npx prisma generate
```

## 🛠️ Comandos Úteis

```bash
# Verificar versão do Node
node --version

# Verificar versão do npm
npm --version

# Conectar ao PostgreSQL
psql -h localhost -U postgres -d agendeja_db

# Listar containers em execução
docker ps

# Ver logs do banco de dados
docker logs <container-id>
```

## 🎯 Próximos Passos

1. ✅ Dev Container configurado
2. ⬜ Criar estrutura do backend (NestJS/Express)
3. ⬜ Configurar Prisma ORM
4. ⬜ Criar estrutura do frontend (React)
5. ⬜ Implementar autenticação de usuários
6. ⬜ Desenvolver sistema de agendamento
7. ⬜ Integrar pagamentos (opcional)
8. ⬜ Deploy da aplicação

## 📝 Licença

Este projeto é parte de um trabalho acadêmico de PI - Relações Públicas.

## 👥 Contribuindo

Para contribuir com este projeto:

1. Fork o repositório
2. Crie uma branch para sua feature (`git checkout -b feature/AmazingFeature`)
3. Commit suas mudanças (`git commit -m 'Add some AmazingFeature'`)
4. Push para a branch (`git push origin feature/AmazingFeature`)
5. Abra um Pull Request

---

**Desenvolvido com ❤️ para facilitar o agendamento de serviços para empreendedores**