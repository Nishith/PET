class ProjectPhaseDeliverable < ActiveRecord::Base
  belongs_to :project_phase
  belongs_to :deliverable_type
  belongs_to :uom
end
