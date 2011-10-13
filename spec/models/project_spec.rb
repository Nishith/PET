require 'spec_helper'

describe Project do

  it "should not be valid without a name" do
    subject.should_not be_valid
    subject.errors[:name].should_not be_empty
  end

  it "name should be unique" do
    @project1 = Factory.create(:project)

    Factory.build(:project).should_not be_valid
  end
end


# == Schema Information
#
# Table name: projects
#
#  id             :integer         not null, primary key
#  name           :string(255)
#  description    :text
#  created_at     :datetime
#  updated_at     :datetime
#  lifecycle_name :string(255)
#

