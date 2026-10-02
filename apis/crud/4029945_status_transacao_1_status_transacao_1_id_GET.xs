// Get STATUS_TRANSACAO1 record
query "status_transacao1/{status_transacao1_id}" verb=GET {
  api_group = "CRUD"

  input {
    int status_transacao1_id? filters=min:1
  }

  stack {
    db.get STATUS_TRANSACAO1 {
      field_name = "id"
      field_value = $input.status_transacao1_id
    } as $status_transacao1
  
    precondition ($status_transacao1 != null) {
      error_type = "notfound"
      error = "Not Found."
    }
  }

  response = $status_transacao1
}