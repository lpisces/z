class AddIsParentToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :is_parent, :boolean, :default => false
  end
end
