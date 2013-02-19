require 'spec_helper'

describe "villas/edit" do
  before(:each) do
    @villa = assign(:villa, stub_model(Villa,
      :name => "MyString",
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
    ))
  end

  it "renders the edit villa form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => villas_path(@villa), :method => "post" do
      assert_select "input#villa_name", :name => "villa[name]"
      assert_select "input#villa_destination", :name => "villa[destination]"
      assert_select "input#villa_sleeps", :name => "villa[sleeps]"
      assert_select "input#villa_bedrooms", :name => "villa[bedrooms]"
      assert_select "input#villa_bathrooms", :name => "villa[bathrooms]"
      assert_select "textarea#villa_content", :name => "villa[content]"
      assert_select "textarea#villa_rates", :name => "villa[rates]"
      assert_select "textarea#villa_observations", :name => "villa[observations]"
      assert_select "input#villa_latitude", :name => "villa[latitude]"
      assert_select "input#villa_longitude", :name => "villa[longitude]"
      assert_select "input#villa_gmaps", :name => "villa[gmaps]"
    end
  end
end
