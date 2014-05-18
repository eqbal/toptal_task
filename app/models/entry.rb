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

    def readable_distance_type
    	D_Type[distance_type]
    end

    def avg_speed
    	speed = (distance.to_f)/(time_period.to_f/60)
    	sprintf("%0.2f", speed)
    end
end
