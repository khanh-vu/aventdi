class RemoveEventColumns < ActiveRecord::Migration[5.1]
  def change
    remove_column :business_events, :business_listing_id
    remove_column :business_events, :category_code
  end
end
