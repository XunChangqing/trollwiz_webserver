json.array!(@domain_update_logs) do |domain_update_log|
  json.extract! domain_update_log, :id, :operation, :domain_name
  json.url domain_update_log_url(domain_update_log, format: :json)
end
