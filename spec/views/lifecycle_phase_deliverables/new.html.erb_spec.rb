require 'spec_helper'

describe "lifecycle_phase_deliverables/new.html.erb" do
  before(:each) do
    assign(:lifecycle_phase_deliverable, stub_model(LifecyclePhaseDeliverable,
      :description => "MyText",
      :type_id => 1,
      :uom_id => 1,
      :lifecycle_phase_id => 1
    ).as_new_record)
  end

  it "renders new lifecycle_phase_deliverable form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => lifecycle_phase_deliverables_path, :method => "post" do
      assert_select "textarea#lifecycle_phase_deliverable_description", :name => "lifecycle_phase_deliverable[description]"
      assert_select "input#lifecycle_phase_deliverable_type_id", :name => "lifecycle_phase_deliverable[type_id]"
      assert_select "input#lifecycle_phase_deliverable_uom_id", :name => "lifecycle_phase_deliverable[uom_id]"
      assert_select "input#lifecycle_phase_deliverable_lifecycle_phase_id", :name => "lifecycle_phase_deliverable[lifecycle_phase_id]"
    end
  end
end
