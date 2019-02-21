
class SessionsController < ApplicationController

    #binding.pry
    #session[:password] = params[:password]

    def create
       user = User.find_by(name: params[:user][:name])

       user = user.try(:authenticate, params[:user][:password])

       return redirect_to(controller: 'sessions', action: 'new') unless user

       session[:user_id] = user.id

       @user = user

       redirect_to controller: 'users', action: 'show'
    end


  end
