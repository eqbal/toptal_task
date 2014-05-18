class EntriesController < ApplicationController
  before_action :set_entry, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!


  # GET /entries
  # GET /entries.json
  def index
    @entry = Entry.new
    @entries = current_user.entries.
                            order(created_at: :desc).
                            page params[:page]
  end

  # GET /entries/1
  # GET /entries/1.json
  def show
  end


  # GET /entries/1/edit
  def edit
  end

  # POST /entries
  # POST /entries.json
  def create
    return unless request.xhr?

    @entry = Entry.new(entry_params)
    @entry.user_id = current_user.id

    respond_to do |format|
      format.js
    end
    
  end

  # PATCH/PUT /entries/1
  # PATCH/PUT /entries/1.json
  def update
    respond_to do |format|
      if @entry.update(entry_params)
        format.html { redirect_to @entry, notice: 'Entry was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /entries/1
  # DELETE /entries/1.json
  def destroy
    return unless request.xhr?

    @entry = Entry.find(params[:id])

    respond_to do |format|
      format.js
    end
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
