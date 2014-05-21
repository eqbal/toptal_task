require 'spec_helper'

describe "RESTful API" do
  it 'Shows a list of entries' do
    create_list(:entry, 10)
    create(:admin)

    get api_v1_entries_path

    expect(response).to be_success 
    puts response.body
    json = JSON.parse(response.body)
    expect(json['entries'].length).to eq(10)
  end
end


