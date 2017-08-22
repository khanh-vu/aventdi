class ProductCategory < ApplicationRecord
  has_many :products
  mount_uploader :icon, ImageUploader

  rails_admin do
    navigation_label 'Marketplace'
    edit do
      exclude_fields :parent_id, :products
    end
  end
end
