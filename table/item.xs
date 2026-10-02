table ITEM {
  auth = false

  schema {
    int id
    timestamp created_at?=now {
      visibility = "private"
    }
  
    int pedido_id? {
      table = "PEDIDO"
    }
  
    int qtd? filters=min:1
    decimal valor_unit?
    decimal subtotal?
    int produto_id? {
      table = "PRODUTO"
    }
  
    int status_item_id?=3 {
      table = "STATUS_ITEM"
    }
  }

  index = [
    {type: "primary", field: [{name: "id"}]}
    {type: "gin", field: [{name: "xdo", op: "jsonb_path_op"}]}
    {type: "btree", field: [{name: "created_at", op: "desc"}]}
    {
      type : "btree|unique"
      field: [
        {name: "pedido_id", op: "asc"}
        {name: "produto_id", op: "asc"}
      ]
    }
  ]

  guid = "WU9kd-QGckpKD2EoWpy0_bRqYLE"
}