json.array!(@entries) do |entry|
  json.extract! entry, :id, :user_id, :distance, :time_period, :date_time, :created_at, :updated_at
  json.url entry_url(entry, format: :json)
end
