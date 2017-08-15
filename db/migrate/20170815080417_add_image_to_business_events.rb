class AddImageToBusinessEvents < ActiveRecord::Migration[5.1]
  def change
    add_column :business_events, :image, :string
  end
end
