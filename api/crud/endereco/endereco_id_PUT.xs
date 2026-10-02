// Update ENDERECO record
query "endereco/{endereco_id}" verb=PUT {
  api_group = "CRUD"

  input {
    int endereco_id? filters=min:1
    dblink {
      table = "ENDERECO"
    }
  }

  stack {
    db.edit ENDERECO {
      field_name = "id"
      field_value = $input.endereco_id
      enforce_hidden_fields = false
      data = {
        cliente_id : $input.cliente_id
        logradouro : $input.logradouro
        numero     : $input.numero
        cep_id     : $input.cep_id
        complemento: $input.complemento
        bairro     : $input.bairro
        referencia : $input.referencia
        padrao     : $input.padrao
      }
    } as $model
  }

  response = $model
  guid = "jWwvAUlBL9AMLCy8QkJwmjSaWWA"
}