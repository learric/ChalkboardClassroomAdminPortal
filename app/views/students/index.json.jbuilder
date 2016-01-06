json.array!(@students) do |student|
  json.extract! student, :id, :name_first, :name_last, :email, :favorite_team, :game_wins, :game_losses
  json.url student_url(student, format: :json)
end
