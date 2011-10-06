class CreateLifecyclePhaseDeliverables < ActiveRecord::Migration
  def self.up
    create_table :lifecycle_phase_deliverables do |t|
      t.text :description
      t.integer :deliverable_type_id
      t.integer :uom_id
      t.integer :lifecycle_phase_id

      t.timestamps
    end
  end

  def self.down
    drop_table :lifecycle_phase_deliverables
  end
end
