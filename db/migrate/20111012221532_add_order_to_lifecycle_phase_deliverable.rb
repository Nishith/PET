class AddOrderToLifecyclePhaseDeliverable < ActiveRecord::Migration
  def self.up
    add_column :lifecycle_phase_deliverables, :position, :integer
  end

  def self.down
    remove_column :lifecycle_phase_deliverables, :position
  end
end
