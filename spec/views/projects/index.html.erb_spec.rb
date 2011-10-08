require 'spec_helper'

describe "projects/index.html.erb" do
  before(:each) do
    assign(:projects, [
      stub_model(Project,
        :name => "My project",
        :description => "MyText",
        :lifecycle_name => "My lifecycle"
      ),
      stub_model(Project,
        :name => "My next project",
        :description => "MyText",
        :lifecycle_name => "My lifecycle"
      )
    ])
  end

  it "renders a list of projects" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "My project".to_s, :count => 1
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "My next project".to_s, :count => 1
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "My lifecycle".to_s, :count => 2
  end
end
