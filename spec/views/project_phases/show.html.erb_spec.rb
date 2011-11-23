require 'spec_helper'

describe "project_phases/show.html.erb" do
  before(:each) do
    @project = Factory(:project)
    @project_phase = assign(:project_phase, stub_model(ProjectPhase,
      :name => "Name",
      :description => "MyText",
      :project => @project
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
