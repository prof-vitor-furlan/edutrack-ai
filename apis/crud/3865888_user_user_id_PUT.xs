// Update user record
query "user/{user_id}" verb=PUT {
  api_group = "CRUD"

  input {
    int user_id? filters=min:1
    dblink {
      table = "user"
    }
  }

  stack {
    db.edit user {
      field_name = "id"
      field_value = $input.user_id
      enforce_hidden_fields = false
      data = {
        name    : $input.name
        email   : $input.email
        codigo  : $input.codigo
        validade: $input.validade
      }
    } as $model
  }

  response = $model
}