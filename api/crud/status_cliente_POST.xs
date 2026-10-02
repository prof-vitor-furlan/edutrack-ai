// Add STATUS_CLIENTE record
query status_cliente verb=POST {
  api_group = "CRUD"

  input {
    dblink {
      table = "STATUS_CLIENTE"
    }
  }

  stack {
    db.add STATUS_CLIENTE {
      enforce_hidden_fields = false
      data = {created_at: "now"}
    } as $model
  }

  response = $model
  guid = "oB5ihgJlHsvCpDtnKlf03EQHUwo"
}