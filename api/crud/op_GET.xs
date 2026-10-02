// Query all OP records
query op verb=GET {
  api_group = "CRUD"

  input {
  }

  stack {
    db.query OP {
      return = {type: "list"}
    } as $op
  }

  response = $op
  guid = "xAF7pEuxnJw87qwuvaLLGuq8gvY"
}