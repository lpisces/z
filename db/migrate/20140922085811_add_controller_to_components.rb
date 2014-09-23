class AddControllerToComponents < ActiveRecord::Migration
  def change
    add_column :components, :controller, :string
    add_column :components, :action, :string
  end
end
