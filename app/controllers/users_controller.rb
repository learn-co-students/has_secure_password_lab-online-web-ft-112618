class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.create(user_params)

    if params[:password] != params[:password_confirmation]
      redirect_to '/login'
    else
      session[:user_id] = @user.id
      redirect_to '/users/new'
    end
  end

  def show
  end 

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
