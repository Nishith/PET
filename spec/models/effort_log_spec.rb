require 'spec_helper'

describe EffortLog do
  pending "add some examples to (or delete) #{__FILE__}"
end

# == Schema Information
#
# Table name: effort_logs
#
#  id                           :integer         not null, primary key
#  date                         :date
#  effort                       :float
#  interrupt_time               :float
#  comments                     :text
#  project_phase_deliverable_id :integer
#  user_id                      :integer
#  created_at                   :datetime
#  updated_at                   :datetime
#

