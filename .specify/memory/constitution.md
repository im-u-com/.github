<!--
  Sync Impact Report
  ==================
  Version change: (none) → 1.0.0 (initial ratification)

  Principles established:
    I.   Spec-First Development
    II.  Clean Code
    III. DRY (Don't Repeat Yourself)
    IV.  Simplicity (YAGNI)
    V.   GitFlow & Conventional Commits
    VI.  English-Only

  Added sections:
    - Cross-Repo Architecture Constraints
    - CI/CD & Deployment Standards
    - Governance

  Removed sections: (none — initial version)

  Templates requiring updates:
    - .specify/templates/plan-template.md ✅ no update needed
      (Constitution Check section is generic; gates derive from this file at plan time)
    - .specify/templates/spec-template.md ✅ no update needed
      (mandatory sections already align: scenarios, requirements, success criteria)
    - .specify/templates/tasks-template.md ✅ no update needed
      (phase structure and test-first guidance align with principles)

  Follow-up TODOs: none
-->

# im-u Constitution

## Core Principles

### I. Spec-First Development

Every non-trivial feature MUST begin with a specification before any
implementation work starts. Specifications define user scenarios,
acceptance criteria, functional requirements, and success metrics.

Non-negotiable rules:

- Database schema changes (Supabase migrations) MUST have a spec.
- Cross-repo features (across multiple repos) MUST have a spec.
- New features requiring multiple acceptance scenarios MUST have a spec.

Exceptions (specs NOT required):

- Bug fixes within a single repo.
- UI-only changes using existing API endpoints.
- Documentation updates.
- Refactoring that does not change public interfaces.
- Dependency updates.

Rationale: Specifications prevent ambiguity, align human and AI
contributors, and produce traceable artifacts that survive personnel
changes. The spec-kit workflow (`/speckit.specify` -> `/speckit.plan`
-> `/speckit.tasks` -> `/speckit.implement`) enforces this discipline.

### II. Clean Code

All code MUST be readable, self-documenting, and maintainable.

Non-negotiable rules:

- Replace hard-coded values with named constants.
- Variables, functions, and classes MUST reveal their purpose; avoid
  abbreviations unless universally understood.
- Comments MUST explain *why*, never *what* — the code itself MUST be
  self-documenting.
- Each function MUST do exactly one thing (Single Responsibility).
- Related code MUST be grouped together; files and folders MUST follow
  consistent naming conventions.
- Implementation details MUST be hidden behind clear interfaces
  (Encapsulation).
- Leave code cleaner than you found it (Boy Scout Rule).

Rationale: im-u is a multi-repo, multi-stack organization. Code
clarity is the primary defense against cross-repo cognitive overload.

### III. DRY (Don't Repeat Yourself)

Duplication MUST be eliminated through proper abstraction — but only
when a clear pattern has emerged.

Non-negotiable rules:

- Code used in three or more places MUST be extracted into a shared
  utility, hook, or function.
- Configuration values (env vars, design tokens) MUST live in
  centralized files — never scattered across the codebase.
- Validation schemas, API integration patterns, error handling
  strategies, and shared type definitions MUST be reusable.
- Single sources of truth MUST be maintained for all shared knowledge.

Anti-patterns to avoid:

- Over-abstraction: do NOT abstract code used only once or twice.
- Premature optimization: do NOT create complex abstractions for simple,
  infrequently used code.
- God objects/functions: do NOT bundle unrelated responsibilities.
- Tight coupling: abstractions MUST NOT create unnecessary dependencies.

Rationale: DRY reduces maintenance burden and defect surface area, but
over-application creates worse problems than duplication. The three-use
threshold balances these forces.

### IV. Simplicity (YAGNI)

Every feature, abstraction, and configuration MUST justify its
complexity. Start with the simplest solution that satisfies current
requirements.

Non-negotiable rules:

- Do NOT add features, refactor code, or make improvements beyond what
  is requested.
- Do NOT design for hypothetical future requirements.
- Do NOT add error handling, fallbacks, or validation for scenarios that
  cannot occur.
- Three similar lines of code are better than a premature abstraction.
- Complexity MUST be justified in the plan's Complexity Tracking table
  when it exceeds what the constitution permits.

Rationale: YAGNI prevents speculative engineering that increases
maintenance cost without delivering value. im-u's multi-repo
architecture already introduces inherent complexity — every unnecessary
addition compounds it.

### V. GitFlow & Conventional Commits

All repositories MUST follow the unified branching model and commit
message format.

Non-negotiable rules (branching):

- All changes go to `develop` first via PR. Never push directly to
  `main`.
- Promote `develop` -> `main` via PR when the testing environment is
  validated.
- Hotfixes branch from `main` and merge to BOTH `main` and `develop`.
- Delete feature branches after merge.
- Branch naming: `<type>/<scope>/<description>` (e.g.,
  `feat/api/add-notebook-endpoint`).

Non-negotiable rules (commits):

- Format: `<type>(<scope>): <description>`.
- Description MUST use imperative mood, lowercase, no period, max 72
  characters.
- Body explains *why*, not *what*. Wrap at 72 characters.
- Footer references breaking changes (`BREAKING CHANGE:`) or closes
  issues (`Closes #123`).
- Valid types: `feat`, `fix`, `docs`, `style`, `refactor`, `perf`,
  `test`, `chore`, `ci`, `build`.

Rationale: Consistent branching and commit conventions enable automated
changelog generation, CI validation, and clear audit trails across all
repositories.

### VI. English-Only

All documentation, code comments, commit messages, PR descriptions,
specs, and inter-team communication MUST be written in English.

Non-negotiable rules:

- Existing non-English documents MUST be translated and migrated as part
  of the knowledge base consolidation effort.
- User-facing strings in website MUST be internationalized
  using the project's i18n library (i18next for website).
- When adding a new i18n key, translations MUST be provided for ALL
  supported locales (en, es, fr).
- Internal code, APIs, and documentation are English-only — i18n applies
  exclusively to user-facing UI strings.

Rationale: English is the lingua franca of the development team and AI
agents. A single documentation language eliminates translation drift and
enables unified search across the knowledge base.

## Cross-Repo Architecture Constraints

im-u comprises four repositories (agent, website, iac, kb) with
defined ownership boundaries. These constraints prevent architectural
drift.

- **Spec location**: Cross-repo feature specs live at the workspace root
  (`.specify/specs/<feature>/`). Tasks MUST be tagged per repo:
  `[AGENT]`, `[WEBSITE]`, `[KB]`.

## CI/CD & Deployment Standards

All deployable repositories MUST implement the standard CI/CD pipeline
and follow GitOps deployment practices.

- **PR validation**: Lint + Tests + Build (no push) on every PR to
  `develop` or `main`. Conventional Commits validation is enforced.
- **Merge to `develop`**: Lint + Tests + Build + Push + GitOps update.
  Docker image tagged with commit SHA -> testing environment.
- **Merge to `main`**: Same pipeline. Docker image tagged with commit
  SHA -> production environment.
- **Image tagging**: ALL image tags MUST use the commit SHA. The `latest`
  tag is prohibited. This enables deterministic deployments and rollback.
- **GitOps**: ArgoCD watches `iac/gitops/<env>/<app>.yaml` manifests.
  CI updates these files via `repository_dispatch` webhook. No manual
  deployments.
- **Code quality gates**: TypeScript repos MUST pass ESLint and Prettier
  with strict mode enabled.

## Governance

This constitution is the highest-authority document for im-u
development practices. It supersedes all other conventions, guides, and
informal agreements.

**Amendment procedure:**

1. Propose the change via PR with a clear rationale.
2. Update the constitution version following semantic versioning:
   - MAJOR: backward-incompatible principle removals or redefinitions.
   - MINOR: new principle or section added, or materially expanded
     guidance.
   - PATCH: clarifications, wording, typo fixes, non-semantic
     refinements.
3. Run the consistency propagation checklist: verify alignment with
   `plan-template.md`, `spec-template.md`, `tasks-template.md`, and
   all command files.
4. Include a Sync Impact Report as an HTML comment at the top of the
   updated file.

**Compliance review:**

- All PRs and code reviews MUST verify compliance with these principles.
- The plan template's Constitution Check gate MUST pass before
  implementation begins.
- Violations MUST be flagged and resolved before merge.

**Version**: 1.0.0 | **Ratified**: 2026-02-12 | **Last Amended**: 2026-02-12
