class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(
      username: params[:user][:username],
      email: params[:user][:email],
      password: params[:user][:password]
      )

      if params[:user][:password] == params[:user][:password_confirmation] 
        @user.save
        log_in(@user)
        redirect_to cities_path
      else
        @error = "Password confirmation must match Password"
        render :new
      end
  
  end
end
