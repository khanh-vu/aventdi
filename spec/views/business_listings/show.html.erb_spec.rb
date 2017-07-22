require 'rails_helper'

RSpec.describe "business_listings/show", type: :view do
  before(:each) do
    @business_listing = assign(:business_listing, BusinessListing.create!(
      :name => "Name",
      :owner_id => 2,
      :description => "Description",
      :address => "Address",
      :phone_number => "Phone Number",
      :active => 3,
      :latitude => "Lat",
      :longitude => "Long"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Description/)
    expect(rendered).to match(/Address/)
    expect(rendered).to match(/Phone Number/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/Lat/)
    expect(rendered).to match(/Long/)
  end
end
