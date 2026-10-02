// Query all CLIENTE records
query cliente verb=GET {
  api_group = "CRUD"

  input {
  }

  stack {
    db.query CLIENTE {
      return = {type: "list"}
    } as $model
  }

  response = $model
  guid = "9fOGm9TBhJp33AjyXp3Vlm5Zd5I"
}