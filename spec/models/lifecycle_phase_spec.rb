require 'spec_helper'

describe LifecyclePhase do

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
    @phase = Factory(:lifecycle_phase_test)

    @phase2 = Factory.build(:lifecycle_phase_test)
    @phase2.should_not be_valid

    @phase2.errors[:position].should_not be_empty
  end
end


# == Schema Information
#
# Table name: lifecycle_phases
#
#  id           :integer         not null, primary key
#  name         :string(255)
#  description  :text
#  lifecycle_id :integer
#  created_at   :datetime
#  updated_at   :datetime
#  position     :integer
#

