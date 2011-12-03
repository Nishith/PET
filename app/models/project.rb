# Project has many ProjectPhase.
# Project has many ProjectPhaseDeliverable.
#
# == Schema Information
#
# Table name: projects
#
#  id             :integer         not null, primary key
#  name           :string(255)
#  description    :text
#  created_at     :datetime
#  updated_at     :datetime
#  lifecycle_name :string(255)
#
class Project < ActiveRecord::Base
  validates_presence_of(:name)
  validates_uniqueness_of(:name)

  has_many :project_phases, :order => "position"
  has_many :project_phase_deliverables, :through => :project_phases

  # return an array of all logged effort
  def effort_logs
    self.project_phase_deliverables.collect{|d| d.effort_logs }.flatten
  end

  # return the total logged effort of deliverables that belong to this project
  def total_actual_effort
    self.effort_logs.inject(0){|sum, ef| sum + ef.effort}
  end

  # return the total estimated effort of deliverables that belong to this project
  def total_estimated_effort
    sum = 0.0;
    self.project_phase_deliverables.each do |deliverable|
      if deliverable.total_effort.nil?
        next
      end
      sum += deliverable.total_effort
    end
    return sum
  end
end

