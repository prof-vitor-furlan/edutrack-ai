# Design

## Context

See `proposal.md` for motivation. According to `AGENTS.md`, the scope of this work is strictly constrained to defining the database schema. AI responsibility concludes upon file generation, without creating CRUD APIs, frontend code, or running automated pushes/syncs to Xano.

## Goals / Non-Goals

**Goals:**
- Provide the declarative table schema for `subjects` in XanoScript format (`.xs`).
- Specify exact column types and constraints: `id` (auto-increment primary key), `name` (text, non-null), `teacher` (text), `hours` (int), and `user_id` (foreign key to `user` table).

**Non-Goals:**
- Generating CRUD API endpoints (GET, POST, PUT, DELETE).
- Implementing test suites or frontend changes.
- Automated push, sync, or deployment to the Xano remote instance (developer handles push manually).

## Decisions

### Decision 1: XanoScript (`.xs`) declarative table structure
- **Choice**: Structure the table definition following standard XanoScript DSL:
  ```xanoscript
  table subjects {
    int id { primary = true, auto = true }
    text name
    text teacher
    int hours
    int user_id { dbtable = "user" }
  }
  ```
- **Rationale**: Xano CLI and Xano Developer tools expect `.xs` declarative files for version-controlled database schema management.

### Decision 2: Reference to authentication table
- **Choice**: Set `dbtable = "user"`.
- **Rationale**: Standard Xano workspaces create the default auth table named `user`. If a workspace uses `users`, this can be mapped directly in the XanoScript property.

## Risks / Trade-offs

- **[Risk: Auth table naming divergence (`user` vs `users`)]** → *Mitigation*: Specify the foreign key reference clearly with property `{ dbtable = "user" }` which can be adjusted if the target workspace uses pluralized naming.
