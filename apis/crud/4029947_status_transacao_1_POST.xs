// Add STATUS_TRANSACAO1 record
query status_transacao1 verb=POST {
  api_group = "CRUD"

  input {
    dblink {
      table = "STATUS_TRANSACAO1"
    }
  }

  stack {
    db.add STATUS_TRANSACAO1 {
      enforce_hidden_fields = false
      data = {created_at: "now"}
    } as $status_transacao1
  }

  response = $status_transacao1
}