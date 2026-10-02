addon CEP_1 {
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

  guid = "ZZ9U6BRJABUJxdp1hBvAj6P0BKs"
}