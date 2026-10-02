// Query all PRODUTO records
query produto verb=GET {
  api_group = "CRUD"

  input {
  }

  stack {
    db.query PRODUTO {
      return = {type: "list"}
    } as $model
  }

  response = $model
}