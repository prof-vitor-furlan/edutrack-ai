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
  guid = "Vm0Ao22Z0X3rUClCOrPKVoMXBJM"
}