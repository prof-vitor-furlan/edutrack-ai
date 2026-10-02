// Add PRODUTO record
query produto verb=POST {
  api_group = "CRUD"

  input {
    dblink {
      table = "PRODUTO"
    }
  }

  stack {
    db.add PRODUTO {
      enforce_hidden_fields = false
      data = {
        created_at: "now"
        nome      : $input.Nome
        descricao : $input.Descricao
        tipo      : $input.Tipo
      }
    } as $model
  }

  response = $model
}