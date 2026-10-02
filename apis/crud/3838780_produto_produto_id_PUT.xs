// Update PRODUTO record
query "produto/{produto_id}" verb=PUT {
  api_group = "CRUD"

  input {
    int produto_id? filters=min:1
    dblink {
      table = "PRODUTO"
    }
  }

  stack {
    db.edit PRODUTO {
      field_name = "id"
      field_value = $input.produto_id
      enforce_hidden_fields = false
      data = {
        nome     : $input.Nome
        descricao: $input.Descricao
        tipo     : $input.Tipo
      }
    } as $model
  }

  response = $model
}