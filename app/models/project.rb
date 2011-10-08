class Project < ActiveRecord::Base
  validates_presence_of(:name)
  validates_uniqueness_of(:name)

  has_many :project_phases
  has_many :project_phase_deliverables, :through => :project_phases
end


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

