require 'rails_helper'

RSpec.describe "business_events/index", type: :view do
  before(:each) do
    assign(:business_events, [
      BusinessEvent.create!(
        :name => "Name",
        :description => "Description",
        :business_listing_id => 2,
        :category_code => "Category Code",
        :activity_types => "Activity Types"
      ),
      BusinessEvent.create!(
        :name => "Name",
        :description => "Description",
        :business_listing_id => 2,
        :category_code => "Category Code",
        :activity_types => "Activity Types"
      )
    ])
  end

  it "renders a list of business_events" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Category Code".to_s, :count => 2
    assert_select "tr>td", :text => "Activity Types".to_s, :count => 2
  end
end
