// Delete TESTORNO record.
query "testorno/{testorno_id}" verb=DELETE {
  api_group = "CRUD"

  input {
    int testorno_id? filters=min:1
  }

  stack {
    db.del TESTORNO {
      field_name = "id"
      field_value = $input.testorno_id
    }
  }

  response = null
  guid = "bqf389f5qHpxvPKuxS_TTX6F394"
}