query "academic_tasks/{academic_tasks_id}" verb=DELETE {
  api_group = "AcademicTasks"
  auth = "user"

  input {
    int academic_tasks_id? filters=min:1
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

    db.del academic_tasks {
      field_name = "id"
      field_value = $input.academic_tasks_id
    }
  }

  response = null
  guid = "jVY8h2Kp9Lw4mN7qR1cB6xF3sT0"
}