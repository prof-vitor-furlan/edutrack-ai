# Proposal

## Why

Students need a secure backend interface to create, list, update, and delete their academic subjects and tasks. Implementing RESTful CRUD endpoints in Xano with user authentication ensures that each student has full management over their coursework while strictly preventing unauthorized access to other students' data.

## What Changes

- Create RESTful CRUD endpoints in XanoScript (`.xs`) for the `subjects` table:
  - `GET /subjects`: List all subjects belonging to the authenticated user (`user_id == $auth.id`).
  - `POST /subjects`: Create a new subject assigned to the authenticated user (`user_id = $auth.id`).
  - `PATCH /subjects/{id}`: Update an existing subject ensuring it belongs to the authenticated user.
  - `DELETE /subjects/{id}`: Delete a subject ensuring it belongs to the authenticated user.
- Create RESTful CRUD endpoints in XanoScript (`.xs`) for the `academic_tasks` table:
  - `GET /academic_tasks`: List all tasks belonging to the authenticated user (`user_id == $auth.id`).
  - `POST /academic_tasks`: Create a new task assigned to the authenticated user (`user_id = $auth.id`).
  - `PATCH /academic_tasks/{id}`: Update an existing task ensuring it belongs to the authenticated user.
  - `DELETE /academic_tasks/{id}`: Delete a task ensuring it belongs to the authenticated user.
- Enforce mandatory authentication (`auth = "user"`) and user-level isolation across all queries.
- Strictly adhere to `AGENTS.md` guidelines:
  - Endpoints follow RESTful naming conventions.
  - All database queries filter by authenticated `user_id`.
  - Tasks in `tasks.md` are limited strictly to the requested CRUD API endpoints.

## Capabilities

### New Capabilities
- `subjects-api`: RESTful CRUD endpoints for managing subjects with authenticated user isolation.
- `academic-tasks-api`: RESTful CRUD endpoints for managing academic tasks with authenticated user isolation.

### Modified Capabilities

## Impact

- Adds XanoScript API query files under `api/subjects/` and `api/academic_tasks/`.
- Does not modify database tables or frontend Streamlit components.

