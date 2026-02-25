## Brief overview
This document outlines the "Don't Repeat Yourself" (DRY) principles for Im-U projects. It provides guidelines for creating reusable logic, components, and configurations to improve code maintainability and reduce redundancy.

## Core DRY Principles
- **Extract Reusable Logic**: If a piece of code is used in three or more places, it should be extracted into a shared location like a custom hook or utility function.
- **Component Composition**: Use composition patterns, such as creating shared prop interfaces or compound components, to build complex UIs from smaller, reusable parts.
- **Centralized Configuration**: Store all configuration values, such as environment variables and design tokens, in centralized files to avoid scattering them throughout the codebase.
- **Form Patterns**: Define reusable validation schemas and form hooks to handle form logic consistently across the application.
- **API Integration Patterns**: Abstract API interactions into reusable functions or hooks to streamline data fetching and mutations.
- **Styling Patterns**: Use utility-class variants (e.g., with `cva`) to create a consistent and reusable set of styling patterns for components.
- **Error Handling**: Implement a centralized error handling strategy with custom error classes and reusable handler functions.
- **Shared Type Definitions**: Create generic and shared TypeScript types to ensure data consistency across the application.

## Anti-Patterns to Avoid
- **Over-abstraction**: Avoid abstracting code that is only used once or twice. Wait for clear patterns to emerge.
- **Premature Optimization**: Don't create complex abstractions for simple, infrequently used code.
- **God Objects/Functions**: Avoid creating functions or objects that do too many unrelated things.
- **Tight Coupling**: Ensure that abstractions do not create unnecessary dependencies between different parts of the application.
