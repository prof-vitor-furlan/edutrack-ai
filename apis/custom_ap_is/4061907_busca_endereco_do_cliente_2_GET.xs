query BuscaEnderecoDoCliente2 verb=GET {
  api_group = "CustomAPIs"

  input {
    text authToken? filters=trim
  }

  stack {
    api.request {
      url = "https://x8ki-letl-twmt.n7.xano.io/api:e0QpZzWT/buscaCliente"
      method = "GET"
      params = {authtoken: $input.authToken}
      headers = ["Content-Type: application/json"]
    } as $api1
  
    db.query ENDERECO {
      where = $db.ENDERECO.cliente_id == `$var.api1.response.result.id`
      return = {type: "list"}
      addon = [
        {
          name : "CEP_4"
          input: {CEP_id: $output.cep_id}
          as   : "_cep_4"
        }
      ]
    } as $ENDERECO1
  }

  response = $ENDERECO1
}