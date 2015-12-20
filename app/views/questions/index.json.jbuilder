json.array!(@questions) do |question|
  json.extract! question, :id, :category, :first_line, :last_line, :incorrect_one, :incorrect_two, :incorrect_three, :correct_answer
  json.url question_url(question, format: :json)
end
