class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.string :sub_title
      t.integer :category_id
      t.text :summary
      t.integer :status

      t.timestamps
    end
  end
end
