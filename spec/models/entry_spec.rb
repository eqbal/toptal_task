require 'spec_helper'

describe Entry do

  let(:entry) { create(:entry) }
  

   it "should belong to user" do   	
  	expect{entry.user}.not_to raise_error
   end

   it "should have a distance attribute" do
     expect(entry).to respond_to(:distance)
     expect(entry.distance).to be_kind_of(Integer)
   end

   it "should have a time_period attribute" do
     expect(entry).to respond_to(:time_period)
     expect(entry.time_period).to be_kind_of(Integer)
   end

   it "should have a date_time attribute" do
     expect(entry).to respond_to(:date_time)
     expect(entry.date_time).to be_kind_of(String)
   end
      
end
