class CreateCpanelComponents < ActiveRecord::Migration
  def change
    create_table :components do |t|
      t.string :component
      t.string :sub
      t.boolean :status

      t.timestamps
    end
  end
end
