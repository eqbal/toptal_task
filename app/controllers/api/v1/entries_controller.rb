class Api::V1::EntriesController < Api::V1::BaseController
  before_filter :restrict_access 

  def index
  	@entries = Entry.all
  end

end



