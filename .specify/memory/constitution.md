<!--
SYNC IMPACT REPORT
==================
Version change: (none) → 1.0.0
Constitution status: Initial fill from template — all placeholders resolved.

Modified principles: N/A (first version)
Added sections:
  - Core Principles (5 principles)
  - Technology Stack & Platform Constraints
  - Development Workflow
  - Governance

Templates requiring updates:
  ✅ .specify/templates/plan-template.md — Constitution Check gate references verified; no changes needed.
  ✅ .specify/templates/spec-template.md — No constitution-specific mandatory sections required.
  ✅ .specify/templates/tasks-template.md — Task categories aligned with BLoC/Repository principles.

Deferred TODOs: None.
-->

# Quest-book Today Constitution

## Core Principles

### I. Flutter-First, Multi-Platform by Default

All features MUST be implemented using Flutter/Dart. Platform-specific code is
permitted only when Flutter APIs are insufficient; any platform channel MUST be
isolated behind an abstraction and documented. The primary targets are Android
and iOS; Linux/Windows/macOS/Web are secondary and MUST NOT break primary builds.
The Dart SDK version constraint is `>=3.1.3 <4.0.0`; no dependency may violate
this range.

### II. BLoC State Management (NON-NEGOTIABLE)

Every non-trivial piece of application state MUST be managed through a `Bloc`
or `Cubit` (flutter_bloc). Widgets MUST NOT hold business logic or perform
direct data access. Events and states MUST be immutable value types extending
`Equatable`. A single `BlocObserver` (`ApplicationObserver`) MUST be registered
at app startup for centralized logging.

### III. Repository Pattern — Strict Layer Separation

BLoCs MUST access data exclusively through repository interfaces. Providers
(network, local storage, VK SDK) MUST NOT be referenced from BLoC or UI layers.
Each repository MUST be independently instantiable and injectable. Breaking this
boundary requires explicit justification in the PR and a corresponding
architecture note in the feature plan.

### IV. Test Coverage for Every User Story

Every user story MUST have at least one widget test and one unit test for its
primary BLoC. Integration tests are REQUIRED when a feature touches authentication,
profile persistence, or category/quest storage. Tests are written before
implementation (TDD); a story is not complete until its tests pass in CI.
`flutter test` MUST pass with zero failures before merging.

### V. Simplicity & Family-Scope UX

The application is a family quest book. Features MUST serve real family usage
scenarios; speculative or admin-only features MUST NOT be added without explicit
user story justification. YAGNI applies: start with the simplest passing
implementation, then iterate. UI complexity MUST be minimized — prefer standard
Material widgets over custom implementations unless the user story explicitly
requires custom UX.

## Technology Stack & Platform Constraints

The canonical stack is:

- **Language**: Dart 3.x (`sdk: '>=3.1.3 <4.0.0'`)
- **Framework**: Flutter (stable channel)
- **State Management**: flutter_bloc 8.x + bloc 8.x
- **Auth**: flutter_login_vk 2.x (VK OAuth)
- **Persistence**: shared_preferences (lightweight), path_provider (file paths)
- **Serialization**: json_annotation + json_serializable (generated via build_runner)
- **Testing**: flutter_test (unit + widget), integration_test (end-to-end)

Introducing a new dependency MUST be justified in the feature spec and MUST NOT
conflict with the Dart SDK range. Dependencies that require native build tooling
MUST be verified on all primary targets before merge.

## Development Workflow

1. Every new feature MUST start with a Spec Kit specification (`/speckit-specify`).
2. A plan MUST be created before implementation (`/speckit-plan`).
3. Tasks MUST be generated from the plan (`/speckit-tasks`).
4. Implementation MUST follow tasks in dependency order (`/speckit-implement`).
5. `flutter analyze` and `flutter test` MUST pass before a feature is considered done.
6. `build_runner` MUST be re-run whenever annotated models change:
   `dart run build_runner build --delete-conflicting-outputs`.

## Governance

This constitution supersedes all other development practices for this repository.
Amendments require:
1. A written rationale in the PR description.
2. Version increment following the semantic versioning policy below:
   - **MAJOR**: Removal or redefinition of a Core Principle.
   - **MINOR**: Addition of a new principle or material expansion of an existing one.
   - **PATCH**: Clarification, wording fix, or non-semantic refinement.
3. All dependent templates reviewed and updated in the same PR.

All feature plans MUST include a "Constitution Check" gate that verifies
compliance with principles I–V before Phase 1 design begins.

**Version**: 1.0.0 | **Ratified**: 2026-07-19 | **Last Amended**: 2026-07-19
