# EffortLog belongs to ProjectPhaseDeliverable and User
# It holds data for every logged effort
#
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
class EffortLog < ActiveRecord::Base
  belongs_to :project_phase_deliverable
  belongs_to :user

  validates_presence_of(:date,:effort,:user_id,:project_phase_deliverable_id)

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

