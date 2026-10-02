query UpsertCEP2 verb=POST {
  api_group = "CustomAPIs"

  input {
    text cep? filters=trim
    text uf? filters=trim
    text cidade? filters=trim
  }

  stack {
    db.query CEP {
      where = $db.CEP.cep == $input.cep
      return = {type: "list"}
    } as $CEP1
  
    conditional {
      if ($var.CEP1[0].cep == $input.cep) {
        db.patch CEP {
          field_name = "cep"
          field_value = $input.cep
          data = {uf: $input.uf, cidade: $input.cidade}
        } as $CEP2
      }
    
      else {
        db.add CEP {
          data = {cep: $input.cep, uf: $input.uf, cidade: $input.cidade}
        } as $CEP2
      }
    }
  }

  response = $CEP2
}