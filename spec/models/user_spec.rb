require 'spec_helper'

describe User do
  [:email, :name, :role].each do |attr|
    it "should not be valid without #{attr}" do
      subject.should_not be_valid
      subject.errors[attr].should_not be_nil
    end

  end

  it "name should be unique" do
    @user1 = Factory.create(:developer)

    Factory.build(:developer).should_not be_valid

  end

end
