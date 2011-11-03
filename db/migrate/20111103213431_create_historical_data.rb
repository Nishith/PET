class CreateHistoricalData < ActiveRecord::Migration
  def self.up
    create_table :historical_data do |t|
      t.integer :project_phase_deliverable_id
      t.integer :deliverable_type_id
      t.integer :complexity
      t.float :estimated_size
      t.float :production_rate
      t.float :total_effort

      t.timestamps
    end
  end

  def self.down
    drop_table :historical_data
  end
end
