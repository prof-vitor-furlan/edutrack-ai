// Add STATUS_ITEM record
query status_item verb=POST {
  api_group = "CRUD"

  input {
    dblink {
      table = "STATUS_ITEM"
    }
  }

  stack {
    db.add STATUS_ITEM {
      enforce_hidden_fields = false
      data = {created_at: "now"}
    } as $status_item
  }

  response = $status_item
  guid = "q7RcDTKef-5a0xGn_XdvAGJWXc0"
}