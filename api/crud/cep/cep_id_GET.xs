// Get CEP record
query "cep/{cep_id}" verb=GET {
  api_group = "CRUD"

  input {
    int cep_id? filters=min:1
  }

  stack {
    db.get CEP {
      field_name = "id"
      field_value = $input.cep_id
    } as $model
  
    precondition ($model != null) {
      error_type = "notfound"
      error = "Not Found"
    }
  }

  response = $model
  guid = "8gE5ONTRy34NwCrR4E7spI0Lz98"
}