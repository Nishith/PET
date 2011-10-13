# ProjectPhase belongs to Project.
# ProjectPhase has many ProjectPhaseDeliverable.
#
# == Schema Information
#
# Table name: project_phases
#
#  id          :integer         not null, primary key
#  name        :string(255)
#  description :text
#  project_id  :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class ProjectPhase < ActiveRecord::Base

  belongs_to :project
  has_many :project_phase_deliverables, :order => ":position"

  validates_presence_of(:name)
  validates_presence_of(:position)
  validates_uniqueness_of(:position, :scope => :project_id)
  validates_numericality_of(:position, :greater_than => 0)

end

# == Schema Information
#
# Table name: project_phases
#
#  id          :integer         not null, primary key
#  name        :string(255)
#  description :text
#  project_id  :integer
#  created_at  :datetime
#  updated_at  :datetime
#

