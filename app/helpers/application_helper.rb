module ApplicationHelper
  def title(value)
    unless value.nil?
      @title = "#{value} | ToptalTask"      
    end
  end

  def weeks_to_date_from(week)
  	(Date.new + week.to_i.weeks).to_s.split(',')[0]
  end

  def weeks_to_date_to(week)
  	(Date.new + week.to_i.weeks + 7.days).to_s.split(',')[0]
  end

  def avg_distance(entries)
  	distances = 0.0

  	entries.each do |e|
		distances += e.distance_in_km
  	end

  	(distances/entries.count).round(2)
  end

  def avg_speed(entries)  	
  	speeds    = 0.0
  	entries.each do |e|
		speeds += e.speed_in_km
  	end
  	(speeds/entries.count).round(2)
  end

end
