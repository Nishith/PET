# LifecyclePhase has many LifecyclePhaseDeliverable.
# LifecyclePhase belongs to Lifecycle.
#
class LifecyclePhase < ActiveRecord::Base
  validates_presence_of(:name)
  validates_uniqueness_of(:name)

  belongs_to :lifecycle
  has_many :lifecycle_phase_deliverables, :order => "position"

  validates_presence_of(:position)
  validates_uniqueness_of(:position, :scope => :lifecycle_id)
  validates_numericality_of(:position, :greater_than => 0)

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
#  position     :integer
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
#  position     :integer
#

