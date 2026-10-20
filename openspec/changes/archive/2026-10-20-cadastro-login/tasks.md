# Tasks

## 1. Profile page authentication

- [x] 1.1 Implement signup and login forms in pages/3_👤_Perfil.py, load XANO_API_BASE_URL from the project-root environment configuration, and send the required form fields to uth/signup or uth/login; verify each form reaches its matching endpoint and reports configuration or request failures clearly.
- [x] 1.2 Retain the returned token in the active Streamlit session, call uth/me with Bearer authentication, and display the returned profile only after a successful response; verify both a successful profile load and a failed profile request do not produce a fabricated authenticated state.
