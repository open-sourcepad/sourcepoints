class UserPointsController < ApplicationController

  def create
    user_point = UserPoint.new(user_points_params)
    user_point.category = category(params[:score].to_i)
    user_point.save
    
    redirect_to root_path
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
