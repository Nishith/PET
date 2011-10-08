class RemoveLifecycleIdFromProjects < ActiveRecord::Migration
  def self.up
    remove_column :projects, :lifecycle_id
    add_column :projects, :lifecycle_name, :string
  end

  def self.down
    add_column :projects, :lifecycle_id, :integer
    remove_column :projects, :lifecycle_name
  end
end
