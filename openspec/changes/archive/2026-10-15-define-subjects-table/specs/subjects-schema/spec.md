# Spec Delta

## Purpose

Defines the database table schema, field types, and relational constraints for the subjects table in the Xano backend.

## ADDED Requirements

### Requirement: Subjects table schema definition
The backend database SHALL provide a table named `subjects` with the following fields:
- `id`: Integer, auto-incrementing primary key.
- `name`: Text, non-empty subject name.
- `teacher`: Text, representing the instructor or professor name.
- `hours`: Integer, representing the course workload in hours.
- `user_id`: Integer, foreign key referencing the `user` table.

#### Scenario: Subjects table schema verification
- **WHEN** the `subjects` table schema is inspected
- **THEN** it contains `id` (auto integer), `name` (text), `teacher` (text), `hours` (integer), and `user_id` (foreign key reference to `user`)

### Requirement: Foreign key constraint to user table
The `subjects` table SHALL define a relational constraint on `user_id` pointing to the Xano authentication table (`user`) to associate each subject with its owner.

#### Scenario: Foreign key relationship verification
- **WHEN** evaluating the schema definition for `user_id`
- **THEN** the field is configured as a reference pointing to the `user` table
