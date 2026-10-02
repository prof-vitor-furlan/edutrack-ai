// Delete STATUS_TRANSACAO1 record.
query "status_transacao1/{status_transacao1_id}" verb=DELETE {
  api_group = "CRUD"

  input {
    int status_transacao1_id? filters=min:1
  }

  stack {
    db.del STATUS_TRANSACAO1 {
      field_name = "id"
      field_value = $input.status_transacao1_id
    }
  }

  response = null
}