class CreateDeliverableTypes < ActiveRecord::Migration
  def self.up
    create_table :deliverable_types do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :deliverable_types
  end
end
