class HomeController < ApplicationController
  def index
    @categories = Category.where(:parent_id => 0).all
  end
end
