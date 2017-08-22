require "rails_helper"

RSpec.describe OdotsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/odots").to route_to("odots#index")
    end

    it "routes to #new" do
      expect(:get => "/odots/new").to route_to("odots#new")
    end

    it "routes to #show" do
      expect(:get => "/odots/1").to route_to("odots#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/odots/1/edit").to route_to("odots#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/odots").to route_to("odots#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/odots/1").to route_to("odots#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/odots/1").to route_to("odots#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/odots/1").to route_to("odots#destroy", :id => "1")
    end

  end
end
