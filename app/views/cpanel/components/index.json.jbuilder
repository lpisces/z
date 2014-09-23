json.array!(@cpanel_components) do |cpanel_component|
  json.extract! cpanel_component, :id, :component, :sub, :status
  json.url cpanel_component_url(cpanel_component, format: :json)
end
