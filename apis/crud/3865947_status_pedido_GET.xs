// Query all STATUS_PEDIDO records
query status_pedido verb=GET {
  api_group = "CRUD"

  input {
  }

  stack {
    db.query STATUS_PEDIDO {
      return = {type: "list"}
    } as $status_pedido
  }

  response = $status_pedido
}