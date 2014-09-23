json.array!(@cpanel_users) do |cpanel_user|
  json.extract! cpanel_user, :id
  json.url cpanel_user_url(cpanel_user, format: :json)
end
