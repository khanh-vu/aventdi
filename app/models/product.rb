class Product < ApplicationRecord
  belongs_to :product_category
  mount_uploader :image, ImageUploader

  rails_admin do
    navigation_label 'Marketplace'
    edit do
      include_all_fields
      field :is_featured do
        partial "business_event/featured"
      end
    end
  end
end
