class BusinessEventCategory < ApplicationRecord
  has_many :business_events, foreign_key: 'business_event_categories_id'
  belongs_to :parent, class_name: 'BusinessEventCategory', optional: true, foreign_key: :parent_id

  mount_uploader :icon, ImageUploader
  mount_uploader :background, ImageUploader

  validates :name, :icon, :background, presence: true

  rails_admin do
    label 'Categories'
  end
end
