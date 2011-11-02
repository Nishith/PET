class EffortLog < ActiveRecord::Base
  belongs_to :project_phase_deliverable
  belongs_to :user

end
