// Add STATUS_OP record
query status_op verb=POST {
  api_group = "CRUD"

  input {
    dblink {
      table = "STATUS_OP"
    }
  }

  stack {
    db.add STATUS_OP {
      enforce_hidden_fields = false
      data = {created_at: "now"}
    } as $status_op
  }

  response = $status_op
  guid = "8Hfvi55JW84MBrsKt2knnHcvak0"
}