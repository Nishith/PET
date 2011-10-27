# It is Unit of Measurement conversion table.
# Other objects may hold a uom_id and look up in this table to get the measurement name.
#
# == Schema Information
#
# Table name: uoms
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Uom < ActiveRecord::Base
  has_many :lifecycle_phase_deliverables
  has_many :project_phase_deliverables
  has_one :deliverable_type
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

