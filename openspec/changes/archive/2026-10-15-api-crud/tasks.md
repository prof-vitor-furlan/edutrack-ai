# Tasks

## 1. Subjects CRUD Endpoints

- [x] 1.1 Create `api/subjects/subjects.xs` (api_group configuration) and `api/subjects/subjects_GET.xs` to retrieve subjects belonging to the authenticated user (`where = $db.subjects.user_id == $auth.id`).
- [x] 1.2 Create `api/subjects/subjects_POST.xs` to create new subjects with `user_id` bound to `$auth.id`.
- [x] 1.3 Create `api/subjects/subjects_id_PATCH.xs` to update a subject validating ownership (`precondition ($subject.user_id == $auth.id)`).
- [x] 1.4 Create `api/subjects/subjects_id_DELETE.xs` to delete a subject validating ownership (`precondition ($subject.user_id == $auth.id)`).

## 2. Academic Tasks CRUD Endpoints

- [x] 2.1 Create `api/academic_tasks/academic_tasks.xs` (api_group configuration) and `api/academic_tasks/academic_tasks_GET.xs` to retrieve tasks belonging to the authenticated user (`where = $db.academic_tasks.user_id == $auth.id`).
- [x] 2.2 Create `api/academic_tasks/academic_tasks_POST.xs` to create new academic tasks linked to `subject_id` with `user_id` bound to `$auth.id`.
- [x] 2.3 Create `api/academic_tasks/academic_tasks_id_PATCH.xs` to update an academic task validating ownership (`precondition ($task.user_id == $auth.id)`).
- [x] 2.4 Create `api/academic_tasks/academic_tasks_id_DELETE.xs` to delete an academic task validating ownership (`precondition ($task.user_id == $auth.id)`).

