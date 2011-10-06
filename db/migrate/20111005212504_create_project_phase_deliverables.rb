class CreateProjectPhaseDeliverables < ActiveRecord::Migration
  def self.up
    create_table :project_phase_deliverables do |t|
      t.string :name
      t.text :description
      t.integer :deliverable_type_id
      t.integer :uom_id
      t.integer :complexity
      t.float :estimated_size
      t.float :production_rate
      t.float :total_effort
      t.integer :project_phase_id

      t.timestamps
    end
  end

  def self.down
    drop_table :project_phase_deliverables
  end
end
