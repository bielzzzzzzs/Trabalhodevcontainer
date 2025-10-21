# 🤝 Guia de Contribuição - AgendeJá+

Obrigado por considerar contribuir com o AgendeJá+! Este documento fornece diretrizes para contribuir com o projeto.

## 📋 Código de Conduta

- Seja respeitoso e inclusivo
- Aceite feedback construtivo
- Foque no que é melhor para a comunidade
- Mostre empatia com outros membros

## 🚀 Como Contribuir

### 1. Fork e Clone

```bash
# Fork o repositório no GitHub
# Clone seu fork
git clone https://github.com/SEU-USUARIO/Trabalhodevcontainer.git
cd Trabalhodevcontainer

# Adicione o repositório original como upstream
git remote add upstream https://github.com/bielzzzzzzs/Trabalhodevcontainer.git
```

### 2. Configure o Dev Container

```bash
# Abra no VS Code
code .

# Reabra no container
# Ctrl+Shift+P > "Remote-Containers: Reopen in Container"
```

### 3. Crie uma Branch

```bash
# Atualize sua main
git checkout main
git pull upstream main

# Crie uma branch para sua feature/fix
git checkout -b feature/nome-da-feature
# ou
git checkout -b fix/nome-do-bug
```

### 4. Faça suas Alterações

Siga as convenções de código do projeto:
- Use TypeScript
- Mantenha o código limpo e bem documentado
- Adicione testes para novas funcionalidades
- Atualize a documentação quando necessário

### 5. Commit suas Mudanças

Usamos Conventional Commits:

```bash
# Formato
<tipo>(<escopo>): <descrição>

# Exemplos
git commit -m "feat(auth): adiciona autenticação JWT"
git commit -m "fix(appointments): corrige bug ao cancelar agendamento"
git commit -m "docs(readme): atualiza instruções de instalação"
git commit -m "style(frontend): formata componentes com prettier"
git commit -m "refactor(backend): melhora estrutura de serviços"
git commit -m "test(users): adiciona testes unitários"
git commit -m "chore(deps): atualiza dependências"
```

#### Tipos de Commit

- `feat`: Nova funcionalidade
- `fix`: Correção de bug
- `docs`: Documentação
- `style`: Formatação, ponto e vírgula, etc
- `refactor`: Refatoração de código
- `test`: Adicionar ou corrigir testes
- `chore`: Manutenção, dependências, etc
- `perf`: Melhorias de performance
- `ci`: Mudanças em CI/CD
- `build`: Mudanças no sistema de build

### 6. Push e Pull Request

```bash
# Push para seu fork
git push origin feature/nome-da-feature

# Abra um Pull Request no GitHub
# Preencha o template de PR
```

## 📝 Diretrizes de Código

### TypeScript

```typescript
// ✅ Bom
interface User {
  id: string;
  name: string;
  email: string;
}

const getUser = async (id: string): Promise<User> => {
  // implementação
};

// ❌ Ruim
const getUser = async (id) => {
  // sem tipos
};
```

### Nomenclatura

```typescript
// ✅ Bom - PascalCase para classes e interfaces
class UserService {}
interface UserDto {}

// ✅ Bom - camelCase para variáveis e funções
const userName = 'João';
const getUserById = () => {};

// ✅ Bom - kebab-case para arquivos
// user-service.ts
// appointment.controller.ts

// ❌ Ruim
const UserName = 'João';  // Deveria ser camelCase
class userService {}      // Deveria ser PascalCase
```

### Comentários

```typescript
// ✅ Bom - Comentários úteis
/**
 * Calcula o valor total de um agendamento incluindo taxas
 * @param basePrice Preço base do serviço
 * @param fees Taxas adicionais
 * @returns Valor total calculado
 */
const calculateTotal = (basePrice: number, fees: number): number => {
  return basePrice + fees;
};

// ❌ Ruim - Comentários óbvios
// Define uma variável para o nome
const name = 'João';
```

## 🧪 Testes

### Backend (Jest)

```typescript
// user.service.spec.ts
describe('UserService', () => {
  it('should create a new user', async () => {
    const user = await userService.create({
      name: 'Test User',
      email: 'test@example.com'
    });
    
    expect(user).toBeDefined();
    expect(user.email).toBe('test@example.com');
  });
});
```

