    json.weeks @weeks do |row|
      json.week_number row[0]
      json.date_from row[1]
      json.date_to row[2]
      json.count row[3]
      json.avg_distance row[4]
      json.avg_speed row[5]
    end
    json.total_count @weeks.size

