require 'spec_helper'


describe EntriesController do

  let(:valid_attributes) { { 
    "user_id"     => "1", 
    "distance"    => 100,
    "time_period" => 100,    
    "date_time"   => "2014-05-15 03:36:11 +0300"
    } 
  }

  let(:valid_session) { {} }

  before (:each) do
    @user = create(:admin)
    sign_in @user
  end  

  describe "GET index" do
    it "assigns all entries as @entries" do
      entry = Entry.create! valid_attributes
      entry.user = @user
      entry.save!
      get :index, {}, valid_session
      assigns(:entries).should eq([entry])
    end
  end

  describe "GET show" do
    it "assigns the requested entry as @entry" do
      entry = Entry.create! valid_attributes
      get :show, {:id => entry.to_param}, valid_session
      assigns(:entry).should eq(entry)
    end
  end


end
