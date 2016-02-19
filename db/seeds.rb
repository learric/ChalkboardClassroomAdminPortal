#
# create student user
User.create(
  id: 1,
  email: "student@user.com",
  password: "password",
  password_confirmation: "password",
  name_first: "Student",
  name_last: "User",
  school_name: "Student School",
  school_location: "Student School Location",
  school_city: "New Orleans",
  school_state: "LA",
  favorite_team: "LSU Tigers"
)

#
# create teacher user
User.create(
  id: 2,
  email: "teacher@user.com",
  password: "password",
  password_confirmation: "password",
  name_first: "Teacher",
  name_last: "User",
  school_name: "Teacher School",
  school_location: "Teacher School Location",
  school_city: "Auburn",
  school_state: "AL",
  favorite_team: "Auburn Tigers",
  is_teacher: true
)

#
# create admin user
User.create(
  id: 3,
  email: "admin@user.com",
  password: "password",
  password_confirmation: "password",
  name_first: "Admin",
  name_last: "User",
  school_name: "Admin School",
  school_location: "Admin School Location",
  school_city: "New Orleans",
  school_state: "LA",
  favorite_team: "Florida Gators",
  is_teacher: true,
  is_admin: true
)

#
# create questions for teacher 2
Question.create(
  category: "General",
  first_line: "A raised, level piece of land:",
  incorrect_one: "canyon",
  incorrect_two: "plain",
  incorrect_three: "valley",
  correct_answer: "plateau",
  teacher_id: 2
)

Question.create(
    category: "General",
    first_line: "A long, low place between hills or mountains:",
    incorrect_one: "canyon",
    incorrect_two: "gorge",
    incorrect_three: "trough",
    correct_answer: "valley",
    teacher_id: 2
)

Question.create(
    category: "General",
    first_line: "A way of showing size or distance on a map is with a:",
    incorrect_one: "score",
    incorrect_two: "key",
    incorrect_three: "grid",
    correct_answer: "scale",
    teacher_id: 2
)

Question.create(
    category: "General",
    first_line: "Distance above sea level:",
    incorrect_one: "contour",
    incorrect_two: "depression",
    incorrect_three: "topography",
    correct_answer: "elevation",
    teacher_id: 2
)

Question.create(
    category: "General",
    first_line: "A group of people joined by a common interest:",
    incorrect_one: "pack",
    incorrect_two: "gathering",
    incorrect_three: "flock",
    correct_answer: "clan",
    teacher_id: 2
)

#
# create questions for teacher 3
Question.create(
    category: "General",
    first_line: "A raised, level piece of land:",
    incorrect_one: "canyon",
    incorrect_two: "plain",
    incorrect_three: "valley",
    correct_answer: "plateau",
    teacher_id: 3
)

Question.create(
    category: "General",
    first_line: "A long, low place between hills or mountains:",
    incorrect_one: "canyon",
    incorrect_two: "gorge",
    incorrect_three: "trough",
    correct_answer: "valley",
    teacher_id: 3
)

Question.create(
    category: "General",
    first_line: "A way of showing size or distance on a map is with a:",
    incorrect_one: "score",
    incorrect_two: "key",
    incorrect_three: "grid",
    correct_answer: "scale",
    teacher_id: 3
)

Question.create(
    category: "General",
    first_line: "Distance above sea level:",
    incorrect_one: "contour",
    incorrect_two: "depression",
    incorrect_three: "topography",
    correct_answer: "elevation",
    teacher_id: 3
)

Question.create(
    category: "General",
    first_line: "A group of people joined by a common interest:",
    incorrect_one: "pack",
    incorrect_two: "gathering",
    incorrect_three: "flock",
    correct_answer: "clan",
    teacher_id: 3
)

#
# Classroom 1 - Teacher 2
Classroom.create(
   name: "Classroom 1 - 2",
   school: "School 1",
   teacher_id: 2
)

#
# Classroom 2 - Teacher 2
Classroom.create(
  name: "Classroom 2 - 2",
  school: "School 1",
  teacher_id: 2
)

#
# Classroom 1 - Teacher 3
Classroom.create(
  name: "Classroom 1 - 3",
  school: "School 1",
  teacher_id: 3
)

#
# Classroom 2 - Teacher 3
Classroom.create(
  name: "Classroom 2 - 3",
  school: "School 1",
  teacher_id: 3
)

#
# Student 1 to Classroom associations
StudentClassroom.create(student_id: 1, classroom_id: 1, teacher_id: 2)
StudentClassroom.create(student_id: 1, classroom_id: 2, teacher_id: 2)
StudentClassroom.create(student_id: 1, classroom_id: 4, teacher_id: 3)

#
# Student 3 to Classroom associations
StudentClassroom.create(student_id: 3, classroom_id: 1, teacher_id: 2)
StudentClassroom.create(student_id: 3, classroom_id: 2, teacher_id: 2)
StudentClassroom.create(student_id: 3, classroom_id: 3, teacher_id: 3)
StudentClassroom.create(student_id: 3, classroom_id: 4, teacher_id: 3)
