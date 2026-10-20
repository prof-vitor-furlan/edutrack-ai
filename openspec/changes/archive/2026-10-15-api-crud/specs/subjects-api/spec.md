# subjects-api Specification

## Purpose
Defines the RESTful CRUD API endpoints for managing academic subjects in Xano, enforcing authenticated user data isolation.

## ADDED Requirements

### Requirement: List authenticated user subjects
The system SHALL provide a GET `/subjects` endpoint requiring user authentication that returns only subjects where `user_id` equals the authenticated user's ID (`$auth.id`).

#### Scenario: User queries their subjects
- **WHEN** an authenticated user sends a GET request to `/subjects`
- **THEN** the system returns only subjects belonging to the authenticated user

### Requirement: Create subject for authenticated user
The system SHALL provide a POST `/subjects` endpoint requiring user authentication that persists a new subject record, automatically setting `user_id` to the authenticated user's ID (`$auth.id`).

#### Scenario: User creates a new subject
- **WHEN** an authenticated user sends valid subject data to POST `/subjects`
- **THEN** the system saves the subject with `user_id` assigned to the authenticated user and returns the created record

### Requirement: Update subject with ownership verification
The system SHALL provide a PATCH `/subjects/{subjects_id}` endpoint requiring user authentication that updates an existing subject record only if its `user_id` matches the authenticated user's ID (`$auth.id`). If the record does not exist or belongs to another user, the system SHALL return an error.

#### Scenario: User updates their own subject
- **WHEN** an authenticated user sends updated field data to PATCH `/subjects/{subjects_id}` for a subject they own
- **THEN** the system updates the subject record and returns the updated model

#### Scenario: User attempts to update another user's subject
- **WHEN** an authenticated user sends an update request to PATCH `/subjects/{subjects_id}` for a subject owned by someone else
- **THEN** the system rejects the request with an error and does not modify the subject

### Requirement: Delete subject with ownership verification
The system SHALL provide a DELETE `/subjects/{subjects_id}` endpoint requiring user authentication that removes a subject record only if its `user_id` matches the authenticated user's ID (`$auth.id`).

#### Scenario: User deletes their own subject
- **WHEN** an authenticated user sends a DELETE request to `/subjects/{subjects_id}` for a subject they own
- **THEN** the system deletes the record and returns a success response

#### Scenario: User attempts to delete another user's subject
- **WHEN** an authenticated user sends a DELETE request to `/subjects/{subjects_id}` for a subject owned by someone else
- **THEN** the system rejects the request with an error and leaves the record untouched

