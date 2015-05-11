class SessionsController < ApplicationController

  def new
    @error
  end

  def create
    @user = User.find_by(email: params[:session][:email].downcase)
    if @user && @user.authenticate(params[:session][:password])
      log_in @user
      redirect_to cities_path
    else
      # Create an error message.
      @error = 'Invalid email/password combination.'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end

end
