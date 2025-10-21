# Como Usar o Dev Container - Guia Passo a Passo

Este guia fornece instruções detalhadas sobre como começar a usar o Dev Container do AgendeJá+.

## 📋 Pré-requisitos

Antes de começar, certifique-se de ter instalado:

1. **Visual Studio Code**: [Download aqui](https://code.visualstudio.com/)
2. **Docker Desktop**: [Download aqui](https://www.docker.com/products/docker-desktop)
3. **Extensão Remote - Containers**: [Instalar do Marketplace](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)

### Verificando as instalações

```bash
# Verificar Docker
docker --version
docker-compose --version

# Iniciar Docker Desktop
# Certifique-se de que o Docker Desktop está em execução
```

## 🚀 Guia de Início Rápido

### Passo 1: Clonar o Repositório

```bash
git clone https://github.com/bielzzzzzzs/Trabalhodevcontainer.git
cd Trabalhodevcontainer
```

### Passo 2: Abrir no VS Code

```bash
code .
```

### Passo 3: Abrir no Dev Container

Quando você abrir o projeto no VS Code, você verá uma notificação no canto inferior direito:

```
"Folder contains a Dev Container configuration file. Reopen folder to develop in a container"
```

Clique em **"Reopen in Container"**.

**Alternativa via Command Palette:**
1. Pressione `F1` ou `Ctrl+Shift+P` (Windows/Linux) / `Cmd+Shift+P` (Mac)
2. Digite: `Remote-Containers: Reopen in Container`
3. Pressione Enter

### Passo 4: Aguardar a Construção

Na primeira vez, o processo pode levar de 5 a 15 minutos, dependendo da sua conexão:

- Download da imagem base do Node.js
- Instalação de ferramentas e dependências
- Download da imagem do PostgreSQL
- Configuração dos volumes

Você pode acompanhar o progresso clicando em "show log" na notificação.

### Passo 5: Verificar o Ambiente

Quando o container estiver pronto, você verá:

```
Dev Container ready! Use npm install to setup your project dependencies.
```

Abra um novo terminal no VS Code (`Terminal > New Terminal` ou `` Ctrl+` ``) e execute:

```bash
bash scripts/setup.sh
```

Escolha a opção 4 para verificar o ambiente.

## 🔧 Configurando seu Projeto

### Opção 1: Configuração Automática

Use o script de setup interativo:

```bash
bash scripts/setup.sh
```

Escolha a opção desejada:
- **1**: Apenas Backend (NestJS)
- **2**: Apenas Frontend (React)
- **3**: Full Stack (Backend + Frontend)

### Opção 2: Configuração Manual

#### Backend (NestJS)

```bash
# Criar projeto NestJS
nest new backend --package-manager npm --skip-git

# Navegar para o diretório
cd backend

# Instalar dependências
npm install @prisma/client prisma @nestjs/config @nestjs/jwt @nestjs/passport passport passport-jwt bcrypt class-validator class-transformer

# Instalar dependências de desenvolvimento
npm install -D @types/passport-jwt @types/bcrypt

# Inicializar Prisma
npx prisma init
```

#### Frontend (React + Vite)

```bash
# Criar projeto React
npm create vite@latest frontend -- --template react-ts

# Navegar para o diretório
cd frontend

# Instalar dependências
npm install

# Instalar bibliotecas adicionais
npm install react-router-dom axios

# Instalar Tailwind CSS
npm install -D tailwindcss postcss autoprefixer
npx tailwindcss init -p
```

## 🗄️ Configurando o Banco de Dados

### 1. Copiar Schema de Exemplo

```bash
# Copiar schema de exemplo para o projeto backend
cp examples/prisma/schema.prisma backend/prisma/schema.prisma
```

### 2. Configurar Variáveis de Ambiente

```bash
# Copiar template de environment
cp .env.example backend/.env

# Editar se necessário (valores padrão já funcionam)
nano backend/.env
```

### 3. Executar Migrations

```bash
cd backend
npx prisma migrate dev --name init
```

### 4. Gerar Cliente Prisma

```bash
npx prisma generate
```

### 5. (Opcional) Abrir Prisma Studio

```bash
npx prisma studio
```

Isso abrirá uma interface visual no navegador para explorar e editar dados.

## 🏃 Executando a Aplicação

### Backend

```bash
cd backend
npm run start:dev
```

O backend estará disponível em: `http://localhost:3001`

### Frontend

```bash
cd frontend
npm run dev -- --host
```

O frontend estará disponível em: `http://localhost:3000`

### Executar Ambos Simultaneamente

Abra dois terminais no VS Code:

**Terminal 1 - Backend:**
```bash
cd backend && npm run start:dev
```

**Terminal 2 - Frontend:**
```bash
cd frontend && npm run dev -- --host
```

## 🔍 Explorando as Ferramentas

### SQLTools - Interface de Banco de Dados

1. Clique no ícone do SQLTools na barra lateral esquerda
2. Expanda "PostgreSQL - Local"
3. Clique com botão direito em "agendeja_db" > "New Query"
4. Execute queries SQL diretamente!

Exemplo:
```sql
-- Criar tabela de teste
CREATE TABLE IF NOT EXISTS test (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100)
);

-- Inserir dados
INSERT INTO test (name) VALUES ('Teste 1'), ('Teste 2');

-- Consultar dados
SELECT * FROM test;
```

### Prisma Studio

```bash
cd backend
npx prisma studio
```

Abre uma interface gráfica completa para:
- Visualizar dados
- Adicionar/editar/deletar registros
- Explorar relações entre tabelas

### PostgreSQL CLI

```bash
# Conectar ao banco via psql
psql -h localhost -U postgres -d agendeja_db

# Comandos úteis
\dt              # Listar tabelas
\d+ table_name   # Descrever tabela
\q               # Sair
```

## 📝 Exemplos de Código

### Backend - Criar um Controller

```typescript
// backend/src/users/users.controller.ts
import { Controller, Get, Post, Body } from '@nestjs/common';
import { UsersService } from './users.service';

@Controller('users')
export class UsersController {
  constructor(private usersService: UsersService) {}

  @Get()
  async findAll() {
    return this.usersService.findAll();
  }

  @Post()
  async create(@Body() createUserDto: any) {
    return this.usersService.create(createUserDto);
  }
}
```

### Frontend - Criar um Componente

```typescript
// frontend/src/components/AppointmentCard.tsx
import React from 'react';

interface AppointmentCardProps {
  title: string;
  date: string;
  professional: string;
}

export const AppointmentCard: React.FC<AppointmentCardProps> = ({ 
  title, 
  date, 
  professional 
}) => {
  return (
    <div className="border rounded-lg p-4 shadow-sm">
      <h3 className="text-lg font-semibold">{title}</h3>
      <p className="text-gray-600">{date}</p>
      <p className="text-sm text-gray-500">Com: {professional}</p>
    </div>
  );
};
```

## 🐛 Solução de Problemas

### Container não inicia

**Problema:** O Dev Container falha ao iniciar

**Soluções:**
1. Certifique-se de que o Docker Desktop está em execução
2. Reconstrua o container: `Cmd/Ctrl + Shift + P` > "Remote-Containers: Rebuild Container"
3. Verifique logs: `Cmd/Ctrl + Shift + P` > "Remote-Containers: Show Container Log"

### Porta já em uso

**Problema:** "Port 3000 is already in use"

**Soluções:**
```bash
# Listar processos usando a porta
lsof -i :3000

# Ou no Windows
netstat -ano | findstr :3000

# Parar o processo
kill -9 <PID>
```

### PostgreSQL não conecta

**Problema:** Não consegue conectar ao banco de dados

**Soluções:**
```bash
# Verificar se o container do banco está rodando
docker ps

# Verificar logs do PostgreSQL
docker logs <postgres-container-id>

# Reiniciar o container
docker-compose restart db
```

### Mudanças no código não refletem

**Problema:** Alterações no código não aparecem

**Soluções:**
1. Verifique se salvou o arquivo (`Ctrl+S` / `Cmd+S`)
2. Para o backend, o nodemon deve reiniciar automaticamente
3. Para o frontend, Vite usa HMR (Hot Module Replacement)
4. Se necessário, pare o servidor (`Ctrl+C`) e inicie novamente

### Erros de permissão

**Problema:** "Permission denied" ao executar comandos

**Soluções:**
```bash
# Verificar usuário atual
whoami  # Deve retornar 'node'

# Se necessário, corrigir permissões
sudo chown -R node:node /workspace
```

## 🔄 Atualizando o Dev Container

Se você fizer alterações nos arquivos de configuração do Dev Container:

1. `.devcontainer/devcontainer.json`
2. `.devcontainer/Dockerfile`
3. `.devcontainer/docker-compose.yml`

Execute:
```
Cmd/Ctrl + Shift + P > "Remote-Containers: Rebuild Container"
```

## 📚 Recursos Adicionais

- [VS Code Dev Containers Docs](https://code.visualstudio.com/docs/devcontainers/containers)
- [Docker Documentation](https://docs.docker.com/)
- [NestJS Documentation](https://docs.nestjs.com/)
- [React Documentation](https://react.dev/)
- [Prisma Documentation](https://www.prisma.io/docs/)
- [PostgreSQL Documentation](https://www.postgresql.org/docs/)

## 💡 Dicas Finais

1. **Use o terminal integrado**: Todos os comandos funcionam no terminal do VS Code
2. **Aproveite o IntelliSense**: As extensões fornecem autocomplete poderoso
3. **Atalhos úteis**:
   - `` Ctrl+` ``: Abrir/fechar terminal
   - `Ctrl+P`: Abrir arquivo rapidamente
   - `Ctrl+Shift+F`: Buscar em todos os arquivos
   - `F12`: Ir para definição
4. **Git integrado**: Use a aba Source Control do VS Code
5. **Extensões recomendadas**: Todas já estão instaladas no container!

## 🎯 Próximos Passos

Agora que seu ambiente está configurado:

1. ✅ Familiarize-se com a estrutura de pastas
2. ✅ Explore o schema do Prisma em `examples/prisma/schema.prisma`
3. ✅ Leia a documentação em `PROJECT_STRUCTURE.md`
4. ✅ Comece a desenvolver suas features!

---

**Desenvolvido para o projeto AgendeJá+ - PI Relações Públicas**

Se tiver dúvidas ou problemas, abra uma issue no GitHub!
