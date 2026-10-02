// Delete FUNCIONARIO record.
query "funcionario/{funcionario_id}" verb=DELETE {
  api_group = "CRUD"

  input {
    int funcionario_id? filters=min:1
  }

  stack {
    db.del "" {
      field_name = "id"
      field_value = $input.funcionario_id
    }
  }

  response = null
}