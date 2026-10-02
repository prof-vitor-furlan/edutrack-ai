// Query all TESTORNO records
query testorno verb=GET {
  api_group = "CRUD"

  input {
  }

  stack {
    db.query TESTORNO {
      return = {type: "list"}
    } as $testorno
  }

  response = $testorno
}