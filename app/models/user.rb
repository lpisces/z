class User < ActiveRecord::Base

  def self.find_or_create_from_auth_hash(hash)
    @user = self.where(email: hash['info']['email']).first_or_create
    @auth = Authentication.where(uid: hash['uid'], provider: hash['provider'], user_id: @user.id).first_or_create if not @user.nil?
    @user
  end

end
