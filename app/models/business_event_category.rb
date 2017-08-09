class BusinessEventCategory < ApplicationRecord
  has_many :business_events, :inverse_of => :business_event_category
  accepts_nested_attributes_for :business_events, :allow_destroy => true

  belongs_to :parent, class_name: 'BusinessEventCategory', optional: true, foreign_key: :parent_id

  mount_uploader :icon, ImageUploader
  mount_uploader :background, ImageUploader
  mount_uploader :marker, ImageUploader

  validates :name, :icon, :background, :marker, presence: true

  rails_admin do
    label 'Categories'
    list do
      include_fields :id, :name, :icon, :marker, :background
    end
  end
end
