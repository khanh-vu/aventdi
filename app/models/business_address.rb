class BusinessAddress < ApplicationRecord
  belongs_to :business_listing, :inverse_of => :business_addresses

  has_many :business_event_addresses
  has_many :business_events, :through => :business_event_addresses, :foreign_key => 'address_id'

  geocoded_by :address   # can also be an IP address
  after_validation :geocode          # auto-fetch coordinates

  rails_admin do
    edit do
      include_fields :name, :address
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