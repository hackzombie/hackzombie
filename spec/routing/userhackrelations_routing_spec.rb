require "spec_helper"

describe UserhackrelationsController do
  describe "routing" do

    it "routes to #index" do
      get("/userhackrelations").should route_to("userhackrelations#index")
    end

    it "routes to #new" do
      get("/userhackrelations/new").should route_to("userhackrelations#new")
    end

    it "routes to #show" do
      get("/userhackrelations/1").should route_to("userhackrelations#show", :id => "1")
    end

    it "routes to #edit" do
      get("/userhackrelations/1/edit").should route_to("userhackrelations#edit", :id => "1")
    end

    it "routes to #create" do
      post("/userhackrelations").should route_to("userhackrelations#create")
    end

    it "routes to #update" do
      put("/userhackrelations/1").should route_to("userhackrelations#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/userhackrelations/1").should route_to("userhackrelations#destroy", :id => "1")
    end

  end
end
