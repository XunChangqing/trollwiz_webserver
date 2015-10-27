json.array!(@error_reports) do |error_report|
  json.extract! error_report, :id, :version, :error_message, :closed, :note
  json.url error_report_url(error_report, format: :json)
end
