json.array!(@users) do |user|
  json.extract! user, :id, :company, :sei, :mei, :postal_code, :adress, :mail, :tel
  json.url user_url(user, format: :json)
end
