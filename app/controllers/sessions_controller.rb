class SessionsController < ApplicationController

  def new

  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Successfully Signed Out!"
    redirect_to '/'
  end

  def create
    user = User.find_by_username(login_params[:username])
    if user && user.authenticate(login_params[:password])
      session[:user_id] = user.id
      flash[:notice] = "Successfully Signed In!"
      redirect_to '/'
    else
      flash[:notice] = "Unsuccessful Sign In Attempt!"
      render :new
    end
  end

  private

  def login_params
    params.permit(:username, :password)
  end

end
