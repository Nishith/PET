require 'spec_helper'

describe ProjectPhase do
  [:name, :position].each do |attr|
    it "should not be valid without an #{attr}" do
      subject.should_not be_valid
      subject.errors[attr].should_not be_empty
    end
  end

  it "should not be valid with a negative position" do
    subject.position = -1
    subject.should_not be_valid
    subject.errors[:position].should_not be_empty
  end

  it "should not have an existing position number" do
    @phase = Factory(:project_phase)

    @phase2 = Factory.build(:project_phase)
    @phase2.should_not be_valid
    @phase2.errors[:position].should_not be_empty
  end

  it "should not be valid without a name" do
    subject.should_not be_valid
    subject.errors[:name].should_not be_empty
  end

  it "should not be valid without a project_id" do
    subject.should_not be_valid
    subject.errors[:project_id].should_not be_empty
  end

  it "name should be unique" do
    @phase1 = Factory.create(:project_phase)

    Factory.build(:project_phase).should_not be_valid
  end
end

# == Schema Information
#
# Table name: project_phases
#
#  id          :integer         not null, primary key
#  name        :string(255)
#  description :text
#  project_id  :integer
#  created_at  :datetime
#  updated_at  :datetime
#

