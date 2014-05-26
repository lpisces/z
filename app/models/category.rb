class Category < ActiveRecord::Base
  validates :name, uniqueness: true, presence: true, length: { minimum: 2 }

  def children
    Category.where(:parent_id => id).all
  end

  def full_name
    full = name
    pid = parent_id 
    cnt = 0
    while pid != 0
      parent = Category.find_by_id(pid)
      break if parent.nil? or cnt > 3
      full = parent.name + '/' + full
      pid = parent.parent_id
      cnt += 1
    end
    full
  end

  def parent
      if id = parent_id
        parent_id = nil
      else
        parent = Category.find_by_id(pid)
      end
  end

end
