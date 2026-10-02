query CadastraCliente2 verb=POST {
  api_group = "CustomAPIs"

  input {
    text nome? filters=trim
    text email? filters=trim
    text senha? filters=trim
    text cpf? filters=trim
    text celular? filters=trim
    text status_cliente? filters=trim
  }

  stack {
    api.request {
      url = "https://x8ki-letl-twmt.n7.xano.io/api:3Uroy-wx/auth/signup"
      method = "POST"
      params = {
        name    : $input.nome
        email   : $input.email
        password: $input.senha
      }
    
      headers = ["Content-Type:application/json"]
    } as $api1
  
    api.request {
      url = "https://x8ki-letl-twmt.n7.xano.io/api:3Uroy-wx/auth/me"
      method = "GET"
      params = `$var.api1.response.result.authToken`
      headers = [
        "Authorization: Bearer " ~ $var.api1.response.result.authToken
        "Content-Type: application/json"
      ]
    
    } as $api2
  
    db.get STATUS_CLIENTE {
      field_name = "status"
      field_value = $input.status_cliente
    } as $STATUS_CLIENTE1
  
    db.add CLIENTE {
      data = {
        celular          : $input.celular
        cpf              : $input.cpf
        status_cliente_id: $STATUS_CLIENTE1.id
        user_id          : $api2.response.result.id
      }
    } as $CLIENTE1
  }

  response = {
    user     : $api2.response.result
    cliente  : $CLIENTE1
    authToken: $api1.response.result.authToken
  }
}