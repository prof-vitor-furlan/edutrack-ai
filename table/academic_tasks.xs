// Tabela de tarefas e obrigações acadêmicas vinculadas a disciplinas e usuários
table academic_tasks {
  auth = false

  schema {
    // Identificador único da tarefa acadêmica
    int id

    // Título da obrigação acadêmica (lição, prova, trabalho)
    text title filters=trim

    // Descrição detalhada da tarefa
    text description? filters=trim

    // Data limite / prazo da tarefa acadêmica
    date due_date?

    // Status da tarefa (ex: "pending", "completed")
    text status?="pending" filters=trim

    // Identificador da disciplina associada
    int subject_id {
      table = "subjects"
    }

    // Identificador do usuário proprietário da tarefa
    int user_id {
      table = "user"
    }

    // Data e hora de criação do registro
    timestamp created_at?=now
  }

  index = [
    {type: "primary", field: [{name: "id"}]}
    {type: "btree", field: [{name: "subject_id", op: "asc"}]}
    {type: "btree", field: [{name: "user_id", op: "asc"}]}
  ]
  guid = "wV9kknIroEWCMP_jHZ_2nA2NZMs"
}

