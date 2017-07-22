require 'rails_helper'

RSpec.describe "BusinessEvents", type: :request do
  describe "GET /business_events" do
    it "works! (now write some real specs)" do
      get business_events_path
      expect(response).to have_http_status(200)
    end
  end
end
