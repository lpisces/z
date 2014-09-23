class CreateCpanelSettings < ActiveRecord::Migration
  def change
    create_table :cpanel_settings do |t|
      t.string :key
      t.string :value
      t.string :group
      t.string :desc

      t.timestamps
    end
  end
end
