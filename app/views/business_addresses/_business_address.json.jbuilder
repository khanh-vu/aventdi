json.extract! business_address, :id, :name, :business_listing_id, :address, :latitude, :longitude, :created_at, :updated_at
json.url business_address_url(business_address, format: :json)
