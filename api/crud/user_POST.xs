// Add user record
query user verb=POST {
  api_group = "CRUD"

  input {
    dblink {
      table = "user"
    }
  }

  stack {
    db.add user {
      enforce_hidden_fields = false
      data = {
        created_at: "now"
        name      : $input.name
        email     : $input.email
        codigo    : $input.codigo
        validade  : $input.validade
      }
    } as $model
  }

  response = $model
  guid = "ugD73Z4wKmdlUThiCo75d2Tg7Tg"
}