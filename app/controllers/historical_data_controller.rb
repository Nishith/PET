class HistoricalDataController < ApplicationController
  def get
    if(params[:deliverable_type_id].blank? || params[:complexity].blank?)
      render :json => {}
    end
    render :json => HistoricalData.get_historical_data(params[:deliverable_type_id], params[:complexity])
  end
end
