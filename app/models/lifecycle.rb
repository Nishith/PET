# Lifecycle has many LifecyclePhase.
# LifecyclePhase has many LifecyclePhaseDeliverable.
#
# == Schema Information
#
# Table name: lifecycles
#
#  id          :integer         not null, primary key
#  name        :string(255)
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#

class Lifecycle < ActiveRecord::Base
  validates_presence_of(:name)
  validates_uniqueness_of(:name)

  has_many :lifecycle_phases
  has_many :lifecycle_phase_deliverables, :through => :lifecycle_phases
end

# == Schema Information
#
# Table name: lifecycles
#
#  id          :integer         not null, primary key
#  name        :string(255)
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#

