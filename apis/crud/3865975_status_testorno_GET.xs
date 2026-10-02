// Query all STATUS_TESTORNO records
query status_testorno verb=GET {
  api_group = "CRUD"

  input {
  }

  stack {
    db.query STATUS_TESTORNO {
      return = {type: "list"}
    } as $status_testorno
  }

  response = $status_testorno
}