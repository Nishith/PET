class CreateEffortLogs < ActiveRecord::Migration
  def self.up
    create_table :effort_logs do |t|
      t.date :date
      t.float :effort
      t.float :interrupt_time
      t.text :comments
      t.integer :project_phase_deliverable_id
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :effort_logs
  end
end
