class HistoricalData < ActiveRecord::Base
  belongs_to :project_phase_deliverable
  belongs_to :deliverable_type

  def self.get_historical_data(deliverable_type_id, complexity)
    matches = self.where("deliverable_type_id = #{deliverable_type_id} AND complexity = #{complexity}")

  end

end
