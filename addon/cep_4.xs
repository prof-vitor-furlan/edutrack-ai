addon CEP_4 {
  input {
    int CEP_id? {
      table = "CEP"
    }
  }

  stack {
    db.query CEP {
      where = $db.CEP.id == $input.CEP_id
      return = {type: "single"}
    }
  }

  guid = "SZIUoHLf1Q6quUS2viuPnv8aCiA"
}