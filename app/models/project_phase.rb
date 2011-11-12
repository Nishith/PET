# ProjectPhase belongs to Project.
# ProjectPhase has many ProjectPhaseDeliverable.
#
class ProjectPhase < ActiveRecord::Base

  belongs_to :project
  has_many :project_phase_deliverables, :order => "position"

  validates_presence_of(:name)
  validates_presence_of(:project_id)
  validates_presence_of(:position)
  validates_uniqueness_of(:position, :scope => :project_id)
  validates_uniqueness_of(:name, :scope => :project_id)
  validates_numericality_of(:position, :greater_than => 0)

  # return the name
  def to_s
    name
  end

  # return the total estimated effort of deliverables that belong to this phase
  def total_estimated_effort
    sum = 0.0
    self.project_phase_deliverables.each do |deliverable|
      if deliverable.total_effort.nil?
        next
      end
      sum += deliverable.total_effort
    end
    return sum
  end

  # return the total logged effort of deliverables that belong to this phase
  def total_actual_effort
    sum = 0.0
    self.project_phase_deliverables.each do |deliverable|
      sum += deliverable.total_logged_effort
    end
    return sum
  end
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
#  position    :integer
#

