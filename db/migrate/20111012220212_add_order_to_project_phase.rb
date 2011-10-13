class AddOrderToProjectPhase < ActiveRecord::Migration
  def self.up
    add_column :project_phases, :position, :integer
  end

  def self.down
    remove_column :project_phases, :position
  end
end
