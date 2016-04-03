json.array!(@start_registers) do |start_register|
  json.extract! start_register, :id, :user_id, :note
  json.url start_register_url(start_register, format: :json)
end
