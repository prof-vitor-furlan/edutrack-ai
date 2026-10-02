// Add FUNCIONARIO record
query funcionario verb=POST {
  api_group = "CRUD"

  input {
    dblink {
      table = ""
    }
  }

  stack {
    db.add "" {
      enforce_hidden_fields = false
      data = {created_at: "now"}
    } as $funcionario
  }

  response = $funcionario
  guid = "sbcp1jN779MpHCGWxlRkU-OmXBY"
}