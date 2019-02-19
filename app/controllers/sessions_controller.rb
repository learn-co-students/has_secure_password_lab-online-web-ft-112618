class SessionsController < ApplicationController
  def create
    user = User.find_by(name: params[:user][:name])
    valid_user = user.authenticate(params[:user][:password])
    session[:user_id] = valid_user&.id
  end

  def destroy
    session.delete :user_id
  end
end
