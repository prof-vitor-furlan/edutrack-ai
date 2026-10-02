query buscaEnderecoDoCliente verb=GET {
  api_group = "CustomAPIs"

  input {
    text authtoken? filters=trim
  }

  stack {
    api.request {
      url = "https://x8ki-letl-twmt.n7.xano.io/api:e0QpZzWT/buscaCliente"
      method = "GET"
      params = {authtoken: $input.authtoken}
      headers = ["Content-Type: application/json"]
    } as $api1
  
    db.query ENDERECO {
      where = $db.ENDERECO.cliente_id == `$var.api1.response.result.id`
      return = {type: "list"}
      addon = [
        {
          name : "CEP_3"
          input: {CEP_id: $output.cep_id}
          as   : "_cep_3"
        }
      ]
    } as $ENDERECO1
  }

  response = $ENDERECO1
  guid = "bCMnZKMiqgXv1Gm2Ay5ekL2pq6Y"
}