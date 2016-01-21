#
# create student user
User.create(
  email: "student@user.com",
  password: "password",
  password_confirmation: "password"
)

#
# create teacher user
User.create(
  email: "teacher@user.com",
  password: "password",
  password_confirmation: "password",
  is_teacher: true
)

#
# create admin user
User.create(
  email: "admin@user.com",
  password: "password",
  password_confirmation: "password",
  is_teacher: true,
  is_admin: true
)

#
# create questions for teacher 2
5.times do
  Question.create(
    category: "General",
    first_line: Faker::Lorem.sentence,
    incorrect_one: Faker::Lorem.sentence(3),
    incorrect_two: Faker::Lorem.sentence(3),
    incorrect_three: Faker::Lorem.sentence(3),
    correct_answer: Faker::Lorem.sentence(3),
    teacher_id: 2
  )
end

#
# create questions for teacher 3
5.times do
  Question.create(
    category: "General",
    first_line: Faker::Lorem.sentence,
    incorrect_one: Faker::Lorem.sentence(3),
    incorrect_two: Faker::Lorem.sentence(3),
    incorrect_three: Faker::Lorem.sentence(3),
    correct_answer: Faker::Lorem.sentence(3),
    teacher_id: 3
  )
end

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
