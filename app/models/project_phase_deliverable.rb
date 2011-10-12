# ProjectPhaseDeliverable belongs to ProjectPhase
# It has type through deliverable_type_id.
# It has unit of measurement through uom_id.
#
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

class ProjectPhaseDeliverable < ActiveRecord::Base
  belongs_to :project_phase
  belongs_to :deliverable_type
  belongs_to :uom

  # the methed converts the complexity integer of the deliverable to a real string
  # by consulting LifecylePhaseDeliverable::COMPLEXITY constant
  # return value: complexity string
  def complexity_str
    if !self.complexity.blank? &&
        self.complexity >= 0 &&
        self.complexity < LifecyclePhaseDeliverable::COMPLEXITY.size then
      LifecyclePhaseDeliverable::COMPLEXITY[self.complexity]
    else
      ""
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
#

