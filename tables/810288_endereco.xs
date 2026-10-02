table ENDERECO {
  auth = false

  schema {
    int id
    timestamp created_at?=now {
      visibility = "private"
    }
  
    int cliente_id? {
      table = "CLIENTE"
    }
  
    text? logradouro? filters=trim
    text numero? filters=trim
    int cep_id? {
      table = "CEP"
    }
  
    text? complemento? filters=trim
    text bairro? filters=trim
    text? referencia? filters=trim
    bool padrao?
  }

  index = [
    {type: "primary", field: [{name: "id"}]}
    {type: "gin", field: [{name: "xdo", op: "jsonb_path_op"}]}
    {type: "btree", field: [{name: "created_at", op: "desc"}]}
  ]
}