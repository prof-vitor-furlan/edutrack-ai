// Edit PRODUTO record
query "produto/{produto_id}" verb=PATCH {
  api_group = "CRUD"

  input {
    int produto_id? filters=min:1
    dblink {
      table = "PRODUTO"
    }
  }

  stack {
    util.get_raw_input {
      encoding = "json"
      exclude_middleware = false
    } as $raw_input
  
    db.patch PRODUTO {
      field_name = "id"
      field_value = $input.produto_id
      data = `$input|pick:($raw_input|keys)`|filter_null|filter_empty_text
    } as $model
  }

  response = $model
  guid = "3kK0oMW5zitCf1R7nFU1X5KzTTk"
}