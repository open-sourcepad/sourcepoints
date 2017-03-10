class Admin::UsersController < AdminController

  before_action :set_user, only: [:edit, :update, :destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.save
  end

  def edit
  end

  def update
    @user.update(user_params)
  end

  def destroy
    @user.destroy
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(
        :id,
        :first_name,
        :last_name,
        :nickname,
        :email,
        :role,
        :password,
        :avatar,
        user_project_designations_attributes: [:id, :_destroy, :user_id, :project_id]
      )
    end
end
