# Proposal

## Why

The profile page is currently empty, so users cannot create an account or sign in to EduTrack AI. Connecting that page to the existing Xano authentication endpoints enables account registration and login while loading the authenticated user's profile.

## What Changes

- Implement signup and login forms in `pages/3_👤_Perfil.py`.
- Use `auth/signup` and `auth/login` to create accounts and authenticate users, then use the returned token with `auth/me` to load the profile.
- Keep the authentication token and profile in Streamlit session state for the active session.
- Use the existing Xano `user` table through `auth/signup`; do not create or modify the table or authentication endpoints.

## Capabilities

### New Capabilities
- `user-authentication`: Register and sign in through the profile page, then retrieve and display the authenticated user's profile.

### Modified Capabilities

## Impact

- Affected application page: `pages/3_👤_Perfil.py`.
- Existing Xano endpoints: `auth/signup`, `auth/login`, and authenticated `auth/me`.
- Existing Xano table: `user`, populated by the existing signup endpoint.
- Existing Python dependency: `requests` is already listed in `requirements.txt`; no new dependency is expected.
