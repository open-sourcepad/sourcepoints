class Admin::UsersController < AdminController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.save
  end

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :nickname, :email, :role, :password)
    end
end
