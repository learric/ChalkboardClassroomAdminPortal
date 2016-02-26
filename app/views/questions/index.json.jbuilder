json.array!(@questions) do |question|
  json.extract! question, :id, :category, :first_line
  json.url question_url(question, format: :json)
end
