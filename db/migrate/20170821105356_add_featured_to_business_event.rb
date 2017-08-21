class AddFeaturedToBusinessEvent < ActiveRecord::Migration[5.1]
  def change
    add_column :business_events, :is_featured, :integer
  end
end
