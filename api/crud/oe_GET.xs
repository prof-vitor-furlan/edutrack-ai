// Query all OE records
query oe verb=GET {
  api_group = "CRUD"

  input {
  }

  stack {
    db.query OE {
      return = {type: "list"}
    } as $oe
  }

  response = $oe
  guid = "94gsY9ifqxYzfhjBtZQeENKr3NA"
}