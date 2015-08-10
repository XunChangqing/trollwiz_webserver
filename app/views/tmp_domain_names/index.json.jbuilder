json.array!(@tmp_domain_names) do |tmp_domain_name|
  json.extract! tmp_domain_name, :id, :domain_name
  json.url tmp_domain_name_url(tmp_domain_name, format: :json)
end
