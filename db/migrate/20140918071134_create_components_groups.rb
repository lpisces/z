class CreateComponentsGroups < ActiveRecord::Migration
  def change
    create_table :components_groups do |t|
      t.string :component_id
      t.string :group_id

      t.timestamps
    end
  end
end
