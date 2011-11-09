require 'spec_helper'

describe HistoricalData do
  before(:each) do
    Factory(:historical_data, :estimated_size => 10, :production_rate => 1, :total_effort => 10)
    Factory(:historical_data, :estimated_size => 20, :production_rate => 2, :total_effort => 40)
    Factory(:historical_data, :estimated_size => 40, :production_rate => 1, :total_effort => 40)
  end

  it 'should return correct min,max and avg for needed fields' do
    results = HistoricalData.get_historical_data(1,1)
    results[:estimated_size][:avg].should == (10+20+40)/3.0
    results[:estimated_size][:min].should == 10.0
    results[:estimated_size][:max].should == 40.0
    results[:production_rate][:avg].should == (1+2+1)/3.0
    results[:production_rate][:min].should == 1.0
    results[:production_rate][:max].should == 2.0
    results[:total_effort][:avg].should == (10+40+40)/3.0
    results[:total_effort][:min].should == 10
    results[:total_effort][:max].should == 40
  end
end

# == Schema Information
#
# Table name: historical_data
#
#  id                           :integer         not null, primary key
#  project_phase_deliverable_id :integer
#  deliverable_type_id          :integer
#  complexity                   :integer
#  estimated_size               :float
#  production_rate              :float
#  total_effort                 :float
#  created_at                   :datetime
#  updated_at                   :datetime
#

