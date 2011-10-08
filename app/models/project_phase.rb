class ProjectPhase < ActiveRecord::Base
  belongs_to :project
  has_many :project_phase_deliverables
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

