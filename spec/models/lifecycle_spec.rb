require 'spec_helper'

describe Lifecycle do
  it "should not be valid without a name" do
    subject.should_not be_valid
    subject.errors[:name].should_not be_empty
  end
end

# == Schema Information
#
# Table name: lifecycles
#
#  id          :integer         not null, primary key
#  name        :string(255)
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#

