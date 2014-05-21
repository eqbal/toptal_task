  entry ||= @entry

  json.id entry['id']
  json.user_id entry['user_id']
  json.username User.find(entry['user_id']).username    
  json.distance entry['distance']
  json.time_period entry['time_period']
  json.date_time entry['date_time']
  json.created_at entry['created_at']

  if entry['distance_type'] == 0
  	json.distance_type "Km"
  else
  	json.distance_type "Miles"
  end