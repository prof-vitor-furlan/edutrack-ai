import os
from pathlib import Path

import streamlit as st
import requests


st.set_page_config(page_title="Perfil", page_icon="👤")


ROOT_DIR = Path(__file__).resolve().parents[1]
ENV_FILE = ROOT_DIR / ".env"


def load_env_file() -> None:
    if not ENV_FILE.exists():
        return

    for raw_line in ENV_FILE.read_text(encoding="utf-8").splitlines():
        line = raw_line.strip()
        if not line or line.startswith("#") or "=" not in line:
            continue

        key, value = line.split("=", 1)
        key = key.strip()
        value = value.strip().strip('"').strip("'")
        os.environ.setdefault(key, value)


load_env_file()


def get_api_base_url() -> str:
    base_url = os.getenv("XANO_API_BASE_URL", "").strip().rstrip("/")
    if not base_url:
        st.error("Configure a variável `XANO_API_BASE_URL` no arquivo .env da raiz do projeto antes de usar o perfil.")
        st.stop()
    return base_url


def get_profile_from_token(token: str):
    response = requests.get(
        f"{get_api_base_url()}/auth/me",
        headers={"Authorization": f"Bearer {token}"},
        timeout=15,
    )

    try:
        payload = response.json()
    except ValueError:
        payload = {}

    if response.status_code != 200 or not isinstance(payload, dict):
        raise ValueError(payload.get("error") or payload.get("message") or "Não foi possível carregar o perfil do usuário.")

    return payload


def handle_auth_response(response, action_name: str):
    try:
        payload = response.json()
    except ValueError:
        payload = {}

    if response.status_code >= 400:
        raise ValueError(payload.get("error") or payload.get("message") or f"{action_name} falhou.")

    token = payload.get("authToken")
    if not token:
        raise ValueError(payload.get("error") or payload.get("message") or f"Resposta inválida ao {action_name.lower()}.")

    return token


if "auth_token" not in st.session_state:
    st.session_state.auth_token = None

if "profile" not in st.session_state:
    st.session_state.profile = None


st.title("👤 Meu Perfil")

if st.session_state.auth_token and st.session_state.profile:
    profile = st.session_state.profile
    st.success("Sessão autenticada com sucesso.")
    col_info, col_actions = st.columns([3, 1])

    with col_info:
        st.subheader(f"Olá, {profile.get('name') or 'Usuário'}")
        st.write(f"Email: {profile.get('email', 'Não informado')}")
        st.write(f"ID: {profile.get('id', 'Não informado')}")
        if profile.get("created_at"):
            st.write(f"Cadastro: {profile.get('created_at')}")

    with col_actions:
        if st.button("Sair"):
            st.session_state.auth_token = None
            st.session_state.profile = None
            st.rerun()

else:
    st.info("Faça login ou cadastre-se para acessar seu perfil.")

    tab_login, tab_signup = st.tabs(["🔐 Login", "📝 Cadastro"])

    with tab_login:
        with st.form("login_form"):
            email = st.text_input("Email", placeholder="seu@email.com")
            password = st.text_input("Senha", type="password")
            submitted = st.form_submit_button("Entrar")

            if submitted:
                if not email or not password:
                    st.error("Informe email e senha para continuar.")
                else:
                    try:
                        login_response = requests.post(
                            f"{get_api_base_url()}/auth/login",
                            json={"email": email, "password": password},
                            timeout=15,
                        )
                        token = handle_auth_response(login_response, "Login")
                        profile = get_profile_from_token(token)
                        st.session_state.auth_token = token
                        st.session_state.profile = profile
                        st.success("Login realizado com sucesso!")
                        st.rerun()
                    except ValueError as exc:
                        st.error(str(exc))
                    except requests.RequestException:
                        st.error("Não foi possível conectar ao backend de autenticação.")

    with tab_signup:
        with st.form("signup_form"):
            name = st.text_input("Nome completo")
            email = st.text_input("Email", key="signup_email", placeholder="seu@email.com")
            password = st.text_input("Senha", type="password", key="signup_password")
            submitted = st.form_submit_button("Criar conta")

            if submitted:
                if not name or not email or not password:
                    st.error("Informe nome, email e senha para criar a conta.")
                else:
                    try:
                        signup_response = requests.post(
                            f"{get_api_base_url()}/auth/signup",
                            json={"name": name, "email": email, "password": password},
                            timeout=15,
                        )
                        token = handle_auth_response(signup_response, "Cadastro")
                        profile = get_profile_from_token(token)
                        st.session_state.auth_token = token
                        st.session_state.profile = profile
                        st.success("Cadastro realizado com sucesso!")
                        st.rerun()
                    except ValueError as exc:
                        st.error(str(exc))
                    except requests.RequestException:
                        st.error("Não foi possível conectar ao backend de autenticação.")
