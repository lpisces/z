class RemoveGroupsFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :groups, :string
  end
end
