require 'spec_helper'

describe "lifecycle_phase_deliverables/edit.html.erb" do
  before(:each) do
    @lifecycle_phase_deliverable = assign(:lifecycle_phase_deliverable, stub_model(LifecyclePhaseDeliverable,
      :description => "MyText",
      :type_id => 1,
      :uom_id => 1,
      :lifecycle_phase_id => 1
    ))
  end

end
