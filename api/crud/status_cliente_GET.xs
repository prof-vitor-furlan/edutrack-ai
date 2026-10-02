// Query all STATUS_CLIENTE records
query status_cliente verb=GET {
  api_group = "CRUD"

  input {
  }

  stack {
    db.query STATUS_CLIENTE {
      return = {type: "list"}
    } as $model
  }

  response = $model
  guid = "JFIs6SSG_Y4Fi3CkquCKnUpVP-w"
}