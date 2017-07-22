require 'rails_helper'

RSpec.describe "business_addresses/index", type: :view do
  before(:each) do
    assign(:business_addresses, [
      BusinessAddress.create!(
        :name => "Name",
        :business_listing_id => "",
        :address => "Address",
        :latitude => "Lat",
        :longitude => "Lng"
      ),
      BusinessAddress.create!(
        :name => "Name",
        :business_listing_id => "",
        :address => "Address",
        :latitude => "Lat",
        :longitude => "Lng"
      )
    ])
  end

  it "renders a list of business_addresses" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    assert_select "tr>td", :text => "Lat".to_s, :count => 2
    assert_select "tr>td", :text => "Lng".to_s, :count => 2
  end
end
