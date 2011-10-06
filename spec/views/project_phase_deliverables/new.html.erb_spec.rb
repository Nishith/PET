require 'spec_helper'

describe "project_phase_deliverables/new.html.erb" do
  before(:each) do
    assign(:project_phase_deliverable, stub_model(ProjectPhaseDeliverable,
      :name => "MyString",
      :description => "MyText",
      :deliverable_type_id => 1,
      :uom_id => 1,
      :complexity => 1,
      :estimated_size => 1.5,
      :production_rate => 1.5,
      :total_effort => 1.5,
      :project_phase_id => 1
    ).as_new_record)
  end

  it "renders new project_phase_deliverable form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => project_phase_deliverables_path, :method => "post" do
      assert_select "input#project_phase_deliverable_name", :name => "project_phase_deliverable[name]"
      assert_select "textarea#project_phase_deliverable_description", :name => "project_phase_deliverable[description]"
      assert_select "input#project_phase_deliverable_deliverable_type_id", :name => "project_phase_deliverable[deliverable_type_id]"
      assert_select "input#project_phase_deliverable_uom_id", :name => "project_phase_deliverable[uom_id]"
      assert_select "input#project_phase_deliverable_complexity", :name => "project_phase_deliverable[complexity]"
      assert_select "input#project_phase_deliverable_estimated_size", :name => "project_phase_deliverable[estimated_size]"
      assert_select "input#project_phase_deliverable_production_rate", :name => "project_phase_deliverable[production_rate]"
      assert_select "input#project_phase_deliverable_total_effort", :name => "project_phase_deliverable[total_effort]"
      assert_select "input#project_phase_deliverable_project_phase_id", :name => "project_phase_deliverable[project_phase_id]"
    end
  end
end
