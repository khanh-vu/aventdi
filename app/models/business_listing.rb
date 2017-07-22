class BusinessListing < ApplicationRecord
  has_many :business_addresses, :inverse_of => :business_listing
  accepts_nested_attributes_for :business_addresses, :allow_destroy => true

  validates :name, :phone_number, :address, presence: true

  geocoded_by :address   # can also be an IP address
  after_validation :geocode          # auto-fetch coordinates

  rails_admin do
    edit do
      exclude_fields :latitude, :longitude
      field :active do
        partial "business_listing/active"
      end
    end
    show do
      include_all_fields
      field :latitude do
        label "Map location"
        pretty_value do
          bindings[:view].render(
              partial: "show_map", locals:  {field: self, form: bindings[:form], object: bindings[:object]}
          )
        end
      end
      exclude_fields :longitude, :business_addresseses
    end
  end
end
