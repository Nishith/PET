require 'spec_helper'

describe "effort_logs/index.html.erb" do
  before(:each) do
    assign(:effort_logs, [
      stub_model(EffortLog,
        :effort => 1.5,
        :interrupt_time => 1.5,
        :comments => "MyText",
        :project_phase_deliverable_id => "",
        :user_id => ""
      ),
      stub_model(EffortLog,
        :effort => 1.5,
        :interrupt_time => 1.5,
        :comments => "MyText",
        :project_phase_deliverable_id => "",
        :user_id => ""
      )
    ])
  end

  it "renders a list of effort_logs" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.5.to_s, :count => 4
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.5.to_s, :count => 4
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    #assert_select "tr>td", :text => "".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    #assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
