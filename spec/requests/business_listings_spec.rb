require 'rails_helper'

RSpec.describe "BusinessListings", type: :request do
  describe "GET /business_listings" do
    it "works! (now write some real specs)" do
      get business_listings_path
      expect(response).to have_http_status(200)
    end
  end
end
