class UpdateReferences < ActiveRecord::Migration[5.1]
  def change
    add_reference :business_events, :business_listings, foreign_key: true
    add_reference :business_events, :business_event_categories, foreign_key: true
  end
end
