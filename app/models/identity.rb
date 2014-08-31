class Identity < OmniAuth::Identity::Models::ActiveRecord
  validates :email, uniqueness: true
  validates_format_of :email, :with => /\A[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,}\z/i
  validates :password, presence: true, length: { minimum: 8 }
  validates :password, confirmation: true
  validates :password_confirmation, presence: true
  has_secure_password
end
