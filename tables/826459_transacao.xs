table TRANSACAO {
  auth = false

  schema {
    int id
    timestamp created_at?=now {
      visibility = "private"
    }
  
    text clienteassas? filters=trim
    text idpayment? filters=trim
    text tipo? filters=trim
    int valor?
    text datavenc? filters=trim
    text descricao? filters=trim
    int status_transacao_id? {
      table = "STATUS_TRANSACAO"
    }
  }

  index = [
    {type: "primary", field: [{name: "id"}]}
    {type: "gin", field: [{name: "xdo", op: "jsonb_path_op"}]}
    {type: "btree", field: [{name: "created_at", op: "desc"}]}
  ]
}