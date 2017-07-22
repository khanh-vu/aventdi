json.extract! business_listing, :id, :name, :owner_id, :description, :address, :phone_number, :active, :latitude, :longitude, :created_at, :updated_at
json.url business_listing_url(business_listing, format: :json)
