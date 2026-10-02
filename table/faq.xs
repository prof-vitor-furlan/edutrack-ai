table FAQ {
  auth = false

  schema {
    int id
    timestamp created_at?=now {
      visibility = "private"
    }
  
    text pergunta? filters=trim
    text resposta? filters=trim
  }

  index = [
    {type: "primary", field: [{name: "id"}]}
    {type: "gin", field: [{name: "xdo", op: "jsonb_path_op"}]}
    {type: "btree", field: [{name: "created_at", op: "desc"}]}
  ]

  guid = "PEv-wMVVt9CB0K7gp29VkE7KUDI"
}