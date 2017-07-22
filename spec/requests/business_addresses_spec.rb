require 'rails_helper'

RSpec.describe "BusinessAddresses", type: :request do
  describe "GET /business_addresses" do
    it "works! (now write some real specs)" do
      get business_addresses_path
      expect(response).to have_http_status(200)
    end
  end
end
