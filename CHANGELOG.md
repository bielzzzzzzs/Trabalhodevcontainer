# Changelog

Todas as mudanças notáveis neste projeto serão documentadas neste arquivo.

O formato é baseado em [Keep a Changelog](https://keepachangelog.com/pt-BR/1.0.0/),
e este projeto adere ao [Semantic Versioning](https://semver.org/lang/pt-BR/).

## [Unreleased]

### Planejado
- Sistema de notificações por email
- Integração com calendário (Google Calendar)
- Sistema de pagamentos online
- App mobile (React Native)
- Notificações push
- Sistema de avaliações e reviews
- Dashboard de analytics para profissionais

## [0.1.0] - 2025-10-21

### Adicionado
- Configuração inicial do Dev Container
- Estrutura de desenvolvimento com Docker Compose
- Ambiente Node.js 20 com TypeScript
- Banco de dados PostgreSQL 15
- Documentação completa do projeto
  - README.md principal
  - GETTING_STARTED.md - Guia passo a passo
  - CHEATSHEET.md - Referência rápida
  - CONTRIBUTING.md - Guia de contribuição
  - ARCHITECTURE.md - Arquitetura do sistema
  - PROJECT_STRUCTURE.md - Estrutura do projeto
- Extensões do VS Code pré-configuradas
  - ESLint & Prettier
  - SQLTools
  - Prisma
  - Docker
  - E mais...
- Script de setup automatizado (`scripts/setup.sh`)
- Template de variáveis de ambiente (`.env.example`)
- Schema Prisma de exemplo para o banco de dados
- Configuração de portas para multi-serviços
  - 3000: Frontend
  - 3001: Backend
  - 5432: PostgreSQL
  - 8080: Serviços adicionais
- .gitignore configurado
- Features do Dev Container:
  - Git
  - GitHub CLI
  - Node.js 20
  - Python 3.11

### Configurado
- Docker Compose para orquestração de serviços
- PostgreSQL com volume persistente
- Rede compartilhada entre app e banco de dados
- Ferramentas globais npm:
  - TypeScript
  - ts-node
  - nodemon
  - Prisma
  - NestJS CLI
  - Vite
  - ESLint
  - Prettier

### Documentado
- Instruções de instalação e configuração
- Guias de uso do Dev Container
- Convenções de código
- Processo de contribuição
- Arquitetura do sistema
- Exemplos de código
- Troubleshooting comum
- Roadmap do projeto

## Tipos de Mudanças

- `Added` - para novas funcionalidades
- `Changed` - para mudanças em funcionalidades existentes
- `Deprecated` - para funcionalidades que serão removidas em breve
- `Removed` - para funcionalidades removidas
- `Fixed` - para correção de bugs
- `Security` - para vulnerabilidades de segurança

---

## Template para Novas Versões

```markdown
## [X.Y.Z] - YYYY-MM-DD

### Added
- Nova funcionalidade A
- Nova funcionalidade B

### Changed
- Mudança na funcionalidade C
- Melhoria na funcionalidade D

### Deprecated
- Funcionalidade E será removida na versão X.Y.Z

### Removed
- Funcionalidade F removida

### Fixed
- Correção do bug G
- Correção do bug H

### Security
- Correção de vulnerabilidade I
```

---

**Convenção de Versionamento:**
- **MAJOR** (X.0.0): Mudanças incompatíveis com versões anteriores
- **MINOR** (0.X.0): Novas funcionalidades compatíveis com versões anteriores
- **PATCH** (0.0.X): Correções de bugs compatíveis com versões anteriores
