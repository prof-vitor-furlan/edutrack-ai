query "subjects/{subjects_id}" verb=PATCH {
  api_group = "Subjects"
  auth = "user"

  input {
    int subjects_id? filters=min:1
    text name? filters=trim
    text teacher? filters=trim
    int hours? filters=min:0
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

    db.patch subjects {
      field_name = "id"
      field_value = $input.subjects_id
      data = `{name: $input.name, teacher: $input.teacher, hours: $input.hours}`|filter_null|filter_empty_text
    } as $subject
  }

  response = $subject
  guid = "L7qN2mV5xR9cK4bH1wF6sT3jDY8"
}