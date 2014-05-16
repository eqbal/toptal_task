# require 'spec_helper'

# describe "Entries Page" do
  
#   subject { page }

#   describe "create new entry" do
    
#     before { visit root_path }

#     let(:submit) {'Create Entry'}
    
#     describe "with invalid params" do
#       it "should not create an entry", :js do        
#       end
#     end


#     describe "with valid params" do
      
#       before do 
#         fill_in "Uid", with: "player1"
#         click_button submit
#       end

#       it "should create an Offer", :js do
#         expect change(Offer, :count).by(1)        
#       end  

#       it "should create an Offer with default params set", :js do
#         offer = Offer.find_by_uid("player1")        
#         expect(offer.request_timestamp).not_to be_nil
#       end

#       it "should display the offers page with either no content items, or all content items if present", :js do
#         page.should satisfy do
#           (page.has_css?(".offer")) || (page.has_css?(".no_offers"))
#         end
#       end
#     end

#   end
# end
