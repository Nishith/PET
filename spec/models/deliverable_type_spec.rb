require 'spec_helper'

describe DeliverableType do
  it "should not be valid without a name" do
    subject.should_not be_valid
    subject.errors[:name].should_not be_empty
  end
end


# == Schema Information
#
# Table name: deliverable_types
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#  uom_id     :integer
#

