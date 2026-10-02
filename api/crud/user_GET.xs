// Query all user records
query user verb=GET {
  api_group = "CRUD"

  input {
  }

  stack {
    db.query user {
      return = {type: "list"}
    } as $model
  }

  response = $model
  guid = "XN8b0Q7aB8Q7tUJxP1HoNJGfRSs"
}