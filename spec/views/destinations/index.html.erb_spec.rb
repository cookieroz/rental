require 'spec_helper'

describe "destinations/index" do
  before(:each) do
    assign(:destinations, [
      stub_model(Destination,
        :name => "Name",
        :info => "MyText",
        :todo => "MyText",
        :airport => "MyText",
        :rentcar => "MyText",
        :weather => "MyText",
        :lat => 1.5,
        :lng => 1.5,
        :gmpas => false,
        :address => "Address"
      ),
      stub_model(Destination,
        :name => "Name",
        :info => "MyText",
        :todo => "MyText",
        :airport => "MyText",
        :rentcar => "MyText",
        :weather => "MyText",
        :lat => 1.5,
        :lng => 1.5,
        :gmpas => false,
        :address => "Address"
      )
    ])
  end

  it "renders a list of destinations" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Address".to_s, :count => 2
  end
end
