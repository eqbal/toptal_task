class Entry < ActiveRecord::Base
	belongs_to :user

	validates_presence_of :distance, :time_period, :date_time
	validates_numericality_of :distance, :time_period
	

    # Pagination
    paginates_per 30
    
    # Distance Type
    D_Type = {
    	0 	=> "Km",
    	1	=> "Miles"
    }

    def week
        date = date_time.split(' ')[0]
        Date.strptime(date, "%m/%d/%Y").strftime('%W')
    end

    def self.weekly
        Entry.all.group_by(&:week).sort.each do |week, entries|
            yield week, entries
        end
    end

    def readable_distance_type
    	D_Type[distance_type]
    end

    def avg_speed
    	speed = (distance.to_f)/(time_period.to_f/60)
    	sprintf("%0.2f", speed)
    end
end
