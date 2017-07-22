require 'rails_helper'

RSpec.describe "business_addresses/show", type: :view do
  before(:each) do
    @business_address = assign(:business_address, BusinessAddress.create!(
      :name => "Name",
      :business_listing_id => "",
      :address => "Address",
      :latitude => "Lat",
      :longitude => "Lng"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(//)
    expect(rendered).to match(/Address/)
    expect(rendered).to match(/Lat/)
    expect(rendered).to match(/Lng/)
  end
end
