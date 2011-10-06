require 'spec_helper'

describe "lifecycle_phase_deliverables/index.html.erb" do
  before(:each) do
    assign(:lifecycle_phase_deliverables, [
      stub_model(LifecyclePhaseDeliverable,
        :description => "MyText",
        :type_id => 1,
        :uom_id => 1,
        :lifecycle_phase_id => 1
      ),
      stub_model(LifecyclePhaseDeliverable,
        :description => "MyText",
        :type_id => 1,
        :uom_id => 1,
        :lifecycle_phase_id => 1
      )
    ])
  end

  it "renders a list of lifecycle_phase_deliverables" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
