class CreateContents < ActiveRecord::Migration
  def change
    create_table :contents do |t|
      t.text :content
      t.integer :page
      t.integer :article_id

      t.timestamps
    end
  end
end
