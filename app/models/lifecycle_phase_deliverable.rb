class LifecyclePhaseDeliverable < ActiveRecord::Base
  belongs_to :lifecycle_phase
  belongs_to :deliverable_type
  belongs_to :uom
end
