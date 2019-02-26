class UsersController < ApplicationController
  def new

   end

   def create
    if user_params[:password] == user_params[:password_confirmation]
      @user = User.create(user_params)
    end

     if @user
      session[:user_id] = @user.id
      redirect_to welcome_path
    else
      redirect_to signup_path
    end
  end

   private

   def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
