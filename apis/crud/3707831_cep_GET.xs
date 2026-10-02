// Query all CEP records
query cep verb=GET {
  api_group = "CRUD"

  input {
  }

  stack {
    db.query CEP {
      return = {type: "list"}
    } as $model
  }

  response = $model
}