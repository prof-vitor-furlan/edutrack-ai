query "academic_tasks/{academic_tasks_id}" verb=PATCH {
  api_group = "AcademicTasks"
  auth = "user"

  input {
    int academic_tasks_id? filters=min:1
    text title? filters=trim
    text description? filters=trim
    date due_date?
    text status? filters=trim
    int subject_id? filters=min:1
  }

  stack {
    db.get academic_tasks {
      field_name = "id"
      field_value = $input.academic_tasks_id
    } as $task

    precondition ($task != null && $task.user_id == $auth.id) {
      error_type = "notfound"
      error = "Not Found."
    }

    util.get_raw_input {
      encoding = "json"
      exclude_middleware = false
    } as $raw_input

    db.patch academic_tasks {
      field_name = "id"
      field_value = $input.academic_tasks_id
      data = `{title: $input.title, description: $input.description, due_date: $input.due_date, status: $input.status, subject_id: $input.subject_id}`|pick:($raw_input|keys)|filter_null|filter_empty_text
    } as $task
  }

  response = $task
  guid = "xF3sT0jVY8h2Kp9Lw4mN7qR1cB6"
}