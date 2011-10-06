require "spec_helper"

describe ProjectPhasesController do
  describe "routing" do

    it "routes to #index" do
      get("/project_phases").should route_to("project_phases#index")
    end

    it "routes to #new" do
      get("/project_phases/new").should route_to("project_phases#new")
    end

    it "routes to #show" do
      get("/project_phases/1").should route_to("project_phases#show", :id => "1")
    end

    it "routes to #edit" do
      get("/project_phases/1/edit").should route_to("project_phases#edit", :id => "1")
    end

    it "routes to #create" do
      post("/project_phases").should route_to("project_phases#create")
    end

    it "routes to #update" do
      put("/project_phases/1").should route_to("project_phases#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/project_phases/1").should route_to("project_phases#destroy", :id => "1")
    end

  end
end
