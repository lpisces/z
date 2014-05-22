class Article < ActiveRecord::Base
  enum status: [:draft, :ready, :published, :disabled]

  has_many :contents

  def content
  end
end
