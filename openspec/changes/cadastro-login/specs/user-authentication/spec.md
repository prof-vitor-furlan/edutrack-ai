# Spec Delta

## Purpose

Defines account registration and login from the profile page, including retrieval of the authenticated user's profile using the existing Xano authentication endpoints.

## ADDED Requirements

### Requirement: Register an account from the profile page
The system SHALL allow a visitor to submit a name, email address, and password from the profile page. On successful signup, the existing `auth/signup` endpoint SHALL create the account in the Xano `user` table and return an authentication token.

#### Scenario: Successful account registration
- **WHEN** a visitor submits valid name, email, and password values
- **THEN** the system sends those values to `auth/signup`, receives the authentication token, and loads the new user's profile using `auth/me`

#### Scenario: Email address is already registered
- **WHEN** a visitor submits an email address that is already in use
- **THEN** the system displays an understandable registration error and does not present the signup as successful

### Requirement: Sign in from the profile page
The system SHALL allow a registered user to submit an email address and password to the existing `auth/login` endpoint.

#### Scenario: Successful login
- **WHEN** a registered user submits valid credentials
- **THEN** the system receives an authentication token and loads that user's profile from `auth/me` using the token as a Bearer credential

#### Scenario: Invalid login credentials
- **WHEN** a user submits credentials that the authentication endpoint rejects
- **THEN** the system displays an understandable login error and does not present the user as authenticated

### Requirement: Display the authenticated user's profile
The system SHALL use the authentication token returned by signup or login to retrieve the user's profile from `auth/me` and display the returned user information on the profile page. The token and profile SHALL remain available in the active Streamlit session.

#### Scenario: Profile is retrieved after authentication
- **WHEN** signup or login returns an authentication token and `auth/me` succeeds
- **THEN** the profile page displays the user information returned by `auth/me` and retains the authentication state for the active session

#### Scenario: Profile retrieval fails
- **WHEN** `auth/me` cannot retrieve the profile after signup or login
- **THEN** the system displays an authentication/profile error and does not display an empty or fabricated profile as a successful result

### Requirement: Protect authentication credentials
The system SHALL NOT display or log the submitted password or authentication token. Authentication requests SHALL send credentials only to the configured Xano authentication endpoints, using values loaded from the project environment configuration.

#### Scenario: Authentication data is submitted
- **WHEN** the user submits a signup or login form
- **THEN** the password is sent only in the HTTPS authentication request and is not rendered in the profile or success messages
