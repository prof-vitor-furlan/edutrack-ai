# Design

## Context

See `proposal.md` for motivation. In accordance with `AGENTS.md`, this design strictly scopes the work to the database table schema definition. No CRUD APIs, test suites, or frontend modifications are included, and no automated pushes to Xano will be attempted.

## Goals / Non-Goals

**Goals:**
- Define the `academic_tasks` table schema in XanoScript (`.xs`) format conforming to the established project structure in `table/`.
- Include all requested fields (`title`, `description`, `due_date`, `status`, `subject_id`) along with primary key `id`, mandatory foreign key `user_id`, and `created_at` timestamp.
- Establish indexes for primary key and foreign keys (`subject_id`, `user_id`).

**Non-Goals:**
- Creating CRUD API endpoints (GET, POST, PATCH, DELETE).
- Implementing frontend UI components.
- Adding automated tests.
- Invoking push, sync, or deploy tools to Xano.

## Decisions

### Decision 1: Table schema declaration in XanoScript
- **Choice**: Structure `table/academic_tasks.xs` following existing project conventions seen in `table/subjects.xs`:
  ```xanoscript
  table academic_tasks {
    auth = false

    schema {
      int id
      text title filters=trim
      text description? filters=trim
      date due_date?
      text status?="pending" filters=trim
      int subject_id {
        table = "subjects"
      }
      int user_id {
        table = "user"
      }
      timestamp created_at?=now
    }

    index = [
      {type: "primary", field: [{name: "id"}]}
      {type: "btree", field: [{name: "subject_id", op: "asc"}]}
      {type: "btree", field: [{name: "user_id", op: "asc"}]}
    ]
  }
  ```
- **Rationale**: Follows the exact syntax established in `table/subjects.xs` and the guidelines in `AGENTS.md` (e.g. `text status?="pending"`).

### Decision 2: Mandatory `user_id` relationship
- **Choice**: Include `int user_id { table = "user" }`.
- **Rationale**: Explicit requirement in `AGENTS.md`: "Sempre use user_id para vincular ao usuário logado."

## Risks / Trade-offs

- **[Risk: Cascade behavior on subject deletion]** → *Mitigation*: The foreign key constraint links tasks to subjects. Deletion handling will be enforced by Xano database integrity rules.

