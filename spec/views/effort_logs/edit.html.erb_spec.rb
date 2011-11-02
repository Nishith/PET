require 'spec_helper'

describe "effort_logs/edit.html.erb" do
  before(:each) do
    @effort_log = assign(:effort_log, stub_model(EffortLog,
      :effort => 1.5,
      :interrupt_time => 1.5,
      :comments => "MyText",
      :project_phase_deliverable_id => "",
      :user_id => ""
    ))
  end

  it "renders the edit effort_log form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => effort_logs_path(@effort_log), :method => "post" do
      assert_select "input#effort_log_effort", :name => "effort_log[effort]"
      assert_select "input#effort_log_interrupt_time", :name => "effort_log[interrupt_time]"
      assert_select "textarea#effort_log_comments", :name => "effort_log[comments]"
      assert_select "input#effort_log_project_phase_deliverable_id", :name => "effort_log[project_phase_deliverable_id]"
      assert_select "input#effort_log_user_id", :name => "effort_log[user_id]"
    end
  end
end
