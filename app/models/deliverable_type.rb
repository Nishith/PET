# It is a deliverable Type conversion table.
# Other objects may hold a deliverable_type_id and look up in this table to get the type name.
#
# == Schema Information
#
# Table name: deliverable_types
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class DeliverableType < ActiveRecord::Base
  has_many :lifecycle_phase_deliverables
  has_many :project_phase_deliverables
end

# == Schema Information
#
# Table name: deliverable_types
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

