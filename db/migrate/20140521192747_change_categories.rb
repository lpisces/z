class ChangeCategories < ActiveRecord::Migration
  def change
    remove_column :categories, :deleted_at
    remove_column :categories, :is_parent
    remove_column :categories, :level
  end
end
