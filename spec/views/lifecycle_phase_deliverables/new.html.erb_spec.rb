require 'spec_helper'

describe "lifecycle_phase_deliverables/new.html.erb" do
  before(:each) do
    assign(:lifecycle_phase_deliverable, stub_model(LifecyclePhaseDeliverable,
      :description => "MyText",
      :type_id => 1,
      :uom_id => 1,
      :lifecycle_phase_id => 1
    ).as_new_record)
  end
end
