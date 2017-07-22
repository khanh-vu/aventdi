require 'rails_helper'

RSpec.describe "business_listings/new", type: :view do
  before(:each) do
    assign(:business_listing, BusinessListing.new(
      :name => "MyString",
      :owner_id => 1,
      :description => "MyString",
      :address => "MyString",
      :phone_number => "MyString",
      :active => 1,
      :latitude => "MyString",
      :longitude => "MyString"
    ))
  end

  it "renders new business_listing form" do
    render

    assert_select "form[action=?][method=?]", business_listings_path, "post" do

      assert_select "input[name=?]", "business_listing[name]"

      assert_select "input[name=?]", "business_listing[owner_id]"

      assert_select "input[name=?]", "business_listing[description]"

      assert_select "input[name=?]", "business_listing[address]"

      assert_select "input[name=?]", "business_listing[phone_number]"

      assert_select "input[name=?]", "business_listing[active]"

      assert_select "input[name=?]", "business_listing[lat]"

      assert_select "input[name=?]", "business_listing[long]"
    end
  end
end
