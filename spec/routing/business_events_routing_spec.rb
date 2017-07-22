require "rails_helper"

RSpec.describe BusinessEventsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/business_events").to route_to("business_events#index")
    end

    it "routes to #new" do
      expect(:get => "/business_events/new").to route_to("business_events#new")
    end

    it "routes to #show" do
      expect(:get => "/business_events/1").to route_to("business_events#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/business_events/1/edit").to route_to("business_events#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/business_events").to route_to("business_events#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/business_events/1").to route_to("business_events#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/business_events/1").to route_to("business_events#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/business_events/1").to route_to("business_events#destroy", :id => "1")
    end

  end
end
