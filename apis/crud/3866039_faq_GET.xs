// Query all FAQ records
query faq verb=GET {
  api_group = "CRUD"

  input {
  }

  stack {
    db.query FAQ {
      return = {type: "list"}
    } as $faq
  }

  response = $faq
}