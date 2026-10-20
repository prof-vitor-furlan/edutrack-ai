query subjects verb=POST {
  api_group = "Subjects"
  auth = "user"

  input {
    text name filters=trim
    text teacher? filters=trim
    int hours? filters=min:0
  }

  stack {
    db.add subjects {
      data = {
        name: $input.name
        teacher: $input.teacher
        hours: $input.hours
        user_id: $auth.id
      }
    } as $subject
  }

  response = $subject
  guid = "r5Vn8Kp2mQ9xL4cB1wF6sT3jDY"
}