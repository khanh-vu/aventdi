require 'rails_helper'

RSpec.describe "business_addresses/edit", type: :view do
  before(:each) do
    @business_address = assign(:business_address, BusinessAddress.create!(
      :name => "MyString",
      :business_listing_id => "",
      :address => "MyString",
      :latitude => "MyString",
      :longitude => "MyString"
    ))
  end

  it "renders the edit business_address form" do
    render

    assert_select "form[action=?][method=?]", business_address_path(@business_address), "post" do

      assert_select "input[name=?]", "business_address[name]"

      assert_select "input[name=?]", "business_address[business_listing_id]"

      assert_select "input[name=?]", "business_address[address]"

      assert_select "input[name=?]", "business_address[lat]"

      assert_select "input[name=?]", "business_address[lng]"
    end
  end
end
