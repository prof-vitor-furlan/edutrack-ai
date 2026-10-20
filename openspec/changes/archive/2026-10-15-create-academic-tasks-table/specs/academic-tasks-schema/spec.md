# academic-tasks-schema Specification

## Purpose
Defines the database table schema, field types, and foreign key relationships for academic tasks in the Xano backend.

## ADDED Requirements

### Requirement: Academic tasks table schema definition
The backend database SHALL provide a table named `academic_tasks` with the following fields:
- `id`: Integer, auto-incrementing primary key.
- `title`: Text, task title representing the academic obligation.
- `description`: Text, optional details describing the task.
- `due_date`: Date, deadline for completing the task.
- `status`: Text, status of the task (e.g., "pending", "completed").
- `subject_id`: Integer, foreign key referencing the `subjects` table.
- `user_id`: Integer, foreign key referencing the `user` table.

#### Scenario: Academic tasks schema verification
- **WHEN** the `academic_tasks` schema is inspected
- **THEN** it contains `id` (auto integer), `title` (text), `description` (text), `due_date` (date), `status` (text), `subject_id` (foreign key to `subjects`), and `user_id` (foreign key to `user`)

### Requirement: Relational constraints for academic tasks
The `academic_tasks` table SHALL define relational constraints on `subject_id` referencing the `subjects` table and `user_id` referencing the `user` table.

#### Scenario: Foreign key references verification
- **WHEN** evaluating the foreign key definitions for `academic_tasks`
- **THEN** `subject_id` points to the `subjects` table and `user_id` points to the `user` table

