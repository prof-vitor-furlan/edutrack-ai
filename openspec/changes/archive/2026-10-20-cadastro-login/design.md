# Design

## Context

See `proposal.md` for motivation. The profile page is empty and the repository has no Python integration with Xano yet. The existing Xano endpoints accept JSON fields `name`, `email`, and `password` for signup and `email` and `password` for login. Both POST endpoints return `authToken`; authenticated `auth/me` returns the user's profile. The `auth/signup` endpoint already persists the account in the `user` table.

## Goals / Non-Goals

**Goals:**
- Implement the requested authentication flow in the profile page using the existing HTTP client dependency.
- Preserve authentication state only for the active Streamlit session and use the Xano profile response as the displayed user data.
- Surface endpoint and connectivity failures without exposing passwords or tokens.

**Non-Goals:**
- Change the Xano table or authentication endpoints.
- Add logout, password recovery, account editing, or other profile operations.
- Persist credentials beyond the active Streamlit session.

## Decisions

### Configure the Xano endpoint base URL through a project-root `.env` file

Read `XANO_API_BASE_URL` from the environment after loading a project-root `.env` file with `python-dotenv`, then append the existing `auth/signup`, `auth/login`, and `auth/me` paths. This keeps the endpoint configuration outside the codebase and matches the developer preference for local environment-based setup. If the setting is absent, report a configuration error rather than silently falling back to another host.

### Use the endpoint contracts directly

Send signup and login form values as JSON to their corresponding POST endpoints. After either endpoint returns `authToken`, call `auth/me` with `Authorization: Bearer <authToken>`. Keep the token and returned profile in `st.session_state` and render profile details from that response. This follows the existing Xano contracts without introducing another API or storing duplicate user data in the frontend.

### Handle requests and credentials explicitly

Use `requests` (already present in `requirements.txt`) with a finite timeout, HTTPS URLs, and explicit HTTP/JSON error handling. Render password inputs as masked fields, avoid logging request payloads or tokens, and show a user-facing error for rejected credentials, network errors, invalid responses, or profile retrieval failures. Do not mark the user authenticated until `auth/me` returns a valid profile.

## Risks / Trade-offs

- [The page cannot connect until each deployment supplies `XANO_API_BASE_URL` in Streamlit secrets] → Report the missing setting clearly; do not embed or guess a remote endpoint.
- [The Xano authentication token expires after 24 hours, as configured by the existing endpoints] → Keep it only in the active session and surface an authentication failure from `auth/me` rather than treating a failed request as a valid profile.
- [A signup can create the account even if the subsequent `auth/me` request fails] → Report that the profile could not be loaded and avoid presenting a fabricated authenticated state.

## Migration Plan

No backend migration is required. Configure `XANO_API_BASE_URL` for the Streamlit deployment before using the page. Roll back by reverting the profile-page implementation; the existing Xano table and endpoints remain unchanged.
