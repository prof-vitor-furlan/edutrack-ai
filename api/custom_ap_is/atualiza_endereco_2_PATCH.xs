query atualizaEndereco2 verb=PATCH {
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
  
    int endereco_id? {
      table = "ENDERECO"
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
    
      headers = ["Content-Type:application/json"]
    } as $api1
  
    api.request {
      url = "https://x8ki-letl-twmt.n7.xano.io/api:PTPv3H7i/endereco/" ~$input.endereco_id
      method = "PATCH"
    } as $api2
  }

  response = $api2
  guid = "hnaMpZ5xlLkAuNk7HpZyns-SZfQ"
}