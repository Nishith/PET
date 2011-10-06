require 'spec_helper'

describe "LifecyclePhaseDeliverables" do
  describe "GET /lifecycle_phase_deliverables" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get lifecycle_phase_deliverables_path
      response.status.should be(200)
    end
  end
end
