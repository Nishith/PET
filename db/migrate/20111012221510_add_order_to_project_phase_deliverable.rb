class AddOrderToProjectPhaseDeliverable < ActiveRecord::Migration
  def self.up
    add_column :project_phase_deliverables, :position, :integer
  end

  def self.down
    remove_column :project_phase_deliverables, :position
  end
end
