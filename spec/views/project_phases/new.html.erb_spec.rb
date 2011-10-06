require 'spec_helper'

describe "project_phases/new.html.erb" do
  before(:each) do
    assign(:project_phase, stub_model(ProjectPhase,
      :name => "MyString",
      :description => "MyText",
      :project_id => 1
    ).as_new_record)
  end

  it "renders new project_phase form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => project_phases_path, :method => "post" do
      assert_select "input#project_phase_name", :name => "project_phase[name]"
      assert_select "textarea#project_phase_description", :name => "project_phase[description]"
      assert_select "input#project_phase_project_id", :name => "project_phase[project_id]"
    end
  end
end
