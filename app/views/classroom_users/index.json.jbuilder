json.array!(@classroom_users) do |classroom_user|
  json.extract! classroom_user, :id
  json.url classroom_user_url(classroom_user, format: :json)
end
