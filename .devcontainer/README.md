# Guia do Dev Container - AgendeJá+

## 📖 Introdução

Este guia fornece informações detalhadas sobre o ambiente de desenvolvimento containerizado do projeto AgendeJá+.

## 🏗️ Arquitetura do Dev Container

### Serviços

O ambiente é composto por dois serviços principais:

1. **app** - Container de desenvolvimento principal
   - Baseado em Node.js 20
   - Contém todas as ferramentas de desenvolvimento
   - Volume montado para sincronização de código
   - Compartilha rede com o serviço de banco de dados

2. **db** - Container PostgreSQL
   - PostgreSQL 15 Alpine (imagem leve)
   - Dados persistentes através de volume Docker
   - Exposto na porta 5432

### Recursos Principais

#### Linguagens e Runtimes
- **Node.js 20.x** - JavaScript/TypeScript runtime
- **Python 3.11** - Scripts e ferramentas auxiliares
- **npm/npx** - Gerenciador de pacotes Node

#### Ferramentas de Build e Development
- **TypeScript** - Superset tipado de JavaScript
- **ts-node** - Execução direta de TypeScript
- **nodemon** - Auto-reload em desenvolvimento
- **Vite** - Build tool moderna e rápida
- **ESLint** - Linter JavaScript/TypeScript
- **Prettier** - Formatador de código

#### Frameworks e ORMs
- **NestJS CLI** - Framework backend progressivo
- **Create React App** - Scaffolding React
- **Prisma** - ORM moderno para Node.js

#### Banco de Dados
- **PostgreSQL Client** - CLI para interação com PostgreSQL
- **SQLTools** - Interface gráfica no VS Code

## 🔌 Conexão com Banco de Dados

### Dentro do Container

```javascript
// Exemplo de conexão usando Prisma
// DATABASE_URL já está configurado como variável de ambiente
// postgresql://postgres:postgres@localhost:5432/agendeja_db

// prisma/schema.prisma
datasource db {
  provider = "postgresql"
  url      = env("DATABASE_URL")
}
```

### Do Host (máquina local)

Se você precisar conectar ao banco de dados de fora do container:

```bash
Host: localhost
Port: 5432
Database: agendeja_db
User: postgres
Password: postgres
```

## 🎨 Extensões do VS Code

### Produtividade
- **Auto Rename Tag** - Renomeia tags HTML/JSX automaticamente
- **npm IntelliSense** - Autocomplete para módulos npm
- **Markdown All in One** - Edição avançada de Markdown

### JavaScript/TypeScript
- **ESLint** - Análise estática de código
- **Prettier** - Formatação automática
- **TypeScript Next** - Suporte TypeScript aprimorado
- **ES7 React/Redux snippets** - Snippets para React

### Database
- **SQLTools** - Cliente SQL universal
- **SQLTools PostgreSQL Driver** - Driver PostgreSQL
- **Prisma** - Suporte para Prisma ORM

### Python
- **Python** - Suporte completo Python
- **Pylance** - Language server Python

### DevOps
- **Docker** - Gerenciamento de containers
- **Tailwind CSS IntelliSense** - Autocomplete Tailwind

## 🚀 Casos de Uso Comuns

### 1. Criar um Backend com NestJS

```bash
# Dentro do Dev Container
nest new backend
cd backend

# Instalar Prisma
npm install prisma @prisma/client --save

# Inicializar Prisma
npx prisma init

# Editar o schema em prisma/schema.prisma
# Criar migration
npx prisma migrate dev --name init

# Executar servidor em modo desenvolvimento
npm run start:dev
```

### 2. Criar um Frontend com React + Vite

```bash
# Dentro do Dev Container
npm create vite@latest frontend -- --template react-ts
cd frontend
npm install

# Instalar dependências adicionais
npm install axios react-router-dom

# Executar em modo desenvolvimento
npm run dev -- --host
```

