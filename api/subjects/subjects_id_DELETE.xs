query "subjects/{subjects_id}" verb=DELETE {
  api_group = "Subjects"
  auth = "user"

  input {
    int subjects_id? filters=min:1
  }

  stack {
    db.get subjects {
      field_name = "id"
      field_value = $input.subjects_id
    } as $subject

    precondition ($subject != null && $subject.user_id == $auth.id) {
      error_type = "notfound"
      error = "Not Found."
    }

    db.del subjects {
      field_name = "id"
      field_value = $input.subjects_id
    }
  }

  response = null
  guid = "Q2mV5xR9cK7bH1wF6sT3jDY8L4n"
}