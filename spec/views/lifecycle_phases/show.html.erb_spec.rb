require 'spec_helper'

describe "lifecycle_phases/show.html.erb" do
  before(:each) do
    @lifecycle = Factory(:lifecycle)
    @lifecycle_phase = assign(:lifecycle_phase, stub_model(LifecyclePhase,
      :name => "Name",
      :description => "MyText",
      :lifecycle => @lifecycle
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
