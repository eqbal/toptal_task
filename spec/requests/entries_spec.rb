require 'spec_helper'

describe "Entries" do
  describe "GET /entries" do
    
  	let(:entry) { create(:entry) }
  	let(:user)  { create(:user) }

    it "Can see the index page with no errors" do      
      sign_in_as_user(user)
      visit entries_path      
      expect(page).to have_content("entries")
    end
  end
end


def sign_in_as_user(user)
    visit "/users/sign_in"
    fill_in "Username", :with => user.username
    fill_in "Password", :with => user.password
    click_button "Sign in"
end