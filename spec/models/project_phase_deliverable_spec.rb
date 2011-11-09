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
    @phase = Factory(:project_phase)
    @deliverable = Factory(:project_phase_deliverable, :position => 1, :project_phase => @phase)

    @deliverable2 = Factory.build(:project_phase_deliverable, :position => 1, :project_phase => @phase)
    @deliverable2.should_not be_valid
    @deliverable2.errors[:position].should_not be_empty
  end

  it "should invalidate an incorrect total effort calculation" do
    @deliverable = Factory(:project_phase_deliverable, :position => 1)
    @deliverable.estimated_size = 10
    @deliverable.production_rate = 5
    @deliverable.total_effort = 10
    @deliverable.should_not be_valid
    @deliverable.errors[:total_effort].should_not be_empty
  end

  it "should validate  a correct total effort calculation" do
    @phase = Factory(:project_phase_deliverable, :position => 1)
    @phase.estimated_size = 10
    @phase.production_rate = 5
    @phase.total_effort = 50
    @phase.should be_valid
  end

  it "should not be able to update if there are some efforts logged" do
    @effort_log = Factory(:effort_log)
    @effort_log.project_phase_deliverable.update_attributes({:name => "Project Deliverable name Test"}).should == false
  end

  it "should allow not unique names on create" do
    @deliverable = Factory(:project_phase_deliverable)
    @deliverable2 = Factory.build(:project_phase_deliverable, :name => @deliverable.name)
    @deliverable2.should be_valid
  end

  it "should not allow not unique names on update" do
    @phase = Factory(:project_phase)
    @deliverable = Factory(:project_phase_deliverable, :project_phase => @phase)
    @deliverable2 = Factory(:project_phase_deliverable, :project_phase => @phase)
    @deliverable2.name = @deliverable.name
    @deliverable2.should_not be_valid
    @deliverable2.errors[:name].should_not be_empty
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
#  position            :integer
#  finished            :boolean
#

