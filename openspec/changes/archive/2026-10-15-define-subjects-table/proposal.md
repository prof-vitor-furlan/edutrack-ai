# Proposal

## Why

To support persistent backend storage and multi-user isolation for academic subjects in Xano, a formal database table schema for `subjects` is required, linking registered subjects to authenticated users.

## What Changes

- Define the schema for the `subjects` table in XanoScript format (`.xs`) with the following fields:
  - `id`: integer, auto-incrementing primary key
  - `name`: text, subject title (required)
  - `teacher`: text, instructor or professor name
  - `hours`: integer, workload in hours
  - `user_id`: integer, foreign key reference to the Xano auth table (`user`)
- Adhere strictly to the scope boundaries in `AGENTS.md` by limiting tasks and artifacts exclusively to the table schema definition without adding CRUD APIs, test suites, or frontend components.

## Capabilities

### New Capabilities
- `subjects-schema`: Defines the database table structure, field constraints, and foreign key relationships for academic subjects in the backend.

### Modified Capabilities

## Impact

- Introduces the XanoScript database table definition file for `subjects`.
- Prepares the backend data model for future user-scoped subject persistence.
- No frontend or CRUD API modifications are introduced in this change.
