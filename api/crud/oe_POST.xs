// Add OE record
query oe verb=POST {
  api_group = "CRUD"

  input {
    dblink {
      table = "OE"
    }
  }

  stack {
    db.add OE {
      enforce_hidden_fields = false
      data = {created_at: "now"}
    } as $oe
  }

  response = $oe
  guid = "sHSSs94xdK_aiM6fNTMm5d9vS9c"
}