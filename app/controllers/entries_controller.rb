class EntriesController < ApplicationController
  before_action :set_entry, only: [:show, :destroy]
  before_action :authenticate_user!


  def index
    @entry = Entry.new
    @entries = current_user.entries.
                            order(created_at: :desc).
                            page params[:page]
  end


  def show
  end


  def create
    return unless request.xhr?

    @entry = Entry.new(entry_params)
    @entry.user_id = current_user.id

    respond_to do |format|
      format.js
    end
    
  end


  def destroy
    return unless request.xhr?

    respond_to do |format|
      format.js
    end
  end

  def statistics
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_entry
      @entry = Entry.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def entry_params
      params.require(:entry).permit(:user_id, :distance, :time_period, :date_time, :created_at, :updated_at, :distance_type)
    end
end
