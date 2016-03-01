# json.questions @questions

json.questions do
  json.array! @questions do |questions|
    answer_list = [questions.incorrect_one, questions.incorrect_two, questions.incorrect_three, questions.correct_answer]

    json.category questions.category
    json.firstLine questions.first_line
    json.answers answer_list
  end
end