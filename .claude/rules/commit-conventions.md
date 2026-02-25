## Brief overview
This document defines the commit message format for im-u projects, following the Conventional Commits specification.

## Commit Message Format
```
<type>[optional scope]: <description>

[optional body]

[optional footer(s)]
```

## Commit Types
- **feat**: A new feature or enhancement.
- **fix**: A bug fix.
- **docs**: Documentation changes only.
- **style**: Code style changes (e.g., formatting).
- **refactor**: Code refactoring without changing functionality.
- **perf**: Performance improvements.
- **test**: Adding or updating tests.
- **chore**: Maintenance tasks, dependency updates.
- **ci**: CI/CD pipeline changes.
- **route**: Adding or modifying routes.
- **middleware**: Changes to middleware.
- **config**: Configuration changes.
- **api**: API route changes.
- **build**: Build system or deployment changes.

## Commit Scopes
- **ui**: UI components and styling.
- **auth**: Authentication and authorization.
- **db**: Database schema or queries.
- **api**: API routes and integrations.
- **hooks**: Custom React hooks.
- **utils**: Utility functions.
- **types**: TypeScript definitions.
- **design-system**: Design system updates.
- **deps**: Dependency updates.
- **ci**: CI/CD pipeline changes.
- **deploy**: Deployment configurations.

## Commit Message Guidelines
- **Description**: Use imperative mood (e.g., "add" not "added"). Do not capitalize. No period at the end. Keep it under 72 characters.
- **Body**: Explain the "why", not the "what" (the diff shows what). Wrap at 72 characters.
- **Footer**: Reference breaking changes (`BREAKING CHANGE:`) or close issues (`Closes #123`).