### Frontend (Vitest)

```typescript
// Component.test.tsx
import { render, screen } from '@testing-library/react';
import { Component } from './Component';

describe('Component', () => {
  it('renders correctly', () => {
    render(<Component title="Test" />);
    expect(screen.getByText('Test')).toBeInTheDocument();
  });
});
```

### Executar Testes

```bash
# Backend
cd backend
npm run test
npm run test:watch
npm run test:cov

# Frontend
cd frontend
npm run test
```

## 📚 Documentação

### README

- Mantenha atualizado
- Inclua exemplos de uso
- Documente mudanças importantes

### Código

```typescript
// ✅ Bom - JSDoc completo
/**
 * Serviço responsável por gerenciar agendamentos
 */
@Injectable()
export class AppointmentService {
  /**
   * Cria um novo agendamento
   * @param data Dados do agendamento
   * @returns Agendamento criado
   * @throws BadRequestException se os dados forem inválidos
   */
  async create(data: CreateAppointmentDto): Promise<Appointment> {
    // implementação
  }
}
```

## 🔍 Code Review

### Como Fazer um Bom PR

1. **Título descritivo**: `feat(auth): adiciona login com Google`
2. **Descrição clara**: Explique o que e por que
3. **Commits organizados**: Use conventional commits
4. **Testes inclusos**: Adicione testes para suas mudanças
5. **Screenshots**: Se for UI, inclua prints
6. **Documentação**: Atualize docs se necessário

### Template de PR

```markdown
## Descrição
Breve descrição das mudanças

## Tipo de Mudança
- [ ] Bug fix
- [ ] Nova feature
- [ ] Breaking change
- [ ] Documentação

## Checklist
- [ ] Meu código segue o style guide
- [ ] Revisei meu próprio código
- [ ] Comentei código complexo
- [ ] Atualizei a documentação
- [ ] Adicionei testes
- [ ] Todos os testes passam
- [ ] Não há conflitos com main

## Screenshots (se aplicável)
```

## 🐛 Reportando Bugs

### Template de Issue

```markdown
## Descrição do Bug
Descrição clara do problema

## Para Reproduzir
1. Vá para '...'
2. Clique em '...'
3. Veja o erro

## Comportamento Esperado
O que deveria acontecer

## Screenshots
Se aplicável

## Ambiente
- OS: [e.g. Windows 10]
- Browser: [e.g. Chrome 90]
- Versão: [e.g. 1.0.0]

## Informações Adicionais
Qualquer outra informação relevante
```

## ✨ Sugerindo Features

### Template de Feature Request

```markdown
## Feature Desejada
Descrição clara da feature

## Problema que Resolve
Qual problema esta feature resolve?

## Solução Proposta
Como você imagina que funcione?

## Alternativas Consideradas
Outras soluções que você pensou

## Informações Adicionais
Mockups, exemplos, referências
```

## 📊 Prioridades

### Alta Prioridade
- Bugs de segurança
- Funcionalidades core quebradas
- Problemas de performance críticos

### Média Prioridade
- Novas features planejadas
- Melhorias de UX
- Refatorações importantes

### Baixa Prioridade
- Melhorias de documentação
- Otimizações menores
- Features nice-to-have

## 🎯 Áreas que Precisam de Ajuda

- [ ] Testes automatizados
- [ ] Documentação da API
- [ ] Melhorias de UI/UX
- [ ] Otimização de performance
- [ ] Internacionalização (i18n)
- [ ] Acessibilidade (a11y)

## 📞 Comunicação

### Canais

- **Issues**: Para bugs e feature requests
- **Pull Requests**: Para contribuições de código
- **Discussions**: Para perguntas e discussões

### Respondendo Issues

- Seja educado e prestativo
- Forneça contexto e exemplos
- Marque como resolvido quando apropriado

## 🏆 Reconhecimento

Todos os contribuidores serão reconhecidos em nosso README e changelog.

## 📜 Licença

Ao contribuir, você concorda que suas contribuições serão licenciadas sob a mesma licença do projeto.

---

**Obrigado por contribuir com o AgendeJá+! 🎉**

Juntos estamos construindo uma solução melhor para agendamento de serviços!
