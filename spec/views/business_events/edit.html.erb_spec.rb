require 'rails_helper'

RSpec.describe "business_events/edit", type: :view do
  before(:each) do
    @business_event = assign(:business_event, BusinessEvent.create!(
      :name => "MyString",
      :description => "MyString",
      :business_listing_id => 1,
      :category_code => "MyString",
      :activity_types => "MyString"
    ))
  end

  it "renders the edit business_event form" do
    render

    assert_select "form[action=?][method=?]", business_event_path(@business_event), "post" do

      assert_select "input[name=?]", "business_event[name]"

      assert_select "input[name=?]", "business_event[description]"

      assert_select "input[name=?]", "business_event[business_listing_id]"

      assert_select "input[name=?]", "business_event[category_code]"

      assert_select "input[name=?]", "business_event[activity_types]"
    end
  end
end
