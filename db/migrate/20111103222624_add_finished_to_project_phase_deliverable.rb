class AddFinishedToProjectPhaseDeliverable < ActiveRecord::Migration
  def self.up
    add_column :project_phase_deliverables, :finished, :boolean
  end

  def self.down
    remove_column :project_phase_deliverables, :finished
  end
end
