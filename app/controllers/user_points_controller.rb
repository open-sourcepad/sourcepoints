class UserPointsController < ApplicationController

  def new
    @user_point = UserPoint.new
    @project = Project.find(params[:project_id])
    @user = User.find(params[:user_id])
    @points = UserPoint.all.where(user_id: @user.id, project_id: @project.id)
  end

  def create
    @user_point = UserPoint.new(user_points_params)
    @user_point.category = category(params[:score].to_i)
    @user_point.save
  end

  def destroy
    @user_point = UserPoint.find(params[:id])
    @user_point.destroy
  end

  private

  def user_points_params
    params.require(:user_points).permit(:project_id, :score, :remarks, :user_id)
  end

  def category(score)
    if score < 5 && score > 0
      "Shout out"
    elsif score == 5
      "CIT"
    end
  end
end
