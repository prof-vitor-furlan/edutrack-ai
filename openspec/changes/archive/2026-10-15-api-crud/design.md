# Design

## Context

See `proposal.md` for motivation. EduTrack AI requires RESTful CRUD endpoints for `subjects` and `academic_tasks`. Per `AGENTS.md` rules, every endpoint must enforce authentication (`auth = "user"`) and filter queries by the authenticated user's ID (`$auth.id`) to guarantee multi-user isolation.

## Goals / Non-Goals

**Goals:**
- Provide complete RESTful CRUD endpoints for `subjects`:
  - `GET /subjects`
  - `POST /subjects`
  - `PATCH /subjects/{subjects_id}`
  - `DELETE /subjects/{subjects_id}`
- Provide complete RESTful CRUD endpoints for `academic_tasks`:
  - `GET /academic_tasks`
  - `POST /academic_tasks`
  - `PATCH /academic_tasks/{academic_tasks_id}`
  - `DELETE /academic_tasks/{academic_tasks_id}`
- Enforce `auth = "user"` on every query definition.
- Filter read queries by `where = $db.<table_name>.user_id == $auth.id`.
- Enforce ownership validation (`precondition ($model != null && $model.user_id == $auth.id)`) on all PATCH and DELETE operations.
- Automatically assign `user_id: $auth.id` on all POST operations.

**Non-Goals:**
- Frontend Streamlit modifications.
- Deploying or syncing to the live Xano server (handled manually by developer).

## Decisions

### Decision 1: Directory and File Structure in `api/`
- **Choice**: Organize endpoints in dedicated group folders following project Xano conventions:
  - `api/subjects/`:
    - `subjects.xs` (api_group configuration)
    - `subjects_GET.xs`
    - `subjects_POST.xs`
    - `subjects_id_PATCH.xs`
    - `subjects_id_DELETE.xs`
  - `api/academic_tasks/`:
    - `academic_tasks.xs` (api_group configuration)
    - `academic_tasks_GET.xs`
    - `academic_tasks_POST.xs`
    - `academic_tasks_id_PATCH.xs`
    - `academic_tasks_id_DELETE.xs`
- **Rationale**: Follows standard Xano CLI local workspace structure (comparable to `api/crud/` and `api/custom_ap_is/`).

### Decision 2: Multi-tenant Security Pattern
- **Choice**:
  - `GET`: uses `where = $db.subjects.user_id == $auth.id`.
  - `POST`: injects `user_id: $auth.id` into `db.add data`.
  - `PATCH` / `DELETE`: performs `db.get` and asserts `precondition ($record != null && $record.user_id == $auth.id)` before applying `db.patch` or `db.del`.
- **Rationale**: Prevents unauthorized access or modification across users.

## Risks / Trade-offs

- **[Risk: Tampering with `user_id` input]** → *Mitigation*: Do not accept `user_id` as user input on `POST` or `PATCH`. Always bind `user_id` strictly from `$auth.id`.

