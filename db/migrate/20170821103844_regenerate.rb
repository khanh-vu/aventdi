class Regenerate < ActiveRecord::Migration[5.1]
  def change
    drop_table :business_event_addresses
    create_table :business_event_addresses do |t|
      t.references :business_event
      t.references :business_address

      t.timestamps
    end
  end
end
