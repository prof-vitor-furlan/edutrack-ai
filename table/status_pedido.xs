table STATUS_PEDIDO {
  auth = false

  schema {
    int id
    timestamp created_at?=now {
      visibility = "private"
    }
  
    text status? filters=trim
    text status_para? filters=trim
  }

  index = [
    {type: "primary", field: [{name: "id"}]}
    {type: "gin", field: [{name: "xdo", op: "jsonb_path_op"}]}
    {type: "btree", field: [{name: "created_at", op: "desc"}]}
    {
      type : "btree|unique"
      field: [
        {name: "status", op: "asc"}
        {name: "status_para", op: "asc"}
      ]
    }
  ]

  guid = "O_1zxL1oDhof0AGGHaA6sPVPrXA"
}