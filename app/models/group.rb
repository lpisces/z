class Group < ActiveRecord::Base
  validates :name, uniqueness: true, length: {maximum: 32, minimum: 1}
  has_and_belongs_to_many :components
  has_and_belongs_to_many :users
end
