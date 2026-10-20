query academic_tasks verb=POST {
  api_group = "AcademicTasks"
  auth = "user"

  input {
    text title filters=trim
    text description? filters=trim
    date due_date?
    text status? filters=trim
    int subject_id filters=min:1
  }

  stack {
    db.add academic_tasks {
      data = {
        title: $input.title
        description: $input.description
        due_date: $input.due_date
        status: $input.status
        subject_id: $input.subject_id
        user_id: $auth.id
      }
    } as $task
  }

  response = $task
  guid = "mN7qR1cB6xF3sT0jVY8h2Kp9Lw4"
}