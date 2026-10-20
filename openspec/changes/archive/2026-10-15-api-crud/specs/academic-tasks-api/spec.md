# academic-tasks-api Specification

## Purpose
Defines the RESTful CRUD API endpoints for managing academic obligations and tasks in Xano, ensuring authenticated user data isolation.

## ADDED Requirements

### Requirement: List authenticated user academic tasks
The system SHALL provide a GET `/academic_tasks` endpoint requiring user authentication that returns only tasks where `user_id` matches the authenticated user's ID (`$auth.id`).

#### Scenario: User queries their academic tasks
- **WHEN** an authenticated user calls GET `/academic_tasks`
- **THEN** the system returns a list of tasks belonging exclusively to the authenticated user

### Requirement: Create academic task for authenticated user
The system SHALL provide a POST `/academic_tasks` endpoint requiring user authentication that creates a new task record, linking it to the specified `subject_id` and automatically assigning `user_id` to the authenticated user's ID (`$auth.id`).

#### Scenario: User creates an academic task
- **WHEN** an authenticated user sends valid task data including `title` and `subject_id` to POST `/academic_tasks`
- **THEN** the system creates the task record associated with the authenticated user and returns the created model

### Requirement: Update academic task with ownership verification
The system SHALL provide a PATCH `/academic_tasks/{academic_tasks_id}` endpoint requiring user authentication that updates an existing task record only if its `user_id` matches the authenticated user's ID (`$auth.id`).

#### Scenario: User updates their own task
- **WHEN** an authenticated user sends updated task attributes to PATCH `/academic_tasks/{academic_tasks_id}` for a task they own
- **THEN** the system updates the task and returns the updated model

#### Scenario: User attempts to update another user's task
- **WHEN** an authenticated user sends an update request to PATCH `/academic_tasks/{academic_tasks_id}` for a task owned by another user
- **THEN** the system rejects the request with an error and does not modify the record

### Requirement: Delete academic task with ownership verification
The system SHALL provide a DELETE `/academic_tasks/{academic_tasks_id}` endpoint requiring user authentication that removes a task record only if its `user_id` matches the authenticated user's ID (`$auth.id`).

#### Scenario: User deletes their own task
- **WHEN** an authenticated user sends a DELETE request to `/academic_tasks/{academic_tasks_id}` for a task they own
- **THEN** the system deletes the task record from the database

#### Scenario: User attempts to delete another user's task
- **WHEN** an authenticated user sends a DELETE request to `/academic_tasks/{academic_tasks_id}` for a task owned by another user
- **THEN** the system rejects the request and keeps the record unchanged

