require "rails_helper"

RSpec.describe BusinessAddressesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/business_addresses").to route_to("business_addresses#index")
    end

    it "routes to #new" do
      expect(:get => "/business_addresses/new").to route_to("business_addresses#new")
    end

    it "routes to #show" do
      expect(:get => "/business_addresses/1").to route_to("business_addresses#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/business_addresses/1/edit").to route_to("business_addresses#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/business_addresses").to route_to("business_addresses#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/business_addresses/1").to route_to("business_addresses#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/business_addresses/1").to route_to("business_addresses#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/business_addresses/1").to route_to("business_addresses#destroy", :id => "1")
    end

  end
end
