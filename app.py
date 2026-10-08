import streamlit as st

# Configuração da Página (Título na aba do navegador)
st.set_page_config(page_title="EduTrack AI", page_icon="🎓", layout="wide")

# Inicialização do Estado (Session State) com Dados Iniciais (Seed)
def init_session_state():
    if "subjects" not in st.session_state:
        st.session_state["subjects"] = [
            {
                "id": 1,
                "name": "Engenharia de Software",
                "professor": "Prof. Vitor Furlan",
                "workload": 60,
                "status": "Ativa"
            },
            {
                "id": 2,
                "name": "Banco de Dados",
                "professor": "Prof. Carlos Eduardo",
                "workload": 80,
                "status": "Ativa"
            },
            {
                "id": 3,
                "name": "Inteligência Artificial",
                "professor": "Profa. Ana Silva",
                "workload": 60,
                "status": "Inativa"
            }
        ]

init_session_state()

# Título Principal
st.title("🎓 EduTrack AI")

# Sidebar (Menu Lateral)
st.sidebar.header("Menu")
menu_option = st.sidebar.radio("Navegar", ["Dashboard", "Disciplinas", "Tarefas"])

# Conteúdo Dinâmico
if menu_option == "Dashboard":
    st.write("Bem-vindo ao seu assistente acadêmico!")
    st.info("Conecte ao Xano para ver seus dados reais.")
    
    # Cálculo dinâmico das disciplinas ativas
    active_subjects_count = sum(1 for s in st.session_state["subjects"] if s["status"] == "Ativa")
    
    # Exemplo de Métrica Visual
    col1, col2 = st.columns(2)
    col1.metric("Disciplinas Ativas", str(active_subjects_count))
    col2.metric("Tarefas Pendentes", "0")

elif menu_option == "Disciplinas":
    st.subheader("Minhas Disciplinas")
    
    # Formulário de Cadastro de Nova Disciplina
    with st.expander("➕ Adicionar Nova Disciplina", expanded=False):
        with st.form("new_subject_form", clear_on_submit=True):
            name = st.text_input("Nome da Disciplina *", placeholder="Ex: Engenharia de Software")
            col_prof, col_hours, col_status = st.columns([2, 1, 1])
            with col_prof:
                professor = st.text_input("Professor(a)", placeholder="Ex: Prof. Vitor Furlan")
            with col_hours:
                workload = st.number_input("Carga Horária (horas)", min_value=1, max_value=300, value=60, step=10)
            with col_status:
                status = st.selectbox("Status", ["Ativa", "Inativa"])
            
            submitted = st.form_submit_button("Cadastrar Disciplina", use_container_width=True)
            if submitted:
                if not name.strip():
                    st.error("O nome da disciplina é obrigatório!")
                else:
                    # Checagem de duplicidade por nome
                    exists = any(s["name"].strip().lower() == name.strip().lower() for s in st.session_state["subjects"])
                    if exists:
                        st.warning(f"Já existe uma disciplina cadastrada com o nome '{name.strip()}'.")
                    else:
                        new_id = max([s["id"] for s in st.session_state["subjects"]], default=0) + 1
                        st.session_state["subjects"].append({
                            "id": new_id,
                            "name": name.strip(),
                            "professor": professor.strip() if professor.strip() else "Não informado",
                            "workload": int(workload),
                            "status": status
                        })
                        st.success(f"Disciplina '{name.strip()}' cadastrada com sucesso!")
                        st.rerun()

    # Listagem de Disciplinas
    subjects = st.session_state["subjects"]
    if not subjects:
        st.info("Nenhuma disciplina cadastrada ainda. Utilize o formulário acima para adicionar uma disciplina.")
    else:
        st.write(f"Total de disciplinas cadastradas: **{len(subjects)}**")
        for sub in subjects:
            with st.container(border=True):
                col_info, col_badge = st.columns([4, 1])
                with col_info:
                    st.markdown(f"### {sub['name']}")
                    st.caption(f"👨‍🏫 **Professor(a):** {sub['professor']} | ⏱️ **Carga Horária:** {sub['workload']}h")
                with col_badge:
                    if sub["status"] == "Ativa":
                        st.success("🟢 Ativa")
                    else:
                        st.warning("⚪ Inativa")

elif menu_option == "Tarefas":
    st.subheader("Gerenciamento de Tarefas")
    st.checkbox("Exemplo: Estudar Streamlit")