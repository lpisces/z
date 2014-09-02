json.array!(@apps) do |app|
  json.extract! app, :id, :name, :app_id, :app_type
  json.url app_url(app, format: :json)
end
