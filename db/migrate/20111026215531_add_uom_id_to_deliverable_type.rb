class AddUomIdToDeliverableType < ActiveRecord::Migration
  def self.up
    add_column :deliverable_types, :uom_id, :integer
  end

  def self.down
    remove_column :deliverable_types, :uom_id
  end
end
