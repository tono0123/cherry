json.array!(@add_prefid_to_users) do |add_prefid_to_user|
  json.extract! add_prefid_to_user, :id, :pref_id
  json.url add_prefid_to_user_url(add_prefid_to_user, format: :json)
end
