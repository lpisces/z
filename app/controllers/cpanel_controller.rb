class CpanelController < ApplicationController
  def index
    redirect_to categories_path
  end
end
