require 'spec_helper'

describe "project_phase_deliverables/show.html.erb" do
  before(:each) do
    @project_phase_deliverable = assign(:project_phase_deliverable, stub_model(ProjectPhaseDeliverable,
      :name => "Name",
      :description => "MyText",
      :deliverable_type_id => 1,
      :uom_id => 1,
      :complexity => 1,
      :estimated_size => 1.5,
      :production_rate => 1.5,
      :total_effort => 1.5,
      :project_phase_id => 1
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
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1.5/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1.5/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1.5/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
