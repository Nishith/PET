require "spec_helper"

describe EffortLogsController do
  describe "routing" do

    it "routes to #index" do
      get("/effort_logs").should route_to("effort_logs#index")
    end

    it "routes to #new" do
      get("/effort_logs/new").should route_to("effort_logs#new")
    end

    it "routes to #show" do
      get("/effort_logs/1").should route_to("effort_logs#show", :id => "1")
    end

    it "routes to #edit" do
      get("/effort_logs/1/edit").should route_to("effort_logs#edit", :id => "1")
    end

    it "routes to #create" do
      post("/effort_logs").should route_to("effort_logs#create")
    end

    it "routes to #update" do
      put("/effort_logs/1").should route_to("effort_logs#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/effort_logs/1").should route_to("effort_logs#destroy", :id => "1")
    end

  end
end
