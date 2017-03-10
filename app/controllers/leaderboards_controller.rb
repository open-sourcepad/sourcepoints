class LeaderboardsController < ApplicationController
  before_action :authenticate_user!

  def show
    @projects = Project.all
    @users = User.all
  end
end
