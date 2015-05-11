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

    if @user.save
      log_in(@user)
      redirect_to cities_path
    else
      render :new
    end
  end

end
