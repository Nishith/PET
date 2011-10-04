require 'spec_helper'

describe Project do

  it "should not be valid without a name" do
    subject.should_not be_valid
    subject.errors[:name].should_not be_nil
  end

  it "name should be unique" do
    @project1 = Factory.create(:project)

    Factory.build(:project).should_not be_valid
  end
end
