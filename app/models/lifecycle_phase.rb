class LifecyclePhase < ActiveRecord::Base
  belongs_to :lifecycle
  has_many :lifecycle_phase_deliverables
end
