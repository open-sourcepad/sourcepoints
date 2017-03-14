class Admin::DashboardController < AdminController

  def index
    @users = User.all.order(:id)
    @projects = Project.all.order(:id)
    @points = UserPoint.joins(:user).all.order(:id)
    @redeemables = Redeemable.all.order(:id)
  end
end
