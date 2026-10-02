// Delete SOLCANCELAMENTO record.
query "solcancelamento/{solcancelamento_id}" verb=DELETE {
  api_group = "CRUD"

  input {
    int solcancelamento_id? filters=min:1
  }

  stack {
    db.del SOLCANCELAMENTO {
      field_name = "id"
      field_value = $input.solcancelamento_id
    }
  }

  response = null
}