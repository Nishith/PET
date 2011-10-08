class Uom < ActiveRecord::Base
  has_many :lifecycle_phase_deliverables
  has_many :project_phase_deliverables
end

# == Schema Information
#
# Table name: uoms
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

