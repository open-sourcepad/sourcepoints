class LeaderboardsController < ApplicationController
  before_action :authenticate_user!

  def show
    @projects = Project.all.order(name: :asc)
    @users = User.all.order(nickname: :asc)
  end
end
