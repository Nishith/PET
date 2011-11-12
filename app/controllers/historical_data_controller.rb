# HistoricalDataController manages historical data.
#
class HistoricalDataController < ApplicationController

  # Triggered by "POST /historical_data/get".
  # should have params[:deliverable_type_id] and params[:complexity] as inputs
  # return matched historical data in json format
  def get
    if(params[:deliverable_type_id].blank? || params[:complexity].blank?)
      render :json => {}
    end
    render :json => HistoricalData.get_historical_data(params[:deliverable_type_id], params[:complexity])
  end
end
