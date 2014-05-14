require 'spec_helper'

describe "entries/index" do
  before(:each) do
    assign(:entries, [
      stub_model(Entry,
        :user_id => 1,
        :distance => 2,
        :time_period => 3,
        :date_time => "Date Time"
      ),
      stub_model(Entry,
        :user_id => 1,
        :distance => 2,
        :time_period => 3,
        :date_time => "Date Time"
      )
    ])
  end

  it "renders a list of entries" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "Date Time".to_s, :count => 2
  end
end
