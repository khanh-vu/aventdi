json.extract! business_event, :id, :name, :description, :business_listing_id, :category_code, :activity_types, :created_at, :updated_at
json.url business_event_url(business_event, format: :json)
