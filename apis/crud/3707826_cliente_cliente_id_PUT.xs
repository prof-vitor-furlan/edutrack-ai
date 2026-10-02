// Update CLIENTE record
query "cliente/{cliente_id}" verb=PUT {
  api_group = "CRUD"

  input {
    int cliente_id? filters=min:1
    dblink {
      table = "CLIENTE"
    }
  }

  stack {
    db.edit CLIENTE {
      field_name = "id"
      field_value = $input.cliente_id
      enforce_hidden_fields = false
      data = {Nome: $input.Nome, user_id: $input.user_id}
    } as $model
  }

  response = $model
}