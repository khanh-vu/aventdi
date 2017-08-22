class Product < ApplicationRecord
  belongs_to :product_category
  mount_uploader :image, ImageUploader

  rails_admin do
    navigation_label 'Marketplace'
  end
end
