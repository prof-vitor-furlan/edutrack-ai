// Query all FUNCIONARIO records
query funcionario verb=GET {
  api_group = "CRUD"

  input {
  }

  stack {
    db.query "" {
      return = {type: "list"}
    } as $funcionario
  }

  response = $funcionario
  guid = "fVrFgleqNMFcCtWjHEVFRkAgQU0"
}