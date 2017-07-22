class CreateBusinessAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :business_addresses do |t|
      t.string :name
      t.references :business_listing
      t.string :address
      t.string :lat
      t.string :lng

      t.timestamps
    end
  end
end
