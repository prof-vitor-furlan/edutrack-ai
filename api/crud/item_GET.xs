// Query all ITEM records
query item verb=GET {
  api_group = "CRUD"

  input {
  }

  stack {
    db.query ITEM {
      return = {type: "list"}
    } as $item
  }

  response = $item
  guid = "nUdhyZBqi-wpj4ImIoP0t_uh1bY"
}