// Exclui registro de CEP
query "cep/{cep_id}" verb=DELETE {
  api_group = "CRUD"

  input {
    int cep_id? filters=min:1
  }

  stack {
    db.del CEP {
      field_name = "id"
      field_value = $input.cep_id
    }
  }

  response = null
  guid = "IXr8s6oDUQzQx39zE40WUAikums"
}