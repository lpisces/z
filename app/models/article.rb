class Article < ActiveRecord::Base
  enum status: [:draft, :ready, :published, :disabled]

  has_many :contents, :dependent => :destroy
  belongs_to :category

  def content
    cache = ''
    contents.each do |c|
      cache += c.content
    end
    cache
  end

  def content= (content)
    return nil if content.nil? 
    Content.where(:article_id => id).delete_all
    wc = 0
    page = 1
    cache = ''
    content.split("\n").each do |p|
      wc += p.length
      cache += p 
      if wc > 1000
         Content.where(:article_id => id, :content => cache, :page => page).first_or_create
         cache = ''
         wc = 0
         page += 1
      end
    end
    content
  end
end
