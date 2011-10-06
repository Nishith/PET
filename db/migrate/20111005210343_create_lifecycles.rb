class CreateLifecycles < ActiveRecord::Migration
  def self.up
    create_table :lifecycles do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :lifecycles
  end
end
