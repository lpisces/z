class ChangeAuthentication < ActiveRecord::Migration
  def change
    change_table :authentications do |t|
      t.rename :provider_id, :uid
    end
  end
end
