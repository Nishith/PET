require 'spec_helper'

describe "lifecycle_phase_deliverables/show.html.erb" do
  before(:each) do
    @lifecycle_phase_deliverable = assign(:lifecycle_phase_deliverable, stub_model(LifecyclePhaseDeliverable,
      :description => "MyText",
      :type_id => 1,
      :uom_id => 1,
      :lifecycle_phase_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
