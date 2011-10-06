class Lifecycle < ActiveRecord::Base
  has_many :lifecycle_phases
  has_many :lifecycle_phase_deliverables, :through => :lifecycle_phases
end
