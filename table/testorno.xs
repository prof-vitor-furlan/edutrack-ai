table TESTORNO {
  auth = false

  schema {
    int id
    timestamp created_at?=now {
      visibility = "private"
    }
  
    decimal valor?
    int solcancelamento_id? {
      table = "SOLCANCELAMENTO"
    }
  
    int status_testorno_id?=1 {
      table = "STATUS_TESTORNO"
    }
  }

  index = [
    {type: "primary", field: [{name: "id"}]}
    {type: "gin", field: [{name: "xdo", op: "jsonb_path_op"}]}
    {type: "btree", field: [{name: "created_at", op: "desc"}]}
  ]

  guid = "ifrNB3-xo4Pt3wZLggzzE4WRv54"
}