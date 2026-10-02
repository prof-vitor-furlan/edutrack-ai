table user {
  auth = true

  schema {
    int id
    timestamp created_at?=now {
      visibility = "private"
    }
  
    text name? filters=trim
    email email? filters=trim|lower
    password password? {
      sensitive = true
      visibility = "internal"
    }
  
    int codigo?
    timestamp? validade?
    int papel_id?=7 {
      table = "PAPEL"
    }
  }

  index = [
    {type: "primary", field: [{name: "id"}]}
    {type: "gin", field: [{name: "xdo", op: "jsonb_path_op"}]}
    {type: "btree", field: [{name: "created_at", op: "desc"}]}
    {type: "btree|unique", field: [{name: "email", op: "asc"}]}
  ]

  guid = "wS7snck7JiOsFze-A3v3bqQMFmk"
}