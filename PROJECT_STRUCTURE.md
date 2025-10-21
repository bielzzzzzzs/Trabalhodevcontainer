# Estrutura de Projeto Sugerida - AgendeJá+

Este documento descreve a estrutura de pastas recomendada para o desenvolvimento do AgendeJá+.

## 📁 Estrutura Completa

```
Trabalhodevcontainer/
│
├── .devcontainer/              # Configuração do Dev Container
│   ├── devcontainer.json       # Configuração principal do container
│   ├── docker-compose.yml      # Orquestração de serviços
│   ├── Dockerfile              # Imagem customizada
│   └── README.md               # Documentação do Dev Container
│
├── backend/                    # API Backend
│   ├── src/
│   │   ├── main.ts            # Ponto de entrada
│   │   ├── app.module.ts      # Módulo principal
│   │   ├── auth/              # Módulo de autenticação
│   │   ├── users/             # Módulo de usuários
│   │   ├── appointments/      # Módulo de agendamentos
│   │   ├── services/          # Módulo de serviços
│   │   ├── professionals/     # Módulo de profissionais
│   │   └── common/            # Código compartilhado
│   ├── prisma/
│   │   ├── schema.prisma      # Schema do banco de dados
│   │   └── migrations/        # Migrations do Prisma
│   ├── test/                  # Testes
│   ├── package.json
│   └── tsconfig.json
│
├── frontend/                   # Aplicação Frontend
│   ├── src/
│   │   ├── components/        # Componentes reutilizáveis
│   │   │   ├── common/        # Botões, inputs, etc
│   │   │   ├── layout/        # Header, Footer, Sidebar
│   │   │   └── features/      # Componentes específicos
│   │   ├── pages/             # Páginas da aplicação
│   │   │   ├── Home.tsx
│   │   │   ├── Login.tsx
│   │   │   ├── Dashboard.tsx
│   │   │   ├── Appointments.tsx
│   │   │   └── Profile.tsx
│   │   ├── services/          # Chamadas à API
│   │   ├── hooks/             # Custom hooks
│   │   ├── contexts/          # Context API
│   │   ├── utils/             # Funções auxiliares
│   │   ├── types/             # TypeScript types
│   │   ├── App.tsx
│   │   └── main.tsx
│   ├── public/                # Arquivos estáticos
│   ├── package.json
│   └── vite.config.ts
│
├── database/                   # Scripts de banco de dados
│   ├── seeds/                 # Dados iniciais
│   │   └── seed.sql
│   └── scripts/               # Scripts auxiliares
│       ├── backup.sh
│       └── restore.sh
│
├── docs/                       # Documentação do projeto
│   ├── api/                   # Documentação da API
│   │   └── endpoints.md
│   ├── database/              # Diagramas e schemas
│   │   └── erd.md
│   ├── architecture/          # Arquitetura do sistema
│   │   └── overview.md
│   └── user-guide/            # Guia do usuário
│       └── manual.md
│
├── scripts/                    # Scripts de automação
│   ├── setup.sh               # Script de setup inicial
│   ├── dev.sh                 # Script para rodar em dev
│   └── test.sh                # Script para rodar testes
│
├── .gitignore                 # Arquivos ignorados pelo Git
├── README.md                  # Documentação principal
└── PROJECT_STRUCTURE.md       # Este arquivo
```

## 🎯 Módulos Principais

### Backend (NestJS)

#### Auth Module
- Autenticação de usuários
- JWT tokens
- Guards e estratégias

#### Users Module
- Gerenciamento de usuários
- Perfis (cliente/profissional)
- Preferências

#### Appointments Module
- Criação de agendamentos
- Cancelamento
- Reagendamento
- Histórico

#### Services Module
- Cadastro de serviços
- Categorias
- Preços e durações

#### Professionals Module
- Perfil do profissional
- Horários disponíveis
- Configurações de agenda

### Frontend (React)

#### Pages
- **Home**: Landing page
- **Login/Register**: Autenticação
- **Dashboard**: Painel principal
- **Appointments**: Gerenciar agendamentos
- **Services**: Catálogo de serviços
- **Profile**: Perfil do usuário

#### Components
- **Common**: Botões, inputs, cards, modals
- **Layout**: Header, footer, sidebar, navigation
- **Features**: Calendar, appointment form, service card

## 🗄️ Estrutura do Banco de Dados

### Tabelas Principais

```sql
-- Users (Usuários)
- id
- email
- password_hash
- name
- phone
- role (client/professional)
- created_at
- updated_at

-- Professionals (Profissionais)
- id
- user_id (FK)
- business_name
- description
- address
- working_hours
- created_at

-- Services (Serviços)
- id
- professional_id (FK)
- name
- description
- duration (minutos)
- price
- active
- created_at

-- Appointments (Agendamentos)
- id
- client_id (FK)
- service_id (FK)
- professional_id (FK)
- scheduled_at
- status (pending/confirmed/cancelled/completed)
- notes
- created_at
- updated_at

-- Availability (Disponibilidade)
- id
- professional_id (FK)
- day_of_week
- start_time
- end_time
- active
```

## 🚀 Começando

### 1. Criar Backend

```bash
# Dentro do Dev Container
nest new backend
cd backend
npm install @prisma/client prisma
npm install @nestjs/jwt @nestjs/passport passport passport-jwt
npm install bcrypt class-validator class-transformer
npx prisma init
```

### 2. Criar Frontend

```bash
# Dentro do Dev Container
npm create vite@latest frontend -- --template react-ts
cd frontend
npm install
npm install react-router-dom axios
npm install -D tailwindcss postcss autoprefixer
npx tailwindcss init -p
```

### 3. Configurar Prisma Schema

Edite `backend/prisma/schema.prisma` com as tabelas descritas acima.

### 4. Executar Migrations

```bash
cd backend
npx prisma migrate dev --name init
npx prisma generate
```

### 5. Iniciar Desenvolvimento

```bash
# Terminal 1 - Backend
cd backend
npm run start:dev

# Terminal 2 - Frontend
cd frontend
npm run dev -- --host
```

## 📝 Convenções de Código

### Nomenclatura
- **Arquivos**: kebab-case (user-service.ts)
- **Classes**: PascalCase (UserService)
- **Variáveis/Funções**: camelCase (getUserById)
- **Constantes**: UPPER_SNAKE_CASE (MAX_APPOINTMENTS)

### Git Commits
```
feat: adiciona nova funcionalidade
fix: corrige bug
docs: atualiza documentação
style: formatação de código
refactor: refatoração de código
test: adiciona ou corrige testes
chore: tarefas de manutenção
```

### Branches
```
main - branch principal (produção)
develop - branch de desenvolvimento
feature/nome-da-feature - novas funcionalidades
fix/nome-do-bug - correções
hotfix/nome-do-hotfix - correções urgentes
```

## 🧪 Testes

### Backend
```bash
# Testes unitários
npm run test

# Testes E2E
npm run test:e2e

# Coverage
npm run test:cov
```

### Frontend
```bash
# Testes com Vitest
npm run test

# Coverage
npm run test:coverage
```

## 📦 Deploy

### Backend
1. Build da aplicação: `npm run build`
2. Configurar variáveis de ambiente
3. Deploy em serviço de cloud (Heroku, AWS, Azure, etc.)

### Frontend
1. Build da aplicação: `npm run build`
2. Deploy em Vercel, Netlify ou similar

### Banco de Dados
1. Provisionar PostgreSQL em cloud
2. Executar migrations: `npx prisma migrate deploy`
3. Configurar DATABASE_URL

---

**Este documento deve ser atualizado conforme o projeto evolui**
