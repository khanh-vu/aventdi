class BusinessAddress < ApplicationRecord
  belongs_to :business_listing, :inverse_of => :business_addresses

  geocoded_by :address   # can also be an IP address
  after_validation :geocode          # auto-fetch coordinates

  rails_admin do
    edit do
      exclude_fields :latitude, :longitude
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
      exclude_fields :longitude
    end
    list do
      exclude_fields :business_listing
    end
  end
end