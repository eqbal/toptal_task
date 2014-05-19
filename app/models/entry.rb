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


    def readable_distance_type
    	D_Type[distance_type]
    end

    def is_km?
       D_Type[distance_type] == 'Km'
    end

    def is_mile?
       D_Type[distance_type] == 'Miles'
    end

    def avg_speed
    	speed = (distance.to_f)/(time_period.to_f/60)
    	sprintf("%0.2f", speed)
    end

    def distance_in_km
        is_mile? ? (distance.to_f*1.60) : (distance.to_f)
    end

    def speed_in_km
        distance_in_km/(time_period.to_f/60)
    end


end
