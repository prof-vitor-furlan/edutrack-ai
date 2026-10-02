// Query all STATUS_TTOKENIZACAO records
query status_ttokenizacao verb=GET {
  api_group = "CRUD"

  input {
  }

  stack {
    db.query STATUS_TTOKENIZACAO {
      return = {type: "list"}
    } as $status_ttokenizacao
  }

  response = $status_ttokenizacao
  guid = "Ajxu_3f5N9gq324MvtnKwu3B0d4"
}