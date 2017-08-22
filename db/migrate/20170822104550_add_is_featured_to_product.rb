class AddIsFeaturedToProduct < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :is_featured, :integer
  end
end
