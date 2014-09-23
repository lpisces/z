class Cpanel::UserGroupController < CpanelController
  def index
    @cpanel_users = Cpanel::User.all
    @cpanel_groups = Cpanel::Group.all
  end
end
