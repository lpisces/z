class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.integer :order, :default => 0
      t.boolean :is_parent, :default => false
      t.integer :level, :default => 1
      t.integer :parent_id, :default => 0

      t.timestamps
    end
  end
end
