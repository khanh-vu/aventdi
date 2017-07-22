class CreateBusinessListings < ActiveRecord::Migration[5.1]
  def change
    create_table :business_listings do |t|
      t.string :name
      t.integer :owner_id
      t.string :description
      t.string :address
      t.string :phone_number
      t.integer :active
      t.string :lat
      t.string :long

      t.timestamps
    end
  end
end
