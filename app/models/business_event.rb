class BusinessEvent < ApplicationRecord
  belongs_to :business_listing, :foreign_key => 'business_listings_id'
  belongs_to :business_event_category, :foreign_key => 'business_event_categories_id'

  validates :business_listing, :presence => true
  validates :business_event_category, :presence => true

  validates :name, :activity_types, :presence => true
end
