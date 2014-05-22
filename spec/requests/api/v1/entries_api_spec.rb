require 'spec_helper'

describe "RESTful API" do

  describe "Listing Entities" do

    context 'With valid Token' do

      before do
        entries = create(:entry)
        admin   = create(:admin) 
        get api_v1_entries_path, {token: admin.api_key.token}        
      end


      it 'Shows a list of entries' do     
        puts JSON.parse(response.body)
      end

      it "Should show no entries when the user has no data" do          
        puts JSON.parse(response.body) 
      end

    end

  end
end

# require 'spec_helper'

# describe "RESTful API" do

# 	describe "Listing Entities" do

# 		context 'Without a valid Token' do
# 		  it "Shouldn't show the entries for the user till he provide the token" do
# 			get api_v1_entries_path, :format => :json

# 			expect(response.header['Content-Type']).to include('application/json')			
# 			expect(my_json['message']).to eq('Invalid API Token')	
# 		  end		
# 		end

# 		context 'With valid Token' do
		  
# 	      before do
# 	      	entries = create_list(:entry, 10)
# 	      	admin   = create(:admin) 
# 	        get api_v1_entries_path, {token: admin.api_key.token}        
# 	      end


# 		  it 'Shows a list of entries' do	  	

# 		  	puts JSON.parse(response.body)
# 		    # expect(my_json['entries'].size).to eq(10)
# 		    # expect(my_json['total_count']).to eq(10)
# 		  end

# 		  it "Should show no entries when the user has no data" do	  		  
# 		  	puts JSON.parse(response.body)
 
# 		  	# # user = create(:user)
# 		  	# # get api_v1_entries_path, {token: user.api_key.token}
# 		  	# puts my_json.inspect
# 		   #  expect(my_json['entries'].size).to eq(0)
# 		   #  expect(my_json['total_count']).to eq(0)
# 		  end

# 		  # it "Should show the needed attributes for entry" do
# 		  # 	entry = @entries.first
# 		  # 	json_entry = my_json['entries'].first
		  	
# 		  # 	puts my_json.inspect
# 		  # 	puts json_entry.inspect


# 		  #   # expect(json_entry['id']).to eq(entry.id)
# 		  #   # expect(json_entry['user_id']).to eq(admin.id)
# 		  #   # expect(json_entry['username']).to eq(admin.username)
# 		  #   # expect(json_entry['distance']).to eq(entry.distance)
# 		  #   # expect(json_entry['time_period']).to eq(entry.time_period)
# 		  #   # expect(json_entry['date_time']).to eq(entry.date_time)
# 		  # end

# 		  # it "should only shows the entries for the user who provided the Token" do
		  	
# 		  # end
# 		end
	  
# 	end
# end