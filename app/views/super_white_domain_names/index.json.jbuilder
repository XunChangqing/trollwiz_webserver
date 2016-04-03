json.array!(@super_white_domain_names) do |super_white_domain_name|
  json.extract! super_white_domain_name, :id, :domain_name
  json.url super_white_domain_name_url(super_white_domain_name, format: :json)
end
