# 🏗️ Arquitetura do AgendeJá+

## Visão Geral do Sistema

```
┌─────────────────────────────────────────────────────────────────┐
│                        Dev Container                             │
│                                                                  │
│  ┌────────────────────┐         ┌──────────────────────┐       │
│  │   Frontend         │         │     Backend          │       │
│  │   (React + Vite)   │◄────────┤   (NestJS)          │       │
│  │   Port: 3000       │         │   Port: 3001         │       │
│  └────────────────────┘         └──────────┬───────────┘       │
│                                             │                    │
│                                             ▼                    │
│                                  ┌──────────────────┐           │
│                                  │   PostgreSQL     │           │
│                                  │   Port: 5432     │           │
│                                  │                  │           │
│                                  │  Database:       │           │
│                                  │  agendeja_db     │           │
│                                  └──────────────────┘           │
│                                                                  │
└─────────────────────────────────────────────────────────────────┘
```

## Estrutura de Containers

### Container: app (Development Environment)

**Baseado em:** `mcr.microsoft.com/devcontainers/javascript-node:20`

**Ferramentas incluídas:**
- Node.js 20.x
- npm/npx
- TypeScript
- Python 3.11
- Git
- GitHub CLI
- PostgreSQL Client
- Desenvolvimento: ts-node, nodemon, prisma, etc.

**Volume:**
- `/workspace` → Código do projeto (sincronizado)

**Rede:**
- Compartilha rede com container `db`
- Acesso direto ao PostgreSQL via `localhost:5432`

### Container: db (PostgreSQL Database)

**Baseado em:** `postgres:15-alpine`

**Configuração:**
- User: `postgres`
- Password: `postgres`
- Database: `agendeja_db`
- Port: `5432`

**Volume:**
- `postgres-data` → Dados persistentes

## Fluxo de Dados

```
┌──────────┐
│  Cliente │
│ (Browser)│
└────┬─────┘
     │
     │ HTTP Request
     ▼
┌──────────────────────┐
│   React Frontend     │
│   - UI Components    │
│   - State Management │
│   - Routing          │
└──────────┬───────────┘
           │
           │ API Call (axios)
           ▼
┌──────────────────────┐
│   NestJS Backend     │
│   - Controllers      │
│   - Services         │
│   - DTOs             │
│   - Guards           │
└──────────┬───────────┘
           │
           │ Prisma ORM
           ▼
┌──────────────────────┐
│   PostgreSQL DB      │
│   - Users            │
│   - Professionals    │
│   - Services         │
│   - Appointments     │
│   - Reviews          │
└──────────────────────┘
```

## Camadas da Aplicação

### Frontend (React)

```
┌─────────────────────────────────────┐
│         Presentation Layer          │
│  ┌──────────────────────────────┐  │
│  │  Pages (Views)               │  │
│  │  - Home                      │  │
│  │  - Dashboard                 │  │
│  │  - Appointments              │  │
│  │  - Profile                   │  │
│  └──────────────────────────────┘  │
│                                     │
│  ┌──────────────────────────────┐  │
│  │  Components                  │  │
│  │  - Common (Button, Input)    │  │
│  │  - Layout (Header, Footer)   │  │
│  │  - Features (Calendar, Form) │  │
│  └──────────────────────────────┘  │
│                                     │
│  ┌──────────────────────────────┐  │
│  │  State Management            │  │
│  │  - Context API / Zustand     │  │
│  └──────────────────────────────┘  │
│                                     │
│  ┌──────────────────────────────┐  │
│  │  Services (API Client)       │  │
│  │  - axios instances           │  │
│  │  - API endpoints             │  │
│  └──────────────────────────────┘  │
└─────────────────────────────────────┘
```

### Backend (NestJS)

```
┌─────────────────────────────────────┐
│         Controller Layer            │
│  - Handle HTTP Requests             │
│  - Route Mapping                    │
│  - Request Validation               │
└──────────────┬──────────────────────┘
               │
               ▼
┌─────────────────────────────────────┐
│         Service Layer               │
│  - Business Logic                   │
│  - Data Processing                  │
│  - External Service Integration     │
└──────────────┬──────────────────────┘
               │
               ▼
┌─────────────────────────────────────┐
│         Repository Layer            │
│  - Prisma Client                    │
│  - Database Operations              │
│  - Query Building                   │
└──────────────┬──────────────────────┘
               │
               ▼
┌─────────────────────────────────────┐
│         Database Layer              │
│  - PostgreSQL                       │
│  - Data Storage                     │
└─────────────────────────────────────┘
```

## Módulos do Backend

