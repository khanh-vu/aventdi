class CreateProduct < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.references :product_category
      t.string :image
      t.integer :points

      t.timestamps
    end
  end
end
