class CpanelUserPolicy < CpanelPolicy

  def index?
    user.admin?
  end

end