```
app.module (Root)
│
├── auth.module
│   ├── AuthController
│   ├── AuthService
│   ├── JwtStrategy
│   └── Guards
│
├── users.module
│   ├── UsersController
│   ├── UsersService
│   └── DTOs
│
├── professionals.module
│   ├── ProfessionalsController
│   ├── ProfessionalsService
│   └── DTOs
│
├── services.module
│   ├── ServicesController
│   ├── ServicesService
│   └── DTOs
│
├── appointments.module
│   ├── AppointmentsController
│   ├── AppointmentsService
│   └── DTOs
│
└── prisma.module
    └── PrismaService
```

## Modelo de Dados (Simplificado)

```
┌─────────────┐
│    User     │
├─────────────┤
│ id          │◄──────┐
│ email       │       │
│ password    │       │
│ name        │       │
│ role        │       │
└─────────────┘       │
       │              │
       │ 1:1          │ 1:N
       ▼              │
┌──────────────┐      │
│ Professional │      │
├──────────────┤      │
│ id           │      │
│ userId       │      │
│ businessName │      │
│ description  │      │
└──────┬───────┘      │
       │              │
       │ 1:N          │
       ▼              │
┌─────────────┐       │
│  Service    │       │
├─────────────┤       │
│ id          │       │
│ name        │       │
│ duration    │       │
│ price       │       │
└──────┬──────┘       │
       │              │
       │              │
       └────┐  ┌──────┘
            │  │
            ▼  ▼
     ┌──────────────┐
     │ Appointment  │
     ├──────────────┤
     │ id           │
     │ clientId     │
     │ serviceId    │
     │ scheduledAt  │
     │ status       │
     └──────────────┘
```

## Tecnologias Utilizadas

### Frontend
- **React 18**: Framework UI
- **TypeScript**: Tipagem estática
- **Vite**: Build tool
- **React Router**: Roteamento
- **Axios**: HTTP client
- **Tailwind CSS**: Estilização

### Backend
- **NestJS**: Framework backend
- **TypeScript**: Tipagem estática
- **Prisma**: ORM
- **JWT**: Autenticação
- **Passport**: Estratégias de autenticação
- **bcrypt**: Hash de senhas
- **class-validator**: Validação de DTOs

### Database
- **PostgreSQL 15**: Banco relacional
- **Prisma Migrations**: Versionamento de schema

### DevOps
- **Docker**: Containerização
- **Docker Compose**: Orquestração
- **VS Code Dev Containers**: Ambiente de desenvolvimento

## Segurança

### Autenticação
```
1. Cliente envia credenciais
   ↓
2. Backend valida (bcrypt)
   ↓
3. Gera JWT token
   ↓
4. Cliente armazena token
   ↓
5. Requisições incluem token no header
   ↓
6. Backend valida token (JWT Guard)
```

### Proteção de Rotas

```typescript
// Backend - Rota Protegida
@UseGuards(JwtAuthGuard)
@Get('profile')
getProfile(@Request() req) {
  return req.user;
}
```

### Validação de Dados

```typescript
// DTO com validação
export class CreateAppointmentDto {
  @IsUUID()
  serviceId: string;

  @IsDateString()
  scheduledAt: string;

  @IsOptional()
  @IsString()
  notes?: string;
}
```

## Performance

### Otimizações Backend
- Lazy loading de relações
- Índices no banco de dados
- Cache de queries frequentes
- Paginação de resultados

### Otimizações Frontend
- Code splitting (React.lazy)
- Memoização (useMemo, useCallback)
- Virtualização de listas longas
- Lazy loading de imagens

## Escalabilidade

### Horizontal Scaling
```
┌──────────┐   ┌──────────┐   ┌──────────┐
│ Backend  │   │ Backend  │   │ Backend  │
│Instance 1│   │Instance 2│   │Instance 3│
└────┬─────┘   └────┬─────┘   └────┬─────┘
     │              │              │
     └──────────────┼──────────────┘
                    │
            ┌───────▼──────┐
            │ Load Balancer│
            └──────────────┘
                    │
            ┌───────▼──────┐
            │  PostgreSQL  │
            │  (Primary)   │
            └──────────────┘
```

### Vertical Scaling
- Aumentar recursos do container (CPU, RAM)
- Otimizar queries do banco
- Implementar cache (Redis)

## Monitoring e Logging

```
┌─────────────┐
│ Application │
└──────┬──────┘
       │
       │ Logs
       ▼
┌─────────────┐
│   Console   │
└─────────────┘

Future: Winston/Pino → ELK Stack
```

## CI/CD Pipeline (Futuro)

```
GitHub Push
    ↓
GitHub Actions
    ↓
├─ Lint
├─ Tests
├─ Build
└─ Deploy
    ↓
Production
```

---

**Esta arquitetura é flexível e pode ser adaptada conforme as necessidades do projeto evoluem.**
