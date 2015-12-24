json.array!(@teachers) do |teacher|
  json.extract! teacher, :id, :name_prefix, :name_first, :name_last, :school_name, :school_location, :school_city, :school_state, :classroom_name, :classroom_location, :classroom_description
  json.url teacher_url(teacher, format: :json)
end
