query buscacep verb=GET {
  api_group = "CustomAPIs"

  input {
    text cep? filters=trim
  }

  stack {
    db.query CEP {
      where = $db.CEP.cep == $input.cep
      return = {type: "list"}
    } as $CEP1
  }

  response = $CEP1
}