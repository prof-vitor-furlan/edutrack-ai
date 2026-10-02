// Query all STATUS_TRANSACAO1 records
query status_transacao1 verb=GET {
  api_group = "CRUD"

  input {
  }

  stack {
    db.query STATUS_TRANSACAO1 {
      return = {type: "list"}
    } as $status_transacao1
  }

  response = $status_transacao1
}