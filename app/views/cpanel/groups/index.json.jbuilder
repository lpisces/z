json.array!(@cpanel_groups) do |cpanel_group|
  json.extract! cpanel_group, :id, :name, :description
  json.url cpanel_group_url(cpanel_group, format: :json)
end
