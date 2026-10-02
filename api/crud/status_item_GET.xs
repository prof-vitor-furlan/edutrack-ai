// Query all STATUS_ITEM records
query status_item verb=GET {
  api_group = "CRUD"

  input {
  }

  stack {
    db.query STATUS_ITEM {
      return = {type: "list"}
    } as $status_item
  }

  response = $status_item
  guid = "23vltyIlQWXo24tGN1wkJOuHPPQ"
}