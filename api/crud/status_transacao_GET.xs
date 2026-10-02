// Query all STATUS_TRANSACAO records
query status_transacao verb=GET {
  api_group = "CRUD"

  input {
  }

  stack {
    db.query STATUS_TRANSACAO {
      return = {type: "list"}
    } as $status_transacao
  }

  response = $status_transacao
  guid = "fRvHIv1VCmacY3SqK_qbWV80lUo"
}