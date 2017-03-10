class Admin::DashboardController < AdminController

  def index
    @users = User.all.order(:id)
    @projects = Project.all.order(:id)
  end
end
