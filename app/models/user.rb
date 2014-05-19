class User < ActiveRecord::Base

  validates :email, uniqueness: true
  validates_format_of :email, :with => /\A[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,}\z/i
  validates :nick, uniqueness: true, length: {maximum: 32, minimum: 4}
  has_many :authentications

  def self.find_or_create_from_auth_hash(hash)
    @user = self.where(email: hash['info']['email']).first_or_create
    @auth = Authentication.where(uid: hash['uid'], provider: hash['provider'], user_id: @user.id).first_or_create if not @user.nil?
    @user
  end

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end

  def send_password_reset_mail
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save!
    ForgotPasswordMailer.ready(self).deliver
  end

end
