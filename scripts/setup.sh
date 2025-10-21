#!/bin/bash

# Script de configuração inicial do AgendeJá+
# Execute este script dentro do Dev Container

set -e

echo "🚀 Bem-vindo ao AgendeJá+!"
echo "======================================"
echo ""

# Verificar se estamos no diretório correto
if [ ! -d ".devcontainer" ]; then
    echo "❌ Erro: Execute este script na raiz do projeto"
    exit 1
fi

echo "📋 Escolha o que deseja configurar:"
echo "1) Backend (NestJS + Prisma)"
echo "2) Frontend (React + Vite)"
echo "3) Ambos (Full Stack)"
echo "4) Apenas verificar ambiente"
echo ""
read -p "Digite sua escolha (1-4): " choice

case $choice in
    1)
        echo ""
        echo "🔧 Configurando Backend..."
        echo "======================================"
        
        if [ -d "backend" ]; then
            echo "⚠️  Diretório backend já existe. Pulando criação..."
        else
            echo "Criando projeto NestJS..."
            nest new backend --package-manager npm --skip-git
            
            cd backend
            echo "Instalando dependências adicionais..."
            npm install @prisma/client prisma @nestjs/config @nestjs/jwt @nestjs/passport passport passport-jwt bcrypt class-validator class-transformer
            npm install -D @types/passport-jwt @types/bcrypt
            
            echo "Inicializando Prisma..."
            npx prisma init
            
            echo ""
            echo "✅ Backend configurado com sucesso!"
            echo "📝 Próximos passos:"
            echo "   1. Edite backend/prisma/schema.prisma"
            echo "   2. Execute: cd backend && npx prisma migrate dev --name init"
            echo "   3. Execute: npm run start:dev"
            echo ""
            cd ..
        fi
        ;;
        
    2)
        echo ""
        echo "🎨 Configurando Frontend..."
        echo "======================================"
        
        if [ -d "frontend" ]; then
            echo "⚠️  Diretório frontend já existe. Pulando criação..."
        else
            echo "Criando projeto React com Vite..."
            npm create vite@latest frontend -- --template react-ts
            
            cd frontend
            echo "Instalando dependências..."
            npm install
            npm install react-router-dom axios
            npm install -D tailwindcss postcss autoprefixer
            
            echo "Configurando Tailwind CSS..."
            npx tailwindcss init -p
            
            echo ""
            echo "✅ Frontend configurado com sucesso!"
            echo "📝 Próximos passos:"
            echo "   1. Configure o Tailwind em frontend/tailwind.config.js"
            echo "   2. Execute: cd frontend && npm run dev -- --host"
            echo ""
            cd ..
        fi
        ;;
        
    3)
        echo ""
        echo "🔧 Configurando Full Stack..."
        echo "======================================"
        
        # Backend
        if [ ! -d "backend" ]; then
            echo "Criando projeto NestJS..."
            nest new backend --package-manager npm --skip-git
            
            cd backend
            echo "Instalando dependências do backend..."
            npm install @prisma/client prisma @nestjs/config @nestjs/jwt @nestjs/passport passport passport-jwt bcrypt class-validator class-transformer
            npm install -D @types/passport-jwt @types/bcrypt
            
            echo "Inicializando Prisma..."
            npx prisma init
            cd ..
        fi
        
        # Frontend
        if [ ! -d "frontend" ]; then
            echo "Criando projeto React com Vite..."
            npm create vite@latest frontend -- --template react-ts
            
            cd frontend
            echo "Instalando dependências do frontend..."
            npm install
            npm install react-router-dom axios
            npm install -D tailwindcss postcss autoprefixer
            
            echo "Configurando Tailwind CSS..."
            npx tailwindcss init -p
            cd ..
        fi
        
        echo ""
        echo "✅ Full Stack configurado com sucesso!"
        echo "📝 Próximos passos:"
        echo "   Backend:"
        echo "   1. Edite backend/prisma/schema.prisma"
        echo "   2. Execute: cd backend && npx prisma migrate dev --name init"
        echo "   3. Execute: npm run start:dev"
        echo ""
        echo "   Frontend:"
        echo "   1. Configure Tailwind em frontend/tailwind.config.js"
        echo "   2. Execute: cd frontend && npm run dev -- --host"
        echo ""
        ;;
        
    4)
        echo ""
        echo "🔍 Verificando ambiente..."
        echo "======================================"
        
        echo "Node.js: $(node --version)"
        echo "npm: $(npm --version)"
        echo "Python: $(python3 --version)"
        echo "PostgreSQL Client: $(psql --version)"
        echo ""
        
        echo "Testando conexão com o banco de dados..."
        if psql -h localhost -U postgres -d agendeja_db -c "SELECT version();" > /dev/null 2>&1; then
            echo "✅ Conexão com PostgreSQL: OK"
        else
            echo "⚠️  Não foi possível conectar ao PostgreSQL"
            echo "   Verifique se o container está rodando: docker ps"
        fi
        
        echo ""
        echo "Ferramentas globais instaladas:"
        command -v nest >/dev/null 2>&1 && echo "✅ NestJS CLI" || echo "❌ NestJS CLI"
        command -v prisma >/dev/null 2>&1 && echo "✅ Prisma" || echo "❌ Prisma"
        command -v tsc >/dev/null 2>&1 && echo "✅ TypeScript" || echo "❌ TypeScript"
        command -v nodemon >/dev/null 2>&1 && echo "✅ Nodemon" || echo "❌ Nodemon"
        
        echo ""
        echo "✅ Verificação completa!"
        ;;
        
    *)
        echo "❌ Opção inválida"
        exit 1
        ;;
esac

echo ""
echo "======================================"
echo "🎉 Tudo pronto! Bom desenvolvimento!"
echo "======================================"
