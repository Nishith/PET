require "spec_helper"

describe LifecyclesController do
  describe "routing" do

    it "routes to #index" do
      get("/lifecycles").should route_to("lifecycles#index")
    end

    it "routes to #new" do
      get("/lifecycles/new").should route_to("lifecycles#new")
    end

    it "routes to #show" do
      get("/lifecycles/1").should route_to("lifecycles#show", :id => "1")
    end

    it "routes to #edit" do
      get("/lifecycles/1/edit").should route_to("lifecycles#edit", :id => "1")
    end

    it "routes to #create" do
      post("/lifecycles").should route_to("lifecycles#create")
    end

    it "routes to #update" do
      put("/lifecycles/1").should route_to("lifecycles#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/lifecycles/1").should route_to("lifecycles#destroy", :id => "1")
    end

  end
end
