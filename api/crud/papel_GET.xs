// Query all PAPEL records
query papel verb=GET {
  api_group = "CRUD"

  input {
  }

  stack {
    db.query PAPEL {
      return = {type: "list"}
    } as $papel
  }

  response = $papel
  guid = "14pBsLCsNW6jB6rPrfw5bcoyS0k"
}