class HistoricalData < ActiveRecord::Base
  belongs_to :project_phase_deliverable
  belongs_to :deliverable_type

  def self.get_historical_data(deliverable_type_id, complexity)
    matches = self.where("deliverable_type_id = #{deliverable_type_id} AND complexity = #{complexity}")
    if(matches.count > 0)
      return {:estimated_size => {:avg => matches.average("estimated_size"),
                           :min => matches.minimum("estimated_size"),
                           :max => matches.maximum("estimated_size")},
      :production_rate => {:avg => matches.average("production_rate"),
                           :min => matches.minimum("production_rate"),
                           :max => matches.maximum("production_rate")},
      :total_effort => {:avg => matches.average("total_effort"),
                           :min => matches.minimum("total_effort"),
                           :max => matches.maximum("total_effort")}}
    else
      return {:estimated_size => {:avg => "-",
                           :min => "-",
                           :max => "-"},
      :production_rate => {:avg => "-",
                           :min => "-",
                           :max => "-"},
      :total_effort => {:avg => "-",
                           :min => "-",
                           :max => "-"}}
    end
  end

end