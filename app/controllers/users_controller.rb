class UsersController < ApplicationController
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(
      first_name: params[:user][:first_name],
      last_name: params[:user][:last_name],
      username: params[:user][:username],
      email: params[:user][:email],
      password: params[:user][:password]
      )

    if @user.save
      log_in(@user)
      redirect_to cities_path
    else
      render :new
    end
  end
  
end
