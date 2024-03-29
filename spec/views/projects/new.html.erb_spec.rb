require 'spec_helper'

describe "projects/new.html.erb" do
  before(:each) do
    assign(:new_project, stub_model(Project,
      :name => "My project",
      :description => "MyText",
      :lifecycle_name => "My lifecycle"
    ).as_new_record)
  end

  it "renders new project form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => projects_path, :method => "post" do
      assert_select "input#project_name", :name => "project[name]"
      assert_select "textarea#project_description", :name => "project[description]"
      assert_select "select#project_lifecycle_name", :name => "project[lifecycle_name]"
    end
  end
end
