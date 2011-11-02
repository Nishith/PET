require 'spec_helper'

describe "effort_logs/show.html.erb" do
  before(:each) do
    @effort_log = assign(:effort_log, stub_model(EffortLog,
      :effort => 1.5,
      :interrupt_time => 1.5,
      :comments => "MyText",
      :project_phase_deliverable_id => "",
      :user_id => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1.5/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1.5/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
  end
end
