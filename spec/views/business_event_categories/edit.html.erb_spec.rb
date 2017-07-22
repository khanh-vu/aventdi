require 'rails_helper'

RSpec.describe "business_event_categories/edit", type: :view do
  before(:each) do
    @business_event_category = assign(:business_event_category, BusinessEventCategory.create!(
      :code => "MyString",
      :business_event_id => 1,
      :name => "MyString",
      :parent_id => "MyString",
      :level => 1,
      :icon => "MyString",
      :background => "MyString"
    ))
  end

  it "renders the edit business_event_category form" do
    render

    assert_select "form[action=?][method=?]", business_event_category_path(@business_event_category), "post" do

      assert_select "input[name=?]", "business_event_category[code]"

      assert_select "input[name=?]", "business_event_category[business_event_id]"

      assert_select "input[name=?]", "business_event_category[name]"

      assert_select "input[name=?]", "business_event_category[parent_code]"

      assert_select "input[name=?]", "business_event_category[level]"

      assert_select "input[name=?]", "business_event_category[icon]"

      assert_select "input[name=?]", "business_event_category[background]"
    end
  end
end
