require 'spec_helper'

describe "lifecycle_phases/index.html.erb" do
  before(:each) do
    assign(:lifecycle_phases, [
      stub_model(LifecyclePhase,
        :name => "Name",
        :description => "MyText",
        :lifecycle_id => 1
      ),
      stub_model(LifecyclePhase,
        :name => "Name",
        :description => "MyText",
        :lifecycle_id => 1
      )
    ])
  end

  it "renders a list of lifecycle_phases" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
