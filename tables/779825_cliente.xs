table CLIENTE {
  auth = false

  schema {
    int id
    timestamp created_at?=now {
      visibility = "private"
    }
  
    text celular? filters=trim
    text cpf? filters=trim
    int status_cliente_id?=1 {
      table = "STATUS_CLIENTE"
    }
  
    int user_id? {
      table = "user"
    }
  }

  index = [
    {type: "primary", field: [{name: "id"}]}
    {type: "gin", field: [{name: "xdo", op: "jsonb_path_op"}]}
    {type: "btree", field: [{name: "created_at", op: "desc"}]}
    {type: "btree|unique", field: [{name: "cpf", op: "asc"}]}
    {type: "btree|unique", field: [{name: "celular", op: "asc"}]}
  ]
}