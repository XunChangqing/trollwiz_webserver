json.array!(@black_domain_names) do |black_domain_name|
  json.extract! black_domain_name, :id, :domain_name
  json.url black_domain_name_url(black_domain_name, format: :json)
end
