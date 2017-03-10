class Admin::DashboardController < AdminController

  def index
    @users = User.all
    @projects = Project.all
  end
end
