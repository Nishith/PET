# LifecyclePhaseDeliverable belongs to LifecyclePhase.
# It does not have a name.
# It has a type (through deliverable_type_id) and unit of measure (through uom_id).
#
# == Schema Information
#
# Table name: lifecycle_phase_deliverables
#
#  id                  :integer         not null, primary key
#  description         :text
#  deliverable_type_id :integer
#  uom_id              :integer
#  lifecycle_phase_id  :integer
#  created_at          :datetime
#  updated_at          :datetime
#

class LifecyclePhaseDeliverable < ActiveRecord::Base

  belongs_to :lifecycle_phase
  belongs_to :deliverable_type
  belongs_to :uom

  validates_presence_of(:position)
  validates_uniqueness_of(:position, :scope => :lifecycle_phase_id)
  validates_numericality_of(:position, :greater_than => 0)

  # The constant is for converting complexity integer to real meaningful string
  COMPLEXITY = ["Low","Medium","High"]
end


