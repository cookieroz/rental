require 'spec_helper'

describe "villas/index" do
  before(:each) do
    assign(:villas, [
      stub_model(Villa,
        :name => "Name",
        :destination => nil,
        :sleeps => 1,
        :bedrooms => 1,
        :bathrooms => 1.5,
        :content => "MyText",
        :rates => "MyText",
        :observations => "MyText",
        :latitude => 1.5,
        :longitude => 1.5,
        :gmaps => false
      ),
      stub_model(Villa,
        :name => "Name",
        :destination => nil,
        :sleeps => 1,
        :bedrooms => 1,
        :bathrooms => 1.5,
        :content => "MyText",
        :rates => "MyText",
        :observations => "MyText",
        :latitude => 1.5,
        :longitude => 1.5,
        :gmaps => false
      )
    ])
  end

  it "renders a list of villas" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
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
  end
end
