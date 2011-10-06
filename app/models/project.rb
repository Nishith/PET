class Project < ActiveRecord::Base
  validates_presence_of(:name)
  validates_uniqueness_of(:name)

  has_many :project_phases
  has_many :project_phase_deliverables, :through => :project_phases
end
