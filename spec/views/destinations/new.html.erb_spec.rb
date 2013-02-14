require 'spec_helper'

describe "destinations/new" do
  before(:each) do
    assign(:destination, stub_model(Destination,
      :name => "MyString",
      :info => "MyText",
      :todo => "MyText",
      :airport => "MyText",
      :rentcar => "MyText",
      :weather => "MyText",
      :lat => 1.5,
      :lng => 1.5,
      :gmpas => false,
      :address => "MyString"
    ).as_new_record)
  end

  it "renders new destination form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => destinations_path, :method => "post" do
      assert_select "input#destination_name", :name => "destination[name]"
      assert_select "textarea#destination_info", :name => "destination[info]"
      assert_select "textarea#destination_todo", :name => "destination[todo]"
      assert_select "textarea#destination_airport", :name => "destination[airport]"
      assert_select "textarea#destination_rentcar", :name => "destination[rentcar]"
      assert_select "textarea#destination_weather", :name => "destination[weather]"
      assert_select "input#destination_lat", :name => "destination[lat]"
      assert_select "input#destination_lng", :name => "destination[lng]"
      assert_select "input#destination_gmpas", :name => "destination[gmpas]"
      assert_select "input#destination_address", :name => "destination[address]"
    end
  end
end
