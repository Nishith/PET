require 'spec_helper'

describe "project_phase_deliverables/index.html.erb" do
  before(:each) do
    assign(:project_phase_deliverables, [
      stub_model(ProjectPhaseDeliverable,
        :name => "Name",
        :description => "MyText",
        :deliverable_type_id => 1,
        :uom_id => 2,
        :complexity => 3,
        :estimated_size => 1.5,
        :production_rate => 2.5,
        :total_effort => 3.5,
        :project_phase_id => 4
      ),
      stub_model(ProjectPhaseDeliverable,
        :name => "Name",
        :description => "MyText",
        :deliverable_type_id => 1,
        :uom_id => 2,
        :complexity => 3,
        :estimated_size => 1.5,
        :production_rate => 2.5,
        :total_effort => 3.5,
        :project_phase_id => 4
      )
    ])
  end

  it "renders a list of project_phase_deliverables" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 2.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 3.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 2.5.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 3.5.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 4.to_s, :count => 2
  end
end
