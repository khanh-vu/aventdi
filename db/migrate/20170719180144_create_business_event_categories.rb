class CreateBusinessEventCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :business_event_categories do |t|
      t.string :code
      t.integer :business_event_id
      t.string :name
      t.string :parent_code
      t.integer :level
      t.string :icon
      t.string :background

      t.timestamps
    end
  end
end
