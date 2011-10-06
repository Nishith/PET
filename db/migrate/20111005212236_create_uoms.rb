class CreateUoms < ActiveRecord::Migration
  def self.up
    create_table :uoms do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :uoms
  end
end
