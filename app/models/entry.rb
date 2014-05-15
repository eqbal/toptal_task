class Entry < ActiveRecord::Base
	belongs_to :user

	validates_presence_of :distance, :time_period, :date_time
	validates_numericality_of :distance, :time_period
	

    # Pagination
    paginates_per 100
    
end
