// Get FUNCIONARIO record
query "funcionario/{funcionario_id}" verb=GET {
  api_group = "CRUD"

  input {
    int funcionario_id? filters=min:1
  }

  stack {
    db.get "" {
      field_name = "id"
      field_value = $input.funcionario_id
    } as $funcionario
  
    precondition ($funcionario != null) {
      error_type = "notfound"
      error = "Not Found."
    }
  }

  response = $funcionario
}