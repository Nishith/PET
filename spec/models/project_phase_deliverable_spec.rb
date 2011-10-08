require 'spec_helper'

describe ProjectPhaseDeliverable do
  pending "add some examples to (or delete) #{__FILE__}"
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
#