### 3. Executar Queries SQL

```bash
# Via linha de comando
psql -h localhost -U postgres -d agendeja_db

# Queries de exemplo
\dt              # Listar tabelas
\d nome_tabela   # Descrever estrutura de tabela
SELECT * FROM usuarios LIMIT 10;
```

### 4. Usar Python para Scripts

```bash
# Criar ambiente virtual (opcional)
python3 -m venv venv
source venv/bin/activate

# Instalar dependências
pip install pandas sqlalchemy psycopg2-binary

# Executar script
python script.py
```

## 🔧 Configurações Personalizadas

### Adicionar Extensões do VS Code

Edite `.devcontainer/devcontainer.json`:

```json
"customizations": {
  "vscode": {
    "extensions": [
      "sua.extensao.aqui"
    ]
  }
}
```

### Modificar Variáveis de Ambiente

Edite `.devcontainer/docker-compose.yml`:

```yaml
services:
  app:
    environment:
      - NOVA_VARIAVEL=valor
```

### Instalar Pacotes Globais

Edite `.devcontainer/Dockerfile`:

```dockerfile
RUN npm install -g novo-pacote
```

### Adicionar Comandos Pós-Criação

Edite `.devcontainer/devcontainer.json`:

```json
"postCreateCommand": "npm install && npx prisma generate"
```

## 🐛 Troubleshooting

### Container não inicia

```bash
# Reconstruir container
Cmd/Ctrl + Shift + P -> "Remote-Containers: Rebuild Container"
```

### Problemas com portas

```bash
# Verificar portas em uso
docker ps
lsof -i :3000
```

### Banco de dados não conecta

```bash
# Verificar se o serviço está rodando
docker ps
docker logs <container-id>

# Reiniciar serviço de banco
docker-compose restart db
```

### Permissões de arquivo

```bash
# Dentro do container, verificar usuário
whoami  # Deve retornar 'node'

# Corrigir permissões se necessário
sudo chown -R node:node /workspace
```

## 📚 Recursos Adicionais

### Documentação Oficial
- [VS Code Dev Containers](https://code.visualstudio.com/docs/devcontainers/containers)
- [Docker Compose](https://docs.docker.com/compose/)
- [Node.js](https://nodejs.org/)
- [PostgreSQL](https://www.postgresql.org/docs/)
- [NestJS](https://nestjs.com/)
- [Prisma](https://www.prisma.io/docs/)
- [React](https://react.dev/)

### Tutoriais Recomendados
- [NestJS com Prisma](https://docs.nestjs.com/recipes/prisma)
- [React com TypeScript](https://react.dev/learn/typescript)
- [Prisma Schema](https://www.prisma.io/docs/concepts/components/prisma-schema)

## 💡 Dicas de Produtividade

1. **Use o Terminal Integrado**: Todos os comandos podem ser executados diretamente no terminal do VS Code
2. **Aproveite o IntelliSense**: As extensões fornecem autocomplete poderoso
3. **Formate Automaticamente**: Salve arquivos com Ctrl/Cmd + S para auto-formatação
4. **Use Snippets**: Digite prefixos como `rafce` para criar componentes React rapidamente
5. **SQLTools**: Execute queries diretamente do VS Code sem precisar de cliente externo

## 🔄 Atualizações e Manutenção

### Atualizar Dependências do Container

```bash
# Reconstruir imagem com cache limpo
docker-compose build --no-cache
```

### Limpar Volumes e Containers

```bash
# ATENÇÃO: Isso apagará dados do banco!
docker-compose down -v
docker-compose up -d
```

### Backup do Banco de Dados

```bash
# Criar backup
docker exec <container-id> pg_dump -U postgres agendeja_db > backup.sql

# Restaurar backup
docker exec -i <container-id> psql -U postgres agendeja_db < backup.sql
```

---

**Desenvolvido para o projeto AgendeJá+ - PI Relações Públicas**
