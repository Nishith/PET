require 'spec_helper'

describe LifecyclePhaseDeliverable do
  it "should not be valid without an position" do
    subject.should_not be_valid
    subject.errors[:position].should_not be_empty
  end

  it "should not be valid with a negative position" do
    subject.position = -1
    subject.should_not be_valid
    subject.errors[:position].should_not be_empty
  end

  it "should not have an existing position number" do
    @phase = Factory(:lifecycle_phase_deliverable)

    @phase2 = Factory.build(:lifecycle_phase_deliverable)
    @phase2.should_not be_valid
    @phase2.errors[:position].should_not be_empty
  end
end

# == Schema Information
#
# Table name: lifecycle_phase_deliverables
#
#  id                  :integer         not null, primary key
#  description         :text
#  deliverable_type_id :integer
#  uom_id              :integer
#  lifecycle_phase_id  :integer
#  created_at          :datetime
#  updated_at          :datetime
#

