class CreateProjectPhases < ActiveRecord::Migration
  def self.up
    create_table :project_phases do |t|
      t.string :name
      t.text :description
      t.integer :project_id

      t.timestamps
    end
  end

  def self.down
    drop_table :project_phases
  end
end
