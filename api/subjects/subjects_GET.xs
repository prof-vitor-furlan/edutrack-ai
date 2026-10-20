query subjects verb=GET {
  api_group = "Subjects"
  auth = "user"

  input {
  }

  stack {
    db.query subjects {
      where = $db.subjects.user_id == $auth.id
      return = {type: "list"}
    } as $subjects
  }

  response = $subjects
  guid = "h2Kp9Lw4mN7qR1cB6xF3sT0jVY"
}