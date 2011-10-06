class CreateLifecyclePhases < ActiveRecord::Migration
  def self.up
    create_table :lifecycle_phases do |t|
      t.string :name
      t.text :description
      t.integer :lifecycle_id

      t.timestamps
    end
  end

  def self.down
    drop_table :lifecycle_phases
  end
end
