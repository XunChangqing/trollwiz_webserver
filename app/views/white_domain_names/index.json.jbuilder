json.array!(@white_domain_names) do |white_domain_name|
  json.extract! white_domain_name, :id, :domain_name
  json.url white_domain_name_url(white_domain_name, format: :json)
end
