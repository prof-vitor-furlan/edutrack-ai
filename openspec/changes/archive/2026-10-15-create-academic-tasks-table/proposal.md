# Proposal

## Why

Students need a structured way to register and track their academic obligations (such as homework, exams, and projects) associated with their subjects. Defining the `academic_tasks` table schema in Xano provides the data structure for tracking task deadlines, status, and subject associations.

## What Changes

- Define the schema for the `academic_tasks` table in XanoScript (`.xs`) format with the following fields:
  - `id`: integer, auto-incrementing primary key
  - `title`: text, task title (required)
  - `description`: text, optional task description
  - `due_date`: date, task deadline
  - `status`: text, task status (defaulting to "pending")
  - `subject_id`: integer, foreign key referencing the `subjects` table
  - `user_id`: integer, foreign key referencing the `user` table (per EduTrack AI schema guidelines)
  - `created_at`: timestamp, record creation time
- Strictly adhere to `AGENTS.md` scope rules by limiting this change exclusively to the database table schema definition, without creating CRUD APIs, test suites, or frontend modifications.

## Capabilities

### New Capabilities
- `academic-tasks-schema`: Defines the backend database table schema, field types, and foreign key relationships for academic tasks linked to subjects and users.

### Modified Capabilities

## Impact

- Introduces the new XanoScript table definition file `table/academic_tasks.xs`.
- Establishes relational integrity linking academic tasks to subjects and authenticated users.
- No frontend or CRUD API components are created in this change.

