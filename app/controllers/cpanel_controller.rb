class CpanelController < ApplicationController
  before_action :admin_required

#  include Pundit
#
#  def index
#    authorize :cpanel, :index?
#    #redirect_to categories_path
#  end
end
