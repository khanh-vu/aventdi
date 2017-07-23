class BusinessEventCategory < ApplicationRecord
  has_many :business_events, :inverse_of => :business_event_category, foreign_key: 'business_event_categories_id'
  accepts_nested_attributes_for :business_events, :allow_destroy => true

  belongs_to :parent, class_name: 'BusinessEventCategory', optional: true, foreign_key: :parent_id

  mount_uploader :icon, ImageUploader
  mount_uploader :background, ImageUploader

  validates :name, :icon, :background, presence: true

  rails_admin do
    label 'Categories'
  end
end
