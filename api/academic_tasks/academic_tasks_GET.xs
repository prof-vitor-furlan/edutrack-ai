query academic_tasks verb=GET {
  api_group = "AcademicTasks"
  auth = "user"

  input {
  }

  stack {
    db.query academic_tasks {
      where = $db.academic_tasks.user_id == $auth.id
      return = {type: "list"}
    } as $tasks
  }

  response = $tasks
  guid = "B6xF3sT0jVY8h2Kp9Lw4mN7qR1c"
}