// Query all ENDERECO records
query endereco verb=GET {
  api_group = "CRUD"

  input {
  }

  stack {
    db.query ENDERECO {
      return = {type: "list"}
    } as $model
  }

  response = $model
}