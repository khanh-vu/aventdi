require 'rails_helper'

RSpec.describe "business_event_categories/show", type: :view do
  before(:each) do
    @business_event_category = assign(:business_event_category, BusinessEventCategory.create!(
      :code => "Code",
      :business_event_id => 2,
      :name => "Name",
      :parent_id => "Parent Code",
      :level => 3,
      :icon => "Icon",
      :background => "Background"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Code/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Parent Code/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/Icon/)
    expect(rendered).to match(/Background/)
  end
end
