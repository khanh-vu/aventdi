require 'rails_helper'

RSpec.describe "business_events/show", type: :view do
  before(:each) do
    @business_event = assign(:business_event, BusinessEvent.create!(
      :name => "Name",
      :description => "Description",
      :business_listing_id => 2,
      :category_code => "Category Code",
      :activity_types => "Activity Types"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Description/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Category Code/)
    expect(rendered).to match(/Activity Types/)
  end
end
