require 'rails_helper'

RSpec.describe "business_addresses/new", type: :view do
  before(:each) do
    assign(:business_address, BusinessAddress.new(
      :name => "MyString",
      :business_listing_id => "",
      :address => "MyString",
      :latitude => "MyString",
      :longitude => "MyString"
    ))
  end

  it "renders new business_address form" do
    render

    assert_select "form[action=?][method=?]", business_addresses_path, "post" do

      assert_select "input[name=?]", "business_address[name]"

      assert_select "input[name=?]", "business_address[business_listing_id]"

      assert_select "input[name=?]", "business_address[address]"

      assert_select "input[name=?]", "business_address[lat]"

      assert_select "input[name=?]", "business_address[lng]"
    end
  end
end
