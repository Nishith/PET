class AddOrderToLifecyclePhase < ActiveRecord::Migration
  def self.up
    add_column :lifecycle_phases, :position, :integer
  end

  def self.down
    remove_column :lifecycle_phases, :position
  end
end
