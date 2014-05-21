class Api::V1::EntriesController < Api::V1::BaseController

  def index
  	@entries = Entry.all
  end

end



