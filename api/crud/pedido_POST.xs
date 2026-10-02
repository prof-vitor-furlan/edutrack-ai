// Add PEDIDO record
query pedido verb=POST {
  api_group = "CRUD"

  input {
    dblink {
      table = "PEDIDO"
    }
  }

  stack {
    db.add PEDIDO {
      enforce_hidden_fields = false
      data = {created_at: "now"}
    } as $pedido
  }

  response = $pedido
  guid = "e4jrcTZaTFprCTXAd7psCDeD1oA"
}