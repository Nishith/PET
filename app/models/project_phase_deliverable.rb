# ProjectPhaseDeliverable belongs to ProjectPhase
# It has type through deliverable_type_id.
# It has unit of measurement through uom_id.
#
class ProjectPhaseDeliverable < ActiveRecord::Base
  belongs_to :project_phase
  belongs_to :deliverable_type
  belongs_to :uom
  has_many :effort_logs

  validates_presence_of(:position,:name)
  validates_uniqueness_of(:position, :scope => :project_phase_id)
  validates_uniqueness_of(:name, :on => :update, :scope => :project_phase_id)
  validates_numericality_of(:position, :greater_than => 0)
  validate :total_effort_calculation_should_be_valid, :if => :validate_total_effort?

  # return the deliverables being logged effort against recently
  def self.recently_logged
    recent_logs = EffortLog.select("effort_logs.project_phase_deliverable_id, MAX(effort_logs.updated_at)").order("MAX(effort_logs.updated_at) DESC").group("project_phase_deliverable_id")
    recent_logs.collect{|l| l.project_phase_deliverable }
  end

  # return the sum of total logged effort
  def total_logged_effort
    self.effort_logs.inject (0){|sum, ef| sum + ef.effort}
  end

  # return the status. Can be "New", "In progress" or "Finished"
  def status_s
    self.finished?? "Finished" : ( self.effort_logs.empty?? "New":"In Progress")
  end

  after_destroy { |record|
    go_after = ProjectPhaseDeliverable.where("project_phase_id = #{record.project_phase_id} AND position > #{record.position}")
    go_after.each do |d|
      d.position = d.position - 1
      d.save
    end
  }

  before_update { |record|
    if(record.has_effort_log?)
      record.errors[:total_effort] = "You cannot update a deliverable that has logged effort"
      false
    else
      true
    end
  }

  # the methed converts the complexity integer of the deliverable to a real string
  # by consulting LifecylePhaseDeliverable::COMPLEXITY constant
  # return value: complexity string
  def complexity_str
    if !self.complexity.blank? &&
        self.complexity >= 1 &&
        self.complexity <= LifecyclePhaseDeliverable::COMPLEXITY.size then
      LifecyclePhaseDeliverable::COMPLEXITY[self.complexity - 1]
    else
      ""
    end
  end

  # return boolean to represent whether the deliverable has effort logs
  def has_effort_log?
    if EffortLog.find_by_project_phase_deliverable_id(self.id) then
      return true
    end
    return false
  end

  # return whether the deliverable has production rate, size and total effort
  def validate_total_effort?
    self.production_rate? && self.estimated_size? && self.total_effort?
  end

  # If the total effort does not equal the multiplication of size and production rate, append an error
  def total_effort_calculation_should_be_valid
    if self.estimated_size * self.production_rate != self.total_effort
      errors.add(:total_effort, "should be Estimated Size times Production Rate")
    end
  end


end


# == Schema Information
#
# Table name: project_phase_deliverables
#
#  id                  :integer         not null, primary key
#  name                :string(255)
#  description         :text
#  deliverable_type_id :integer
#  uom_id              :integer
#  complexity          :integer
#  estimated_size      :float
#  production_rate     :float
#  total_effort        :float
#  project_phase_id    :integer
#  created_at          :datetime
#  updated_at          :datetime
#  position            :integer
#  finished            :boolean
#

