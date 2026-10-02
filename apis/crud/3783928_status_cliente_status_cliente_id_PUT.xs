// Update STATUS_CLIENTE record
query "status_cliente/{status_cliente_id}" verb=PUT {
  api_group = "CRUD"

  input {
    int status_cliente_id? filters=min:1
    dblink {
      table = "STATUS_CLIENTE"
    }
  }

  stack {
    db.edit STATUS_CLIENTE {
      field_name = "id"
      field_value = $input.status_cliente_id
      enforce_hidden_fields = false
      data = {}
    } as $model
  }

  response = $model
}