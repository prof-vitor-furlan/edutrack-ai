query salvaEndereco verb=POST {
  api_group = "CustomAPIs"

  input {
    text logradouro? filters=trim
    text numero? filters=trim
    text bairro? filters=trim
    text complemento? filters=trim
    text referencia? filters=trim
    text cep? filters=trim
    text cidade? filters=trim
    text estado? filters=trim
    bool padrao?
    int cliente_id? {
      table = "CLIENTE"
    }
  }

  stack {
    api.request {
      url = "https://x8ki-letl-twmt.n7.xano.io/api:e0QpZzWT/upsertCEP"
      method = "POST"
      params = {
        cep   : $input.cep
        cidade: $input.cidade
        estado: $input.estado
      }
    
      headers = ["Content-Type: application/json"]
    } as $api1
  
    api.request {
      url = "https://x8ki-letl-twmt.n7.xano.io/api:PTPv3H7i/endereco"
      method = "POST"
      params = {
        cliente_id : $input.cliente_id
        logradouro : $input.logradouro
        numero     : $input.numero
        cep_id     : $api1.response.result.id
        complemento: $input.complemento
        bairro     : $input.bairro
        referencia : $input.referencia
        padrao     : $input.padrao
      }
    
      headers = ["Content-Type: application/json"]
    } as $api2
  }

  response = {
    logradouro : $api2.response.result.logradouro
    numero     : $api2.response.result.numero
    complemento: $api2.response.result.complemento
    referencia : $api2.response.result.referencia
    padrao     : $api2.response.result.padrao
    cliente_id : $api2.response.result.cliente_id
    cep        : {
        "cep_id":$var.api1.response.result.id,
        "cidade":$var.api1.response.result.cidade,
        "estado":$var.api1.response.result.uf
    }
  }
}