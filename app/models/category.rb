class Category < ActiveRecord::Base
  validates :name, uniqueness: true

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

end
