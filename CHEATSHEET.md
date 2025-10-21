# 📝 Cheat Sheet - AgendeJá+ Dev Container

## 🚀 Comandos Rápidos

### Iniciar o Projeto

```bash
# Setup automático
bash scripts/setup.sh

# Verificar ambiente
bash scripts/setup.sh  # Opção 4
```

### Backend (NestJS)

```bash
# Criar novo projeto
nest new backend

# Desenvolvimento
cd backend
npm run start:dev

# Criar módulo
nest g module users
nest g controller users
nest g service users

# Testes
npm run test
npm run test:e2e
npm run test:cov
```

### Frontend (React + Vite)

```bash
# Criar novo projeto
npm create vite@latest frontend -- --template react-ts

# Desenvolvimento
cd frontend
npm run dev -- --host

# Build
npm run build
npm run preview
```

### Prisma

```bash
# Inicializar
npx prisma init

# Criar migration
npx prisma migrate dev --name migration_name

# Aplicar migrations
npx prisma migrate deploy

# Gerar cliente
npx prisma generate

# Abrir Studio
npx prisma studio

# Resetar banco
npx prisma migrate reset
```

### PostgreSQL

```bash
# Conectar via psql
psql -h localhost -U postgres -d agendeja_db

# Comandos psql
\dt              # Listar tabelas
\d table_name    # Descrever tabela
\l               # Listar databases
\du              # Listar usuários
\q               # Sair
```

### Docker

```bash
# Ver containers rodando
docker ps

# Ver logs
docker logs <container-id>
docker logs -f <container-id>  # Follow logs

# Parar containers
docker stop <container-id>

# Reiniciar
docker restart <container-id>

# Limpar (CUIDADO!)
docker-compose down -v  # Remove volumes!
```

### Git

```bash
# Status
git status

# Adicionar arquivos
git add .
git add file.txt

# Commit
git commit -m "mensagem"

# Push
git push origin branch-name

# Pull
git pull origin branch-name

# Criar branch
git checkout -b feature/nova-feature

# Ver branches
git branch -a
```

## 🔧 Estrutura de Arquivos

```
backend/
├── src/
│   ├── main.ts              # Entry point
│   ├── app.module.ts        # Root module
│   └── [feature]/
│       ├── [feature].module.ts
│       ├── [feature].controller.ts
│       ├── [feature].service.ts
│       └── dto/
├── prisma/
│   └── schema.prisma
└── package.json

frontend/
├── src/
│   ├── main.tsx             # Entry point
│   ├── App.tsx              # Root component
│   ├── components/
│   ├── pages/
│   ├── services/
│   └── utils/
└── package.json
```

## 📦 Pacotes Úteis

### Backend

```bash
# Autenticação
npm install @nestjs/jwt @nestjs/passport passport passport-jwt bcrypt

# Validação
npm install class-validator class-transformer

# Configuração
npm install @nestjs/config

# ORM
npm install @prisma/client
npm install -D prisma

# Testes
npm install -D @nestjs/testing
```

### Frontend

```bash
# Roteamento
npm install react-router-dom

# HTTP Client
npm install axios

# Gerenciamento de Estado
npm install zustand
# ou
npm install @reduxjs/toolkit react-redux

# UI
npm install -D tailwindcss postcss autoprefixer

# Forms
npm install react-hook-form

# Validação
npm install zod

# Datas
npm install date-fns
```

## 🎨 Snippets de Código

### NestJS Controller

```typescript
import { Controller, Get, Post, Body, Param } from '@nestjs/common';

@Controller('resource')
export class ResourceController {
  @Get()
  findAll() {
    return [];
  }

  @Get(':id')
  findOne(@Param('id') id: string) {
    return {};
  }

  @Post()
  create(@Body() dto: any) {
    return {};
  }
}
```

### NestJS Service

```typescript
import { Injectable } from '@nestjs/common';
import { PrismaService } from '../prisma/prisma.service';

@Injectable()
export class ResourceService {
  constructor(private prisma: PrismaService) {}

  async findAll() {
    return this.prisma.resource.findMany();
  }

  async create(data: any) {
    return this.prisma.resource.create({ data });
  }
}
```

### React Component

```typescript
import React from 'react';

interface Props {
  title: string;
}

export const Component: React.FC<Props> = ({ title }) => {
  return <div>{title}</div>;
};
```

### React Hook

```typescript
import { useState, useEffect } from 'react';

export const useCustomHook = () => {
  const [data, setData] = useState(null);

  useEffect(() => {
    // Lógica
  }, []);

  return { data };
};
```

## 🔌 Portas

| Serviço | Porta | URL |
|---------|-------|-----|
| Frontend | 3000 | http://localhost:3000 |
| Backend | 3001 | http://localhost:3001 |
| PostgreSQL | 5432 | localhost:5432 |
| Prisma Studio | 5555 | http://localhost:5555 |

## 🔑 Variáveis de Ambiente

```env
# Database
DATABASE_URL="postgresql://postgres:postgres@localhost:5432/agendeja_db"

# App
NODE_ENV=development
PORT=3001

# JWT
JWT_SECRET=your-secret-key
JWT_EXPIRATION=7d
```

## 🐛 Troubleshooting Rápido

| Problema | Solução |
|----------|---------|
| Container não inicia | `Ctrl+Shift+P` > "Rebuild Container" |
| Porta em uso | `lsof -i :3000` e `kill -9 <PID>` |
| DB não conecta | `docker ps` e `docker restart <id>` |
| Erro de permissão | `sudo chown -R node:node /workspace` |
| Cache de build | `docker-compose build --no-cache` |

## 🧪 Testes

```bash
# Backend
npm run test                # Unit tests
npm run test:watch         # Watch mode
npm run test:cov           # Coverage
npm run test:e2e           # E2E tests

# Frontend
npm run test               # Vitest
npm run test:coverage      # Coverage
```

## 📚 Recursos

- [NestJS](https://docs.nestjs.com/)
- [React](https://react.dev/)
- [Prisma](https://www.prisma.io/docs/)
- [Tailwind](https://tailwindcss.com/docs)
- [TypeScript](https://www.typescriptlang.org/docs/)

## 💡 Atalhos VS Code

| Atalho | Função |
|--------|--------|
| `Ctrl+P` | Quick Open |
| `Ctrl+Shift+P` | Command Palette |
| `` Ctrl+` `` | Terminal |
| `Ctrl+B` | Toggle Sidebar |
| `Ctrl+Shift+F` | Search in Files |
| `F12` | Go to Definition |
| `Alt+Shift+F` | Format Document |
| `Ctrl+/` | Toggle Comment |

---

**AgendeJá+ - Dev Container Cheat Sheet**
