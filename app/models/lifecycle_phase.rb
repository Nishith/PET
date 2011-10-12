# LifecyclePhase has many LifecyclePhaseDeliverable.
# LifecyclePhase belongs to Lifecycle.
#
# == Schema Information
#
# Table name: lifecycle_phases
#
#  id           :integer         not null, primary key
#  name         :string(255)
#  description  :text
#  lifecycle_id :integer
#  created_at   :datetime
#  updated_at   :datetime
#

class LifecyclePhase < ActiveRecord::Base
  validates_presence_of(:name)
  validates_uniqueness_of(:name)

  belongs_to :lifecycle
  has_many :lifecycle_phase_deliverables
end

# == Schema Information
#
# Table name: lifecycle_phases
#
#  id           :integer         not null, primary key
#  name         :string(255)
#  description  :text
#  lifecycle_id :integer
#  created_at   :datetime
#  updated_at   :datetime
#

