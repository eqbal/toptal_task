require 'spec_helper'

describe "Entries Page" do
  
  describe "create new entry" do
    
   	let(:entry)  { create(:entry) }
  	let(:user)   { create(:user) }

    before { sign_in_as_user(user) }

	context 'Invalid params' do
  	  
  	  it "should return error message when distance is not a number", :js do       	  	
  	  	fill_in_form("not a number", "Km", 30)
		click_on "Create Entry"

		expect(page).to have_content("Distance is not a number")
	  end   

  	  it "should return error message when distance is empty", :js do     
  	  	fill_in_form("", "Km", 30)
		click_on "Create Entry"

		expect(page).to have_content("Distance can't be blank")
	  end 

  	  it "should return error message when time period is not a number", :js do       	  	
  	  	fill_in_form(10, "Km", "some string")
		click_on "Create Entry"

		expect(page).to have_content("Time period is not a number")
	  end 	  

	end	

	context 'Valid params' do
      
      it "should create an Entry with valid params", :js do
      	
      end  

      it "should create an Offer with default params set", :js do
      end

      it "should display the offers page with either no content items, or all content items if present", :js do
      end	  	
	end
    
  end
end



def sign_in_as_user(user)
    visit "/users/sign_in"
    fill_in "Username", :with => user.username
    fill_in "Password", :with => user.password
    click_button "Sign in"
end


def fill_in_form(distance, dt="Km", period, datetime)
	fill_in "Distance", with: distance
	select  "Km", from: "entry_distance_type"
	fill_in "entry_time_period", with: period
	fill_in "entry[date_time]", with: (datetime || DateTime.now.strftime("%Y-%m-%d %H:%M"))
end