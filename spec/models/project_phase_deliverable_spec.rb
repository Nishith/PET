require 'spec_helper'

describe ProjectPhaseDeliverable do
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
    @phase = Factory(:project_phase_deliverable, :position => 1)

    @phase2 = Factory.build(:project_phase_deliverable, :position => 1)
    @phase2.should_not be_valid
    @phase2.errors[:position].should_not be_empty
  end

  it "should invalidate an incorrect total effort calculation" do
    @phase = Factory(:project_phase_deliverable, :position => 1)
    @phase.estimated_size = 10
    @phase.production_rate = 5
    @phase.total_effort = 10
    @phase.should_not be_valid
    @phase.errors[:total_effort].should_not be_empty
  end

   it "should validate  a correct total effort calculation" do
    @phase = Factory(:project_phase_deliverable, :position => 1)
    @phase.estimated_size = 10
    @phase.production_rate = 5
    @phase.total_effort = 50
    @phase.should be_valid
  end
end

# == Schema Information
#
# Table name: project_phase_deliverables
#
#  id                  :integer         not null, primary key
#  name                :string(255)
#  description         :text
#  deliverable_type_id :integer
#  uom_id              :integer
#  complexity          :integer
#  estimated_size      :float
#  production_rate     :float
#  total_effort        :float
#  project_phase_id    :integer
#  created_at          :datetime
#  updated_at          :datetime
#

