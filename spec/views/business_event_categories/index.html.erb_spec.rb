require 'rails_helper'

RSpec.describe "business_event_categories/index", type: :view do
  before(:each) do
    assign(:business_event_categories, [
      BusinessEventCategory.create!(
        :code => "Code",
        :business_event_id => 2,
        :name => "Name",
        :parent_id => "Parent Code",
        :level => 3,
        :icon => "Icon",
        :background => "Background"
      ),
      BusinessEventCategory.create!(
        :code => "Code",
        :business_event_id => 2,
        :name => "Name",
        :parent_id => "Parent Code",
        :level => 3,
        :icon => "Icon",
        :background => "Background"
      )
    ])
  end

  it "renders a list of business_event_categories" do
    render
    assert_select "tr>td", :text => "Code".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Parent Code".to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "Icon".to_s, :count => 2
    assert_select "tr>td", :text => "Background".to_s, :count => 2
  end
end
