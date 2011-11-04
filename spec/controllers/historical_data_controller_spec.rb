require 'spec_helper'

describe HistoricalDataController do
  before(:each) do
    @admin = Factory(:admin)
    sign_in @admin
    Factory(:historical_data, :estimated_size => 10, :production_rate => 1, :total_effort => 10)
    Factory(:historical_data, :estimated_size => 20, :production_rate => 2, :total_effort => 40)
    Factory(:historical_data, :estimated_size => 40, :production_rate => 1, :total_effort => 40)
  end

  describe "POST get" do
    it "returns the correct JSON" do
      post :get, :deliverable_type_id => 1, :complexity => 1
      response.body.should == HistoricalData.get_historical_data(1,1).to_json
    end

  end

  #describe "GET get" do
  #  it "does not match a route using get" do
  #    lambda {get :get}.should raise_exception(ActionController::RoutingError)
  #  end
  #end
end
