require 'spec_helper'

describe "lifecycles/show.html.erb" do
  before(:each) do
    @lifecycle = assign(:lifecycle, stub_model(Lifecycle,
      :name => "Name",
      :description => "MyText"
    ))
    @lifecycles = []
    @lifecycles << @lifecycle
    @new_lifecycle = Lifecycle.new
    @lifecycle_phase = LifecyclePhase.new
    @new_lifecycle_phase_deliverable = LifecyclePhaseDeliverable.new
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
  end
end
