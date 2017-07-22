require 'rails_helper'

RSpec.describe "business_listings/index", type: :view do
  before(:each) do
    assign(:business_listings, [
      BusinessListing.create!(
        :name => "Name",
        :owner_id => 2,
        :description => "Description",
        :address => "Address",
        :phone_number => "Phone Number",
        :active => 3,
        :latitude => "Lat",
        :longitude => "Long"
      ),
      BusinessListing.create!(
        :name => "Name",
        :owner_id => 2,
        :description => "Description",
        :address => "Address",
        :phone_number => "Phone Number",
        :active => 3,
        :latitude => "Lat",
        :longitude => "Long"
      )
    ])
  end

  it "renders a list of business_listings" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    assert_select "tr>td", :text => "Phone Number".to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "Lat".to_s, :count => 2
    assert_select "tr>td", :text => "Long".to_s, :count => 2
  end
end
