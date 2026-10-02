// Query all TRANSACAO records
query transacao verb=GET {
  api_group = "CRUD"

  input {
  }

  stack {
    db.query TRANSACAO {
      return = {type: "list"}
    } as $transacao
  }

  response = $transacao
  guid = "fwsZJ5tKMzRSwgZbqgptyzPsFCE"
}