// Add ENDERECO record
query endereco verb=POST {
  api_group = "CRUD"

  input {
    dblink {
      table = "ENDERECO"
    }
  }

  stack {
    db.add ENDERECO {
      enforce_hidden_fields = false
      data = {
        created_at : "now"
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
  guid = "5zQOY_FcPNjF6in9U951N2U7GQM"
}