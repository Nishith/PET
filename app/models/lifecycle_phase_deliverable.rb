class LifecyclePhaseDeliverable < ActiveRecord::Base
  belongs_to :lifecycle_phase
  belongs_to :deliverable_type
  belongs_to :uom
end

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

