//  Add CLIENTE record
// novo comentario
query cliente verb=POST {
  api_group = "CRUD"

  input {
    dblink {
      table = "CLIENTE"
    }
  }

  stack {
    db.add CLIENTE {
      enforce_hidden_fields = false
      data = {
        created_at: "now"
        Nome      : $input.Nome
        user_id   : $input.user_id
      }
    } as $model
  }

  response = $model
}