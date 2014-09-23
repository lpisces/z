class CpanelPolicy < Struct.new(:user, :cpanel)

  def index?
    user.admin?
  end

  def show?
    user.admin?
  end

  def new?
    user.admin?
  end

  def create?
    user.admin?
  end

  def update?
    user.admin?
  end

end
