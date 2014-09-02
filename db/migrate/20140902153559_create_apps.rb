class CreateApps < ActiveRecord::Migration
  def change
    create_table :apps do |t|
      t.string :name
      t.integer :app_id
      t.integer :app_type

      t.timestamps
    end
  end
end
