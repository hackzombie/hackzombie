require "spec_helper"

describe HackplatformrelationsController do
  describe "routing" do

    it "routes to #index" do
      get("/hackplatformrelations").should route_to("hackplatformrelations#index")
    end

    it "routes to #new" do
      get("/hackplatformrelations/new").should route_to("hackplatformrelations#new")
    end

    it "routes to #show" do
      get("/hackplatformrelations/1").should route_to("hackplatformrelations#show", :id => "1")
    end

    it "routes to #edit" do
      get("/hackplatformrelations/1/edit").should route_to("hackplatformrelations#edit", :id => "1")
    end

    it "routes to #create" do
      post("/hackplatformrelations").should route_to("hackplatformrelations#create")
    end

    it "routes to #update" do
      put("/hackplatformrelations/1").should route_to("hackplatformrelations#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/hackplatformrelations/1").should route_to("hackplatformrelations#destroy", :id => "1")
    end

  end
end
