class ProjectPhase < ActiveRecord::Base
  belongs_to :project
  has_many :project_phase_deliverables
end
