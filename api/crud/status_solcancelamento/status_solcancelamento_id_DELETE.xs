// Delete STATUS_SOLCANCELAMENTO record.
query "status_solcancelamento/{status_solcancelamento_id}" verb=DELETE {
  api_group = "CRUD"

  input {
    int status_solcancelamento_id? filters=min:1
  }

  stack {
    db.del STATUS_SOLCANCELAMENTO {
      field_name = "id"
      field_value = $input.status_solcancelamento_id
    }
  }

  response = null
  guid = "78lFy93MnN40uzXhmRiCoaxvH6g"
}