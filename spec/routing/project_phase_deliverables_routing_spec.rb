require "spec_helper"

describe ProjectPhaseDeliverablesController do
  describe "routing" do

    it "routes to #index" do
      get("/project_phase_deliverables").should route_to("project_phase_deliverables#index")
    end

    it "routes to #new" do
      get("/project_phase_deliverables/new").should route_to("project_phase_deliverables#new")
    end

    it "routes to #show" do
      get("/project_phase_deliverables/1").should route_to("project_phase_deliverables#show", :id => "1")
    end

    it "routes to #edit" do
      get("/project_phase_deliverables/1/edit").should route_to("project_phase_deliverables#edit", :id => "1")
    end

    it "routes to #create" do
      post("/project_phase_deliverables").should route_to("project_phase_deliverables#create")
    end

    it "routes to #update" do
      put("/project_phase_deliverables/1").should route_to("project_phase_deliverables#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/project_phase_deliverables/1").should route_to("project_phase_deliverables#destroy", :id => "1")
    end

  end
end
