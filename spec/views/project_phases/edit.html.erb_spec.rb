require 'spec_helper'

describe "project_phases/edit.html.erb" do
  before(:each) do
    @project_phase = assign(:project_phase, stub_model(ProjectPhase,
      :name => "MyString",
      :description => "MyText",
      :project_id => 1
    ))
  end

  it "renders the edit project_phase form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => project_phases_path(@project_phase), :method => "post" do
      assert_select "input#project_phase_name", :name => "project_phase[name]"
      assert_select "textarea#project_phase_description", :name => "project_phase[description]"
      assert_select "input#project_phase_project_id", :name => "project_phase[project_id]"
    end
  end
end
