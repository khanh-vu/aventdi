class CreateBusinessEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :business_events do |t|
      t.string :name
      t.string :description
      t.integer :business_listing_id
      t.string :category_code
      t.string :activity_types

      t.timestamps
    end
  end
end
