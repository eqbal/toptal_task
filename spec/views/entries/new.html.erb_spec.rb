require 'spec_helper'

describe "entries/new" do
  before(:each) do
    assign(:entry, stub_model(Entry,
      :user_id => 1,
      :distance => 1,
      :time_period => 1,
      :date_time => "MyString"
    ).as_new_record)
  end

  it "renders new entry form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", entries_path, "post" do
      assert_select "input#entry_user_id[name=?]", "entry[user_id]"
      assert_select "input#entry_distance[name=?]", "entry[distance]"
      assert_select "input#entry_time_period[name=?]", "entry[time_period]"
      assert_select "input#entry_date_time[name=?]", "entry[date_time]"
    end
  end
end
