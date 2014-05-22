class Api::V1::EntriesController < Api::V1::BaseController
  include ApplicationHelper

  before_filter :restrict_access 

  def index
  	@entries = @current_user.entries  	
  end

  def show
  	@entry = @current_user.entries.where(id: params[:id]).first

  	if @entry
  		render :partial => "show"
  	else
  		render json: {message: 'No data for that ID'}, 
  			   status: 401
  	end
  end

  def create
    @entry = Entry.new(params[:entry].to_hash)
  
    @entry.user_id = @current_user.id

    if @entry.save
    	render json: @entry, status: :created
    else
    	render json: @entry.errors, 
    		   status: :unprocessable_entity
    end
  end

  def destroy
  	@entry = @current_user.entries.where(id: params[:id]).first
  	
  	if @entry
      
      if @entry.destroy
        render json: {message: 'Entry Succefully destroyed'}, 
         	   status: :ok
      else
        render json: @user.errors, 
        	   status: :unprocessable_entity         
      end  		

  	else
  		render json: {message: 'No data for that ID'}, 
  			   status: 401
  	end    
  end


  def search
  	@entries = @current_user.search_entries(params[:from], params[:to])

  	if @entries.size > 0
  		render :index
  	else
  		render json: {message: 'No data for that period'}, 
  			   status: 401  		
  	end
  end  

  def report
  	@weeks = []
  	
  	@current_user.weekly_entries do |week, entries|
  		row = []
  		row << week
  		row << weeks_to_date_from(week)
  		row << weeks_to_date_to(week)
  		row << entries.count
  		row << avg_distance(entries)
  		row << avg_speed(entries)
  		@weeks << row
  	end

	render :report
  end

end
